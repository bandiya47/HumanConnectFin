package dc.human.gbnb.humanConnect.volunteer.service;

import java.util.List;

import dc.human.gbnb.humanConnect.volunteer.dao.MypageDAO;
import org.springframework.beans.factory.annotation.Autowired;
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

	@Override
	public int privacyEdit(String u_id) throws Exception {
		return mypageDAO.privacyEdit(u_id);
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