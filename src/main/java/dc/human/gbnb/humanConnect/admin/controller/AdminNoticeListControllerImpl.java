package dc.human.gbnb.humanConnect.admin.controller;

import dc.human.gbnb.humanConnect.admin.service.AdminNoticeListService;
import dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDate;
import java.util.*;

@Controller
public class AdminNoticeListControllerImpl implements AdminNoticeListController {

    @Autowired
    private AdminNoticeListService adminNoticeListService;

    private static final int PAGE_SIZE = 10;

    private static final String CURR_IMAGE_REPO_PATH = "c:\\spring\\image_repo";

    @Override
    @GetMapping("/adminNoticeList.do")
    public ModelAndView adminNoticeList(@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
        int totalNotices = adminNoticeListService.getTotalNoticeCount();
        int totalPages = (int) Math.ceil((double) totalNotices / PAGE_SIZE);
        int offset = (page - 1) * PAGE_SIZE;

        List<AdminNoticeListVO> adminNoticeList = adminNoticeListService.getNoticeList(PAGE_SIZE, offset);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("adminNoticeList");
        mav.addObject("adminNoticeList", adminNoticeList);
        mav.addObject("currentPage", page);
        mav.addObject("totalPages", totalPages);
        return mav;
    }

    @Override
    @GetMapping("/viewNoticeDetail.do")
    public ModelAndView viewNoticeDetail(HttpServletRequest request, HttpServletResponse response,
                                         @RequestParam("nNumber") String nNumber) throws Exception {
        AdminNoticeListVO Result = adminNoticeListService.getNoticeDetail(Integer.parseInt(nNumber));
        ModelAndView mav = new ModelAndView("/adminNoticeDetail");
        mav.addObject("noticeList", Result);
        return mav;
    }

    @PostMapping("/deleteNoticesAjax")
    @ResponseBody
    public String deleteNoticesAjax(@RequestBody Map<String, List<Integer>> nNumbersMap) {
        List<Integer> nNumbers = nNumbersMap.get("nNumbers");
        try {
            adminNoticeListService.deleteNotices(nNumbers);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "success";
    }

    @PostMapping("/addNotice")
    public ModelAndView addNotice(@RequestParam("noticeTitle") String title,
                                  @RequestParam("noticeContent") String content,
                                  @RequestPart(value = "nAttachPath", required = false) MultipartFile file) {
        ModelAndView mav = new ModelAndView();
        AdminNoticeListVO notice = new AdminNoticeListVO();
        notice.setnTitle(title);
        notice.setnContent(content);
        notice.setnType("공지사항");
        notice.setuId("관리자");
        notice.setnDate(LocalDate.now().toString());

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String filePath = "C:\\upLoad" + File.separator + fileName;
            try {
                file.transferTo(new File(filePath));
                notice.setnAttachPath(filePath);
            } catch (IOException e) {
                e.printStackTrace();
                mav.addObject("result", "fileUpLoad_error");
                mav.setViewName("error");
                return mav;
            }
        }

        try {
            adminNoticeListService.addNotice(notice);
            AdminNoticeListVO resultNotice = adminNoticeListService.getLatestNotices();
            mav.addObject("noticeList", resultNotice);
            mav.setViewName("adminNoticeDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("result", "addNotice_error");
            mav.setViewName("error");
        }
        return mav;
    }

    @Override
    @PostMapping("/updateNoticeDetail")
    public ModelAndView updateNoticeDetail(@RequestParam("nNumber") int nNumber,
                                           @RequestParam("nTitle") String nTitle,
                                           @RequestParam("nContent") String nContent) throws Exception {
        AdminNoticeListVO notice = new AdminNoticeListVO();
        notice.setnNumber(nNumber);
        notice.setnTitle(nTitle);
        notice.setnContent(nContent);

        try {
            adminNoticeListService.updateNotice(notice);
            AdminNoticeListVO resultNotice = adminNoticeListService.getNoticeDetail(nNumber);
            ModelAndView mav = new ModelAndView("adminNoticeDetail");
            mav.addObject("noticeList", resultNotice);
            return mav;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("result", "updateNotice_error");
            return mav;
        }
    }

    @Override
    @RequestMapping(value = "/noticeUpload", method = RequestMethod.POST)
    @ResponseBody
    public Map upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
            throws Exception {
        multipartRequest.setCharacterEncoding("utf-8");
        Map map = new HashMap();
        Enumeration enu = multipartRequest.getParameterNames();
        while (enu.hasMoreElements()) {
            String name = (String) enu.nextElement();
            String value = multipartRequest.getParameter(name);
            //System.out.println(name+", "+value);
            map.put(name, value);
        }

        List fileList = fileProcess(multipartRequest);
        map.put("fileList", fileList);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("map", map);
//		mav.setViewName("result");
//		return mav;
        return map;
    }


    private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
        List<String> fileList = new ArrayList<String>();
        Iterator<String> fileNames = multipartRequest.getFileNames();
        while (fileNames.hasNext()) {
            String fileName = fileNames.next();
            MultipartFile mFile = multipartRequest.getFile(fileName);
            String originalFileName = mFile.getOriginalFilename();
            fileList.add(originalFileName);
            File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
            if (mFile.getSize() != 0) { //File Null Check
                if (!file.exists()) { //경로상에 파일이 존재하지 않을 경우
                    if (file.getParentFile().mkdirs()) { //경로에 해당하는 디렉토리들을 생성
                        file.createNewFile(); //이후 파일 생성
                    }
                }
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
            }
        }
        return fileList;
    }

    @Override
    @RequestMapping("/noticeDownload")
    public void CenterDownload(@RequestParam("imageFileName") String imageFileName,
                               HttpServletResponse response) throws Exception {
        OutputStream out = response.getOutputStream();
        String downFile = CURR_IMAGE_REPO_PATH + "/" + imageFileName;
        File file = new File(downFile);

        response.setHeader("Cache-Control", "no-cache");
        response.addHeader("Content-disposition", "attachment; filename=" + imageFileName);
        FileInputStream in = new FileInputStream(file);
        byte[] buffer = new byte[1024 * 8];
        while (true) {
            int count = in.read(buffer);
            if (count == -1)
                break;
            out.write(buffer, 0, count);
        }
        in.close();
        out.close();
    }
}