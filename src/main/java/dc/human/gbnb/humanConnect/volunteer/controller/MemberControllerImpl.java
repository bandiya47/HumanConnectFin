package dc.human.gbnb.humanConnect.volunteer.controller;

import java.util.List;

import ch.qos.logback.core.CoreConstants;
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

import  dc.human.gbnb.humanConnect.volunteer.service.MemberService;
import  dc.human.gbnb.humanConnect.volunteer.vo.MemberVO;

@Controller
public class MemberControllerImpl  implements MemberController {
	@Autowired
	private MemberService memberService;

	private MemberVO memberVO;



	@Override
	@RequestMapping(value= "/listMembers.do", method = RequestMethod.GET)/*경로*/
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//public String listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = (String)request.getAttribute("viewName");
		List membersList = memberService.listMembers();
		//ModelAndView mav = new ModelAndView(viewName);
		ModelAndView mav = new ModelAndView("/listMembers");/*경로*/
		
		mav.addObject("membersList", membersList);
		return mav;
	}



//	@Override
//	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)/*경로*/
//	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
//			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		int result = 0;
//		result = memberService.addMember(member);
//		ModelAndView mav = new ModelAndView("redirect:/addMember.do");/*경로*/
//		return mav;
//	}

	@Override
	@RequestMapping(value="/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
								  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = memberService.addMember(member);

		// 회원 가입이 성공했는지 확인하는 로직 추가
		ModelAndView mav = new ModelAndView();
		if (result > 0) {
			// 가입이 성공한 경우
			mav.setViewName("memberForm"); // JSP 파일명, 확장자는 생략
			mav.addObject("member", member); // 필요 시 가입된 회원 정보 전달
		} else {
			// 가입이 실패한 경우 (선택사항)
			mav.setViewName("addMember"); // 다시 회원가입 페이지로 이동
			mav.addObject("errorMessage", "회원 가입에 실패했습니다. 다시 시도해 주세요.");
		}
		return mav;
	}

	@Override
	@RequestMapping(value="/removeMember.do" ,method = RequestMethod.GET)/*경로*/
	public ModelAndView removeMember(@RequestParam("u_id") String u_id,
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(u_id);
		ModelAndView mav = new ModelAndView("redirect:/listMembers.do");/*경로*/
		return mav;
	}



	@Override
	@RequestMapping(value = "/login.do", method =  RequestMethod.POST)/*경로*/
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
			                  RedirectAttributes  rAttr,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		System.out.println(member.getU_id());/* 뭔지 출력해보기*/
		System.out.println(member.getU_pwd());/* 뭔지 출력해보기*/

		memberVO = memberService.login(member);


		System.out.println("1"+memberVO);/* 뭔지 출력해보기*/

		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			
			String action = (String)session.getAttribute("action");

			System.out.println(action); /*action 뭔지 출력해보기*/

			session.removeAttribute("action");

			if(action!= null) {
				mav.setViewName("redirect:"+action);
			}else {
				mav.setViewName("redirect:/listMembers.do");	/*경로*/
			}
			
		}else {
			rAttr.addAttribute("result","loginFailed");
			mav.setViewName("redirect:/loginForm.do");/*경로*/
		}
		
		
		return mav;
	}



	@Override
	@RequestMapping(value = "/logout.do", method =  RequestMethod.GET)/*경로*/
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.setAttribute("isLogOn",false);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/listMembers.do");/*경로*/
		return mav;
	}




	@RequestMapping(value = "/*Form.do", method =  RequestMethod.GET)/*경로*/
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



	@RequestMapping(value = { "/","/main.do"}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}		
}
