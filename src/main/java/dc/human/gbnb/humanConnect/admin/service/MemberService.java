package dc.human.gbnb.humanConnect.admin.service;

import dc.human.gbnb.humanConnect.admin.vo.MemberVO;

import java.util.List;

public interface MemberService {
	List<MemberVO> listMembers();
	MemberVO getMemberById(String u_id);
}
