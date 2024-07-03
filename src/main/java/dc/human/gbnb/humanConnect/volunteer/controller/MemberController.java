package dc.human.gbnb.humanConnect.volunteer.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import  dc.human.gbnb.humanConnect.volunteer.vo.MemberVO;



public interface MemberController {

	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;


	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;


	public ModelAndView removeMember(@RequestParam("u_id") String u_id, HttpServletRequest request, HttpServletResponse response) throws Exception;


	public ModelAndView login(@ModelAttribute("member") MemberVO memberVO,
			                  RedirectAttributes  redirectAttributes,
			                 HttpServletRequest request, HttpServletResponse response) throws Exception;


	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
