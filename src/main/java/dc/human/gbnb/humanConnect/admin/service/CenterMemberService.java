package dc.human.gbnb.humanConnect.admin.service;

import dc.human.gbnb.humanConnect.admin.vo.CenterMemberVO;

import java.util.List;

public interface CenterMemberService {
    List<CenterMemberVO> listAllCenterMembers(int page, int size);
    List<CenterMemberVO> searchCenterMembers(String searchQuery, int page, int size);
    CenterMemberVO getCenterMemberById(String c_id);
    void updateCenterMember(CenterMemberVO centerMember);
    void deleteCenterMember(String c_id);
    int countAllCenterMembers();
    int countSearchedCenterMembers(String searchQuery);
}
