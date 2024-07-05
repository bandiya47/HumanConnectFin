package dc.human.gbnb.humanConnect.volunteer.service;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import  dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;

public interface MypageService {

	public MypageVO privacyList(String u_id) throws Exception;



	public int updateUserDetails(MypageVO mypageVO) throws Exception;



	public int checkPrivacyPw(String userId, String u_pwd) throws Exception;

}


//public interface MemberService {
//	public List<MemberVO> listMembers() throws Exception;
//}