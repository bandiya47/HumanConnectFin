package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.service.MypageService;
import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class MypageControllerImpl implements MypageController {
	@Autowired
	private MypageService mypageService;

	private MypageVO mypageVO;

	@Override
	@RequestMapping(value= "/privacyList", method = RequestMethod.GET)/*경로*/
	public ModelAndView privacyList(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		try{

			mypageVO=mypageService.privacyList(userId);
			//jsp 안에 객체 추가
			mav.addObject("myinfo", mypageVO);
			//jsp 불러옴. jsp는 안써도 됨.
			mav.setViewName("mypagePrivacyCheck");
		}catch(Exception e){
			e.printStackTrace();
		}


		return mav;
	}
//	@Override
//	@RequestMapping(value= "/privacyList", method = RequestMethod.GET)/*경로*/
//	public ModelAndView privacyList(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		ModelAndView mav=new ModelAndView();
//		try{
//
//			mypageVO=mypageService.privacyList(userId);
//			String u_name= mypageVO.getU_name();
//			String u_id = mypageVO.getU_id();
//			String u_pwd = mypageVO.getU_pwd();
//			String u_email = mypageVO.getU_email();
//			String u_phone  = mypageVO.getU_phone();
//			String u_addr1  = mypageVO.getU_addr1();
//			String u_addr2 = mypageVO.getU_addr2();
//
//
//			//jsp 안에 객체 추가
//			mav.addObject("myinfo", mypageVO);
////			mav.addObject("u_name", u_name);
////			mav.addObject("u_id", u_id);
////			mav.addObject("u_pwd", u_pwd);
////			mav.addObject("u_email", u_email);
////			mav.addObject("u_phone", u_phone);
////			mav.addObject("u_addr1", u_addr1);
////			mav.addObject("u_addr2", u_addr2);
//
//
//
//			//jsp 불러옴. jsp는 안써도 됨.
//			mav.setViewName("mypagePrivacyCheck");
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//
//
//		return mav;
//	}

	@Override
	@RequestMapping(value= "/CenterprivacyList", method = RequestMethod.GET)/*경로*/
	public ModelAndView CenterprivacyList(@RequestParam("centerId") String centerId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		try{

			mypageVO=mypageService.privacyList(centerId);
			//jsp 안에 객체 추가
			mav.addObject("myinfo", mypageVO);
			//jsp 불러옴. jsp는 안써도 됨.
			mav.setViewName("mypagePrivacyCheck");
		}catch(Exception e){
			e.printStackTrace();
		}


		return mav;
	}

	@Override
	@RequestMapping(value="/privacyEdit.do" ,method = RequestMethod.GET)/*경로*/
	public ModelAndView privacyEdit(@RequestParam("u_id") String u_id,
									 HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		mypageService.privacyEdit(u_id);
		ModelAndView mav = new ModelAndView("redirect:/mypagePrivacyEdit");/*경로*/
		return mav;
	}

//	@Override
//	@RequestMapping(value="/goMypage" ,method = RequestMethod.POST)
//	public ModelAndView goMypage(){
//		try{
//			MypageVO mypageVO1
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//
//
//	}


}
