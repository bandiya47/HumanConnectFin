package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;
import  dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;

import java.util.List;

public interface MypageService {

	public MypageVO privacyList(String u_id) throws Exception;

	public int updateUserDetails(MypageVO mypageVO) throws Exception;

	public int checkPrivacyPw(String userId, String u_pwd) throws Exception;

	public int removePrivacy(String u_id) throws Exception;
	//봉사마이페이지
	public List<MypageVO> getMypageVolunteerList(String u_id);
}