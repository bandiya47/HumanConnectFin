package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterRegService;
import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


@Controller("centerRegController")
@RestController
public class CenterRegControllerImpl implements CenterRegController {
	@Autowired
	private CenterRegService centerRegService;
	
	@Autowired
	private CenterRegVO centerRegVO ;
	

	
	@Override
	@RequestMapping(value= "/centerReg.do", method = RequestMethod.GET)
	public ModelAndView centerReg(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//public String listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = (String)request.getAttribute("viewName");
//		List membersList = memberService.listMembers();
		//ModelAndView mav = new ModelAndView(viewName);
		ModelAndView mav = new ModelAndView("/centerReg");
		
//		mav.addObject("membersList", membersList);
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
//
//	@Override
//	@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.GET)
//	public ModelAndView removeMember(@RequestParam("id") String id,
//			           HttpServletRequest request, HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("utf-8");
//		memberService.removeMember(id);
//		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
//		return mav;
//	}
//
//	@Override
//	@RequestMapping(value = "/member/login.do", method =  RequestMethod.POST)
//	public ModelAndView login(@ModelAttribute("member") MemberVO member,
//			                  RedirectAttributes  rAttr,
//			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		memberVO = memberService.login(member);
//		if(memberVO != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("member", memberVO);
//			session.setAttribute("isLogOn", true);
//
//			String action = (String)session.getAttribute("action");
//			session.removeAttribute("action");
//			if(action!= null) {
//				mav.setViewName("redirect:"+action);
//			}else {
//				mav.setViewName("redirect:/member/listMembers.do");
//			}
//
//		}else {
//			rAttr.addAttribute("result","loginFailed");
//			mav.setViewName("redirect:/member/loginForm.do");
//		}
//
//
//		return mav;
//	}
//
//	@Override
//	@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
//	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		session.removeAttribute("member");
//		session.setAttribute("isLogOn",false);
//
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("redirect:/member/listMembers.do");
//		return mav;
//	}
//
//
//	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
//	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
//			                  @RequestParam(value= "action", required=false) String action,
//			                  HttpServletRequest request,
//			                  HttpServletResponse response) throws Exception {
//		String viewName = (String)request.getAttribute("viewName");
//		HttpSession session = request.getSession();
//		session.setAttribute("action", action);
//
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("result",result);
//		mav.setViewName(viewName);
//		return mav;
//	}
//
//	@RequestMapping(value = { "/","/main.do"}, method = RequestMethod.GET)
//	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
//		String viewName = (String)request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		return mav;
//	}
}
