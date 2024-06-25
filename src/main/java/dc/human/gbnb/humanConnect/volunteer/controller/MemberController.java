package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.vo.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * 회원 관리를 위한 컨트롤러 인터페이스입니다.
 */
public interface MemberController {
	/**
	 * 회원 목록을 조회합니다.
	 *
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 회원 목록을 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;

	/**
	 * 새로운 회원을 추가합니다.
	 *
	 * @param memberVO 회원 정보를 포함한 MemberVO 객체
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 작업 결과를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	/**
	 * 기존 회원을 삭제합니다.
	 *
	 * @param u_id 삭제할 회원의 ID
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 작업 결과를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	public ModelAndView removeMember(@RequestParam("u_id") String u_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	/**
	 * 회원 로그인을 처리합니다.
	 *
	 * @param memberVO 로그인 정보를 포함한 MemberVO 객체
	 * @param redirectAttributes 리다이렉트를 위한 RedirectAttributes 객체
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 로그인 결과를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	public ModelAndView login(@ModelAttribute("member") MemberVO memberVO,
			                  RedirectAttributes  redirectAttributes,
			                 HttpServletRequest request, HttpServletResponse response) throws Exception;

	/**
	 * 회원 로그아웃을 처리합니다.
	 *
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @return 로그아웃 결과를 포함한 ModelAndView 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
