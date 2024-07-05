package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;

public interface CenterMypageService {

	public MypageVO centerPrivacyList(String centerId) throws Exception;



	public int updateCenterDetails(MypageVO mypageVO) throws Exception;



	public int checkCenterPrivacyPw(String centerId, String c_pwd) throws Exception;

}


//public interface MemberService {
//	public List<MemberVO> listMembers() throws Exception;
//}