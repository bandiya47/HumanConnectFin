package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterMypageService;
import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CenterMypageControllerImpl implements CenterMypageController {
	@Autowired
	private CenterMypageService centerMypageService;

	private MypageVO mypageVO;

	@Override
	@RequestMapping(value = "/centerPrivacyList", method = RequestMethod.GET)
	public ModelAndView centerPrivacyList(@RequestParam("centerId") String centerId,
										  HttpServletRequest request,
										  HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		try {
			mypageVO = centerMypageService.centerPrivacyList(centerId);
			//jsp 안에 객체 추가
			mav.addObject("CMyinfo", mypageVO);
			mav.addObject("centerId", centerId);
			//jsp 불러옴. jsp는 안써도 됨.
			mav.setViewName("centerMypagePrivacyCheck");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}


	//수정하는 창으로 넘어감
	@Override
	@RequestMapping(value = "/centerUpdatePrivacy", method = RequestMethod.POST)
	public ModelAndView centerUpdatePrivacy(@RequestParam("centerId") String centerId,
											HttpServletRequest request,
											HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("centerMypagePrivacyEdit");
			mypageVO = centerMypageService.centerPrivacyList(centerId);
			//jsp 안에 객체 추가
			mav.addObject("CMyinfo", mypageVO);
			mav.addObject("centerId", centerId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	//수정입력을 저장해줌
	@Override
	@RequestMapping(value = "/centerSavePrivacy", method = RequestMethod.POST)
	public ModelAndView centerSavePrivacy(@ModelAttribute() MypageVO mypageVO,
									HttpServletRequest request,
									HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String centerId = mypageVO.getC_id();    //c_id를 useId라고 선언
		try {
			int CsaveResult = 0;
			CsaveResult = centerMypageService.updateCenterDetails(mypageVO);
			if (CsaveResult == 1) {
				mypageVO = centerMypageService.centerPrivacyList(centerId);
				//jsp 안에 객체 추가
				mav.addObject("CMyinfo", mypageVO);
				mav.addObject("centerId", centerId);
				//jsp 불러옴. jsp는 안써도 됨.
				mav.setViewName("centerMypagePrivacyCheck"); //privacyList 랑 같은
			} else {
				mav.setViewName("centerMypagePrivacyEdit");
				mypageVO = centerMypageService.centerPrivacyList(centerId);
				//jsp 안에 객체 추가
				mav.addObject("CMyinfo", mypageVO);
				mav.addObject("centerId", centerId);    //전 페이지 그대로
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}


//	//비밀번호 확인하는 창으로 넘어감
	@Override
	@RequestMapping(value = "/showCenterPrivacyPw", method = RequestMethod.POST)
	public ModelAndView showCenterPrivacyPw(@RequestParam("centerId") String centerId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(centerId);

		try {
			mav.setViewName("centerMypagePrivacyPw");

			//jsp 안에 객체 추가

			mav.addObject("centerId", centerId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	//비밀번호 입력을 처리해줌
	@Override
	@RequestMapping(value = "/checkCenterPrivacyPw", method = RequestMethod.POST)
	public ModelAndView checkCenterPrivacyPw(@RequestParam(name = "centerId") String centerId,
											   @RequestParam(name = "c_pwd") String c_pwd,
											   HttpServletRequest request,
											   HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		//String centerId = mypageVO.getC_id();
		try {
			int cprivacycount = centerMypageService.checkCenterPrivacyPw(centerId, c_pwd);
			if (cprivacycount == 1) {
				mav.setViewName("centerMypagePrivacyCheck");
				mypageVO = centerMypageService.centerPrivacyList(centerId);
				//jsp 안에 객체 추가
				mav.addObject("CMyinfo", mypageVO);
				mav.addObject("centerId", centerId);
			} else {

				mav.setViewName("showCenterPrivacyPw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}


	}


