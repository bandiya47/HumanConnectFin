package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.dao.CenterMainDAO;
import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("centerMainService")
@Transactional
public class CenterMainServiceImpl implements CenterMainService {

    @Autowired
    private CenterMainDAO centerMainDAO;

    @Override
    public List<CenterMainVO> getRecruitmentList(String centerId) {
        List<CenterMainVO> recruitmentList = centerMainDAO.getRecruitmentList(centerId);
        System.out.println("Recruitment List: " + recruitmentList);
        return recruitmentList;
    }

    @Override
    public List<CenterMainVO> getVolunteerList(String centerId) {
        return centerMainDAO.getVolunteerList(centerId);
    }

    @Override
    public List<CenterMainVO> getAdoptionList(String centerId) {
        return centerMainDAO.getAdoptionList(centerId);
    }

    @Override
    public int updateStatus(String userId, int status, String rejectReason, String centerId) {
        return centerMainDAO.updateStatus(userId, status, rejectReason, centerId);
    }

    @Override
    public String getLatestRecruitmentTitle(String centerId) {
        return centerMainDAO.getLatestRecruitmentTitle(centerId);
    }
}