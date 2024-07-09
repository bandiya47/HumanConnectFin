package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.service.MypageService;
import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;
import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MypageControllerImpl implements MypageController {
	@Autowired
	private MypageService mypageService;

	private MypageVO mypageVO;

	@Override
	@RequestMapping(value = "/privacyList", method = RequestMethod.GET)
	public ModelAndView privacyList(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			mypageVO = mypageService.privacyList(userId);
			//jsp 안에 객체 추가
			mav.addObject("myinfo", mypageVO);
			mav.addObject("userId", userId);
			//jsp 불러옴. jsp는 안써도 됨.
			mav.setViewName("mypagePrivacyCheck");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}



	//수정하는 창으로 넘어감
	@Override
	@RequestMapping(value = "/updatePrivacy", method = RequestMethod.POST)
	public ModelAndView updatePrivacy(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("mypagePrivacyEdit");
			mypageVO = mypageService.privacyList(userId);
			//jsp 안에 객체 추가
			mav.addObject("myinfo", mypageVO);
			mav.addObject("userId", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	//수정입력을 저장해줌
	@Override
	@RequestMapping(value = "/savePrivacy", method = RequestMethod.POST)
	public ModelAndView savePrivacy(@ModelAttribute() MypageVO mypageVO,
									HttpServletRequest request,
									HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String userId = mypageVO.getU_id();    //u_id를 useId라고 선언
		try {
			int saveResult = 0;
			saveResult = mypageService.updateUserDetails(mypageVO);
			if (saveResult == 1) {
				mypageVO = mypageService.privacyList(userId);
				mav.addObject("myinfo", mypageVO);
				mav.addObject("userId", userId);
				mav.setViewName("mypagePrivacyCheck"); //privacyList 랑 같은
			} else {
				mav.setViewName("mypagePrivacyEdit");
				mypageVO = mypageService.privacyList(userId);
				//jsp 안에 객체 추가
				mav.addObject("myinfo", mypageVO);
				mav.addObject("userId", userId);    //전 페이지 그대로
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}


	//	//비밀번호 확인하는 창으로 넘어감
	@Override
	@RequestMapping(value = "/showPrivacyPw", method = RequestMethod.POST)
	public ModelAndView showPrivacyPw(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("mypagePrivacyPw");
			//mypageVO = mypageService.privacyList(userId);
			//jsp 안에 객체 추가
			//mav.addObject("myinfo", mypageVO);
			mav.addObject("userId", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	//비밀번호 입력을 처리해줌
	@Override
	@RequestMapping(value = "/checkPrivacyPw", method = RequestMethod.POST)
	public ModelAndView checkPrivacyPw(@RequestParam(name="userId") String userId,
									   @RequestParam(name="u_pwd") String u_pwd,
									   HttpServletRequest request,
									   HttpServletResponse response) throws Exception {
		String u_id=userId;
		ModelAndView mav = new ModelAndView();
		System.out.println(userId);
		System.out.println(u_pwd);
		try {
			int privacycount = mypageService.checkPrivacyPw(userId, u_pwd);
			if (privacycount == 1) {
				mav.setViewName("mypagePrivacyCheck");
				mypageVO = mypageService.privacyList(userId);
				//jsp 안에 객체 추가
				mav.addObject("myinfo", mypageVO);
				mav.addObject("userId", userId);
			} else {

				mav.setViewName("showPrivacyPw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	//회원 탈퇴
	@Override
	@RequestMapping(value="/removePrivacy" ,method = RequestMethod.POST)/*경로*/
	public ModelAndView removePrivacy(@RequestParam("userId") String userId,
									  HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		mypageService.removePrivacy(userId);
		ModelAndView mav = new ModelAndView();/*경로*/
		try {
			mypageVO = mypageService.privacyList(userId);
			//jsp 안에 객체 추가
			mav.addObject("myinfo", mypageVO);
			mav.addObject("userId", userId);
			//jsp 불러옴. jsp는 안써도 됨.
			mav.setViewName("mypagePrivacyCheck");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

	//봉사마이페이지
	@Override
	@GetMapping("/mypageVol")
	public ModelAndView showMypage(
			@RequestParam("userId") String userId
	) {
		System.out.println("Received userId: " + userId);
		ModelAndView mav = new ModelAndView("mypageVolunteerCheck");
		List<MypageVO> mypageVolunteerList = mypageService.getMypageVolunteerList(userId);
		mav.addObject("mypageVolunteerList", mypageVolunteerList);
		mav.addObject("userId", userId);
//            System.out.println("Main Controller Printing **myVolunteerList**: " + myVolunteerList);
//            System.out.println("Main Controller Printing **myAdpotList**: " + myAdpotList);
//            System.out.println("Main Controller Printing **approachVolList**: " + approachVolList);
		return mav;
	}
	//	@Override
	//	@GetMapping("/main")
	//	public ModelAndView showMain(
	//			@RequestParam("userId") String userId
	//	) {
	//		System.out.println("Received userId: " + userId);
	//		ModelAndView mav = new ModelAndView("main");
	//		List<MainVO> myVolunteerList = mainService.getMyVolunteerList(userId);
	//		mav.addObject("myVolunteerList", myVolunteerList);
	//		mav.addObject("userId", userId);
	////            System.out.println("Main Controller Printing **myVolunteerList**: " + myVolunteerList);
	////            System.out.println("Main Controller Printing **myAdpotList**: " + myAdpotList);
	////            System.out.println("Main Controller Printing **approachVolList**: " + approachVolList);
	//		return mav;
	//	}



	// 비밀번호 입력을 처리해줌.
//	@Override
//	@RequestMapping(value = "/checkPrivacyPw", method = RequestMethod.POST)
//	public ModelAndView checkPrivacyPw(@ModelAttribute MypageVO mypageVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//
//		String userId = mypageVO.getU_id();
//		String password = mypageVO.getU_pwd();
//
//		boolean isPasswordCorrect = mypageService.checkPrivacyPw(mypageVO);
//
//		if (isPasswordCorrect) {
//			mav.setViewName("forward:/privacyList"); // 비밀번호가 일치하면 privacyList 페이지로 포워딩
//		} else {
//			mav.setViewName("mypagePrivacyPw");
//			mav.addObject("error", "비밀번호가 일치하지 않습니다.");
//			mav.addObject("userId", userId);
//		}
//		return mav;
//	}
//}

//	@Override
//	@RequestMapping(value="/goMypage" ,method = RequestMethod.POST)
//	public ModelAndView goMypage(){
//		try{
//			MypageVO mypageVO1
//		}catch(Exception e){
//			e.printStackTrace();
//		}




}