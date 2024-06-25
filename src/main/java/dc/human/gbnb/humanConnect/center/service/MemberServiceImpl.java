package dc.human.gbnb.humanConnect.center.service;

import java.util.List;

import dc.human.gbnb.humanConnect.center.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dc.human.gbnb.humanConnect.center.dao.MemberDAO;


@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List listMembers() throws Exception {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}

	@Override
	public int addMember(MemberVO member) throws Exception {
		return memberDAO.insertMember(member);
	}

	@Override
	public int removeMember(String u_id) throws Exception {
		return memberDAO.deleteMember(u_id);
	}

	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}


}