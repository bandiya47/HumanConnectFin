package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.dao.CenterMypageDAO;
import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service("centerMypageService")	//빈으로 등록되는 이름
@Transactional(propagation = Propagation.REQUIRED) //트랜젝션 관리대상. REQUIRED 속성.
public class CenterMypageServiceImpl implements CenterMypageService {

	@Autowired
	private CenterMypageDAO centerMypageDAO;

	@Override
	public MypageVO centerPrivacyList(String centerId) throws Exception {
		try {
			return centerMypageDAO.selectAllcenterPrivacyList(centerId);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}

	public int updateCenterDetails(MypageVO mypageVO) throws Exception {
		try {
			return centerMypageDAO.updateCenterDetails(mypageVO);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int checkCenterPrivacyPw(String centerId, String c_pwd) throws Exception {
		try {
			return centerMypageDAO.checkCenterPrivacyPw(centerId,c_pwd);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return 0;
		}
	}


//	@Service("memberService")
//	@Transactional(propagation = Propagation.REQUIRED)
//	public class MemberServiceImpl implements MemberService {
//		@Autowired
//		private MemberDAO memberDAO;
//
//		@Override
//		public List listMembers() throws Exception {
//			List membersList = null;
//			membersList = memberDAO.selectAllMemberList();
//			return membersList;
//		}



}