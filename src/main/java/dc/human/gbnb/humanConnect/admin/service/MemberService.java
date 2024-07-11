package dc.human.gbnb.humanConnect.admin.service;

import dc.human.gbnb.humanConnect.admin.vo.MemberVO;

import java.util.List;

public interface MemberService {
	List<MemberVO> listMembers(int page, int size);
	MemberVO getMemberById(String u_id);
	void updateMember(MemberVO memberVO);
	void deleteMember(String u_id);
	List<MemberVO> searchMembers(String searchQuery, int page, int size);
	int countAllMembers();
	int countSearchedMembers(String searchQuery);
}
