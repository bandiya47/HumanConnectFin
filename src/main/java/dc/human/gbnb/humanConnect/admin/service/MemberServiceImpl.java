package dc.human.gbnb.humanConnect.admin.service;

import dc.human.gbnb.humanConnect.admin.dao.MemberDAO;
import dc.human.gbnb.humanConnect.admin.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List<MemberVO> listMembers(int page, int size) {
		int offset = (page - 1) * size;
		return memberDAO.selectAllMemberList(offset, size);
	}

	@Override
	public MemberVO getMemberById(String u_id) {
		return memberDAO.selectMemberById(u_id);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		memberDAO.updateMember(memberVO);
	}

	@Override
	public void deleteMember(String u_id) {
		memberDAO.deleteMember(u_id);
	}

	@Override
	public List<MemberVO> searchMembers(String searchQuery, int page, int size) {
		int offset = (page - 1) * size;
		return memberDAO.searchMembers(searchQuery, offset, size);
	}

	@Override
	public int countAllMembers() {
		return memberDAO.countAllMembers();
	}

	@Override
	public int countSearchedMembers(String searchQuery) {
		return memberDAO.countSearchedMembers(searchQuery);
	}
}