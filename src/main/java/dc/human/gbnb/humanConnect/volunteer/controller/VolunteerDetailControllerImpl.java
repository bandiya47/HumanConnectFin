package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerDetailVO;
import dc.human.gbnb.humanConnect.volunteer.service.VolunteerDetailService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.io.File;

import java.util.*;


@Controller("volunteerDetailController")
public class VolunteerDetailControllerImpl implements VolunteerDetailController {
	@Autowired
	private VolunteerDetailService volunteerDetailService;
	
	@Autowired
	private VolunteerDetailVO volunteerDetailVO ;

	private static final String CURR_IMAGE_REPO_PATH = "c:\\spring\\upload_volunteer";

	@Override
	@RequestMapping(value= "/viewVolunteerDetail.do", method = RequestMethod.GET)
	public ModelAndView viewVolunteerDetail(HttpServletRequest request, HttpServletResponse response,
											@RequestParam("userId") String userId,
											@RequestParam("v_no") int v_no) throws Exception {


		List<VolunteerDetailVO> Result = volunteerDetailService.listVolunteerDetail(v_no);
		System.out.println(Result.get(0).getvTitle());
		ModelAndView mav = new ModelAndView("/volunteerDetail");

		String job="View";
		int userType =1;
		mav.addObject("job",job);
		mav.addObject("userType",userType);
		mav.addObject("volunteerList",Result);
		mav.addObject("userId", userId);
		return mav;
	}

	@Override
	@RequestMapping(value= "/regVolunteerDetail.do", method = RequestMethod.POST)
	public ModelAndView regVolunteerDetail(HttpServletRequest request, HttpServletResponse response,
											@RequestParam("userId") String userId,
											@RequestParam("v_no") int v_no) throws Exception {


		List<VolunteerDetailVO> Result = volunteerDetailService.listVolunteerDetail(v_no);
		System.out.println(Result.get(0).getvTitle());
		ModelAndView mav = new ModelAndView("/volunteerDetail");

		String job="Regist";
		int userType =1;
		mav.addObject("job",job);
		mav.addObject("userType",userType);
		mav.addObject("volunteerList",Result);
		mav.addObject("userId", userId);
		return mav;
	}

	@Override
	@RequestMapping(value= "/insertVolunteerDetail.do", method = RequestMethod.POST)
	public ModelAndView insertVolunteerDetail(@ModelAttribute("volunteerDetail") VolunteerDetailVO volunteerDetail,
											HttpServletRequest request, HttpServletResponse response,
											@RequestParam("userId") String userId) throws Exception {


		int insert = 0;
		insert = volunteerDetailService.addVolunteerDetail(volunteerDetail);
		int vReg_no = volunteerDetailService.v_noVolunteerDetail();
		volunteerDetail.setvReg_no(vReg_no);
		insert = volunteerDetailService.addVolunteerDetail2(volunteerDetail);
		List<VolunteerDetailVO> Result = volunteerDetailService.listRegVolunteerDetail(vReg_no);
		System.out.println(Result.get(0).getvTitle());
		ModelAndView mav = new ModelAndView("/volunteerDetail");

		String job="View";
		int userType =1;
		mav.addObject("job",job);
		mav.addObject("userType",userType);
		mav.addObject("volunteerList",Result);
		mav.addObject("userId", userId);
		return mav;
	}

	@Override
	@RequestMapping(value="/uploadVolunteerDetail",method = RequestMethod.POST)
	@ResponseBody
	public Map uploadVolunteerDetail(MultipartHttpServletRequest multipartRequest,HttpServletResponse response)
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






	}
