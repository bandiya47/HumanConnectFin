package dc.human.gbnb.humanConnect.center.controller;

import java.util.List;

import dc.human.gbnb.humanConnect.center.service.MemberService;
import dc.human.gbnb.humanConnect.center.vo.MemberVO;
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

@Controller("memberController")
public class MemberControllerImpl  implements MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberVO memberVO ;


	/**
	 * 회원 목록을 조회합니다.
	 *
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 회원 목록을 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	@Override
	@RequestMapping(value= "/member/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//public String listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = (String)request.getAttribute("viewName");
		List membersList = memberService.listMembers();
		//ModelAndView mav = new ModelAndView(viewName);
		ModelAndView mav = new ModelAndView("/member/listMembers");
		
		mav.addObject("membersList", membersList);
		return mav;
	}


	/**
	 * 새로운 회원을 추가합니다.
	 *
	 * @param member 회원 정보를 포함한 MemberVO 객체
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 작업 결과를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}


	/**
	 * 기존 회원을 삭제합니다.
	 *
	 * @param u_id 삭제할 회원의 ID
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 작업 결과를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	@Override
	@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("u_id") String u_id,
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(u_id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}


	/**
	 * 회원 로그인을 처리합니다.
	 *
	 * @param member 로그인 정보를 포함한 MemberVO 객체
	 * @param rAttr 리다이렉트를 위한 RedirectAttributes 객체
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 로그인 결과를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	@Override
	@RequestMapping(value = "/member/login.do", method =  RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
			                  RedirectAttributes  rAttr,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			
			String action = (String)session.getAttribute("action");
			session.removeAttribute("action");
			if(action!= null) {
				mav.setViewName("redirect:"+action);
			}else {
				mav.setViewName("redirect:/member/listMembers.do");	
			}
			
		}else {
			rAttr.addAttribute("result","loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		
		
		return mav;
	}


	/**
	 * 회원 로그아웃을 처리합니다.
	 *
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 로그아웃 결과를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	@Override
	@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.setAttribute("isLogOn",false);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/listMembers.do");
		return mav;
	}



	/**
	 * 로그인 폼, 회원 가입 폼 등을 처리합니다.
	 *
	 * @param result 로그인 실패 등의 결과 메시지
	 * @param action 로그인 후 이동할 페이지
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 폼 페이지를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
			                  @RequestParam(value= "action", required=false) String action,
			                  HttpServletRequest request, 
			                  HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}


	/**
	 * 메인 페이지를 처리합니다.
	 *
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 메인 페이지를 포함한 ModelAndView 객체
	 */
	@RequestMapping(value = { "/","/main.do"}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}		
}
