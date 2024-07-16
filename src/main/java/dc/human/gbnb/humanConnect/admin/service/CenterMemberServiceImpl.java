package dc.human.gbnb.humanConnect.admin.service;

import dc.human.gbnb.humanConnect.admin.dao.CenterMemberDAO;
import dc.human.gbnb.humanConnect.admin.vo.CenterMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CenterMemberServiceImpl implements CenterMemberService {

    @Autowired
    private CenterMemberDAO centerMemberDAO;

    @Override
    public List<CenterMemberVO> listAllCenterMembers(int page, int size) {
        int offset = (page - 1) * size;
        return centerMemberDAO.selectAllCenterMembers(offset, size);
    }

    @Override
    public List<CenterMemberVO> searchCenterMembers(String searchQuery, int page, int size) {
        int offset = (page - 1) * size;
        return centerMemberDAO.searchCenterMembers(searchQuery, offset, size);
    }

    @Override
    public CenterMemberVO getCenterMemberById(String c_id) {
        return centerMemberDAO.selectCenterMemberById(c_id);
    }

    @Override
    @Transactional
    public void updateCenterMember(CenterMemberVO centerMember) {
        centerMemberDAO.updateCenterMember(centerMember);
    }

    @Override
    @Transactional
    public void resetCenterPW(CenterMemberVO centerMember) { centerMemberDAO.resetCenterPW(centerMember); }

    @Override
    public void deleteCenterMember(String c_id) {
        centerMemberDAO.deleteCenterMember(c_id);
    }

    @Override
    public int countAllCenterMembers() {
        return centerMemberDAO.countAllCenterMembers();
    }

    @Override
    public int countSearchedCenterMembers(String searchQuery) {
        return centerMemberDAO.countSearchedCenterMembers(searchQuery);
    }
}
