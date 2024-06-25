package dc.human.gbnb.humanConnect.volunteer.service;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import  dc.human.gbnb.humanConnect.volunteer.vo.MemberVO;

public interface MemberService {

	/**
	 * 모든 회원 목록을 조회합니다..
	 *
	 * @return 회원 목록을 포함한 List 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	 public List listMembers() throws Exception;

	/**
	 * 새로운 회원을 추가합니다.
	 *
	 * @param memberVO 회원 정보를 포함한 MemberVO 객체
	 * @return 삽입 결과를 나타내는 정수 값
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	 public int addMember(MemberVO memberVO) throws Exception;

	/**
	 * 기존 회원을 삭제합니다.
	 *
	 * @param u_id 삭제할 회원의 ID
	 * @return 삭제 결과를 나타내는 정수 값
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	 public int removeMember(String u_id) throws Exception;

	/**
	 * 회원 로그인을 처리합니다.
	 *
	 * @param memberVO 로그인 정보를 포함한 MemberVO 객체
	 * @return 로그인된 회원 정보를 포함한 MemberVO 객체
	 * @throws Exception 작업 중 에러 발생 시 예외 처리
	 */
	 public MemberVO login(MemberVO memberVO) throws Exception;
}
