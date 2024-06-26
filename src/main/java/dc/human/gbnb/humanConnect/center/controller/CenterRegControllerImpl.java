package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import dc.human.gbnb.humanConnect.center.service.CenterRegService;
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


@Controller("centerRegController")
@RestController
public class CenterRegControllerImpl implements CenterRegController {
	@Autowired
	private CenterRegService centerRegService;
	
	@Autowired
	private CenterRegVO centerRegVO ;

	private static final String CURR_IMAGE_REPO_PATH = "c:\\spring\\image_repo";
	
	@Override
	@RequestMapping(value= "/centerReg.do", method = RequestMethod.GET)
	public ModelAndView centerReg(HttpServletRequest request, HttpServletResponse response, @RequestParam("centerId") String centerId) throws Exception {


		List<CenterRegVO> Result = centerRegService.listIdCenterReg(centerId);
		ModelAndView mav = new ModelAndView("/centerReg");
		mav.addObject("centerList",Result);
		mav.addObject("centerId", centerId);
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
		List<CenterRegVO> Result = centerRegService.listCenterReg(v_no);
		return Result;
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
	}
