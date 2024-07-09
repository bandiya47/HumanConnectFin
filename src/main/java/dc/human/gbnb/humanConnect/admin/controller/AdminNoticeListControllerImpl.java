package dc.human.gbnb.humanConnect.admin.controller;

import dc.human.gbnb.humanConnect.admin.service.AdminNoticeListService;
import dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller
public class AdminNoticeListControllerImpl implements AdminNoticeListController {

    @Autowired
    private AdminNoticeListService adminNoticeListService;

//    공지사항 게시글 목록
    @RequestMapping(method = RequestMethod.GET, value = "/adminNoticeList.do")
    public ModelAndView adminNoticeList() throws Exception {
        ModelAndView mav = new ModelAndView();
        List<AdminNoticeListVO> adminNoticeList = adminNoticeListService.getNoticeList();

        mav.setViewName("adminNoticeList"); // JSP 파일명 지정
        mav.addObject("adminNoticeList", adminNoticeList); // JSP에 데이터 전달
        return mav;
    }

//    공지사항 게시글 삭제
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

    //        공지사항 게시 등록
    @PostMapping("/addNotice")
    public ModelAndView addNotice(@RequestParam("noticeTitle") String title,
                                  @RequestParam("noticeContent") String content,
                                  @RequestPart(value = "nAttachPath", required = false)MultipartFile file) {
        System.out.println("Received noticeTitle: " + title);
        System.out.println("Received noticeContent: " + content);
        System.out.println("Received file: " + (file != null ? file.getOriginalFilename() : "No file uploaded"));

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

    @RequestMapping(value= "/viewNoticeDetail.do", method = RequestMethod.GET)
    public ModelAndView viewNoticeDetail(HttpServletRequest request, HttpServletResponse response,
                                         @RequestParam("nNumber") String nNumber) throws Exception {

        AdminNoticeListVO Result = adminNoticeListService.getNoticeDetail(Integer.parseInt(nNumber));
        ModelAndView mav = new ModelAndView("/adminNoticeDetail");

        mav.addObject("noticeList",Result);
        return mav;
    }


}

