package dc.human.gbnb.humanConnect.volunteer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dc.human.gbnb.humanConnect.volunteer.dao.MypageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dc.human.gbnb.humanConnect.volunteer.dao.MypageDAO;
import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;


@Service("mypageService")	//빈으로 등록되는 이름
@Transactional(propagation = Propagation.REQUIRED) //트랜젝션 관리대상. REQUIRED 속성.
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public MypageVO privacyList(String u_id) throws Exception {
		return mypageDAO.selectAllPrivacyList(u_id);
	}

	public MypageVO CenterPrivacyList(String c_id) throws Exception {
		return mypageDAO.selectAllCenterPrivacyList(c_id);
	}


	public int updateUserDetails(MypageVO mypageVO) throws Exception {
		return mypageDAO.updateUserDetails(mypageVO);
	}

	@Override
	public boolean checkPrivacyPw(MypageVO mypageVO) throws Exception {
		int count = mypageDAO.checkPrivacyPw(mypageVO);
		return count == 1; // 비밀번호가 일치하면 true, 일치하지 않으면 false 반환
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