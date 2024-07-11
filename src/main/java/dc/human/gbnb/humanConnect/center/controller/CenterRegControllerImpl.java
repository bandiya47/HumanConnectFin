package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterMainService;
import dc.human.gbnb.humanConnect.center.service.CenterRecruitListService;
import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import dc.human.gbnb.humanConnect.center.vo.CenterRecruitListVO;
import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import dc.human.gbnb.humanConnect.center.service.CenterRegService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.io.File;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.*;


@Controller("centerRegController")
@RestController
public class CenterRegControllerImpl implements CenterRegController {
	@Autowired
	private CenterRegService centerRegService;

	@Autowired
	private CenterMainService centerMainService;

	@Autowired
	private CenterRecruitListService centerRecruitListService;

	@Autowired
	private CenterRegVO centerRegVO ;

	private static final String CURR_IMAGE_REPO_PATH = "c:\\spring\\image_repo";

	@Override
	@RequestMapping(value= "/viewCenterReg.do", method = RequestMethod.GET)
	public ModelAndView viewCenterReg(HttpServletRequest request, HttpServletResponse response,
									  @RequestParam("centerId") String centerId,
									  @RequestParam("v_no") int v_no,
									  @RequestParam(value = "page", defaultValue = "1") int page,
									  @RequestParam(value = "size", defaultValue = "7") int size) throws Exception {

		ModelAndView mav = new ModelAndView("/centerReg");

		List<CenterRegVO> Result = centerRegService.listIdCenterReg(centerId);
		mav.addObject("centerList2", Result);
		mav.addObject("centerId", centerId);

		List<CenterRegVO> Result2 = centerRegService.listCenterReg(v_no);
		mav.addObject("centerList", Result2);
		mav.addObject("job", "view");
		mav.addObject("recruitmentList", centerRegService.getRecruitmentList(centerId, v_no, page, size));
		mav.addObject("v_no", v_no);
		System.out.println(Result2.get(0).getvTitle());

		// 페이지네이션 처리
		int totalRecords = centerRegService.getTotalRecruitments(centerId, v_no);
		int totalPages = (int) Math.ceil((double) totalRecords / size);
		mav.addObject("totalPages", totalPages);
		mav.addObject("currentPage", page);

		return mav;
	}

	@Override
	@PostMapping("/viewCenterReg.do")
	public ModelAndView handlePostRequest(
			@RequestParam("action") String action,
			@RequestParam("userId") String userId,
			@RequestParam("centerId") String centerId,
			@RequestParam("section") String section,
			@RequestParam(value = "rejectReason", required = false) String rejectReason,
			@RequestParam("resNo") String resNo,
			@RequestParam("v_no") int v_no
	) {
		int updateRow = 0;

		try {
			if ("approve".equals(action)) {
				if ("recruitment".equals(section)) {
					updateRow = centerRegService.updateRecruitmentStatus(userId, 1, null, centerId, resNo);
				}
			} else if ("reject".equals(action)) {
				if ("recruitment".equals(section)) {
					rejectReason = rejectReason == null ? "" : rejectReason;
					updateRow = centerRegService.updateRecruitmentStatus(userId, 2, rejectReason, centerId, resNo);
				}
			} else if ("complete".equals(action)) {
				if ("recruitment".equals(section)) {
					updateRow = centerRegService.updateRecruitmentStatus(userId, 3, null, centerId, resNo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 예외 처리 로직 추가
		}

		ModelAndView mav = new ModelAndView("redirect:/viewCenterReg.do");
		mav.addObject("centerId", centerId);
		mav.addObject("v_no", v_no);
		if (updateRow > 0) {
			mav.addObject("message", "수정되었습니다");
		} else {
			mav.addObject("message", "다시 확인해주세요");
		}

		return mav;
	}



	@Override
	@RequestMapping(value= "/centerReg.do", method = RequestMethod.GET)
	public ModelAndView centerReg(HttpServletRequest request, HttpServletResponse response, @RequestParam("centerId") String centerId) throws Exception {


		List<CenterRegVO> Result = centerRegService.listIdCenterReg(centerId);
		ModelAndView mav = new ModelAndView("/centerReg");
		mav.addObject("centerList2",Result);
		mav.addObject("centerId", centerId);
		return mav;
	}

	@Override
	@RequestMapping(value= "/modifyCenterReg.do", method = RequestMethod.GET)
	public ModelAndView modifyCenterReg(HttpServletRequest request, HttpServletResponse response,
									  @RequestParam("centerId") String centerId,
									  @RequestParam("v_no") int v_no) throws Exception {


		List<CenterRegVO> Result = centerRegService.listIdCenterReg(centerId);
		List<CenterRegVO> Result2 = centerRegService.listCenterReg(v_no);

		ModelAndView mav = new ModelAndView("/centerReg");
		String job="modify";
		mav.addObject("job",job);
		mav.addObject("centerList2",Result);
		mav.addObject("centerList",Result2);
		mav.addObject("centerId", centerId);
		mav.addObject("v_no", v_no);
		return mav;
	}


	@Override
	@RequestMapping(value="/addCenterReg.do" ,method = RequestMethod.POST)
	@ResponseBody
	public List<CenterRegVO> addCenterReg(@ModelAttribute("centerReg") CenterRegVO centerReg,
										  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int insert = 0;


		insert = centerRegService.addCenterReg(centerReg);
		int v_no = centerRegService.v_noCenterReg();
		List<CenterRegVO> centerList = centerRegService.listCenterReg(v_no);
		return centerList;
	}

	@PostMapping("/updateCenterReg.do")
	public ModelAndView updateCenterReg(@ModelAttribute("centerReg") CenterRegVO centerReg,
										HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int insert = centerRegService.updateCenterReg(centerReg);
		int v_no = centerReg.getV_no();
		String centerId = centerReg.getuId();

		ModelAndView mav = new ModelAndView("redirect:/viewCenterReg.do");
		mav.addObject("centerId", centerId);
		mav.addObject("v_no", v_no);

		return mav;
	}

	@Override
	@RequestMapping(value="/upload",method = RequestMethod.POST)
	@ResponseBody
	public Map upload(MultipartHttpServletRequest multipartRequest,HttpServletResponse response)
			throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map map = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			//System.out.println(name+", "+value);
			map.put(name,value);
		}

		List fileList= fileProcess(multipartRequest);
		map.put("fileList", fileList);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("map", map);
//		mav.setViewName("result");
//		return mav;
		return map;
	}


	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //경로상에 파일이 존재하지 않을 경우
					if(file.getParentFile().mkdirs()){ //경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); //이후 파일 생성
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+ originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
			}
		}
		return fileList;
	}

	@Override
	@RequestMapping("/CenterDownload")
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
