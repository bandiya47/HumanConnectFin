package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.dao.CenterMainDAO;
import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Logger;

@Service
public class CenterMainServiceImpl implements CenterMainService {

    private static final Logger logger = Logger.getLogger(CenterMainServiceImpl.class.getName());

    @Autowired
    private CenterMainDAO centerMainDAO;

    @Override
    public List<CenterMainVO> getRecruitmentList(String centerId, int page, int size) {
        int offset = (page - 1) * size;
        return centerMainDAO.getRecruitmentList(centerId, offset, size);
    }

    @Override
    public List<CenterMainVO> getVolunteerList(String centerId, int page, int size) {
        int offset = (page - 1) * size;
        return centerMainDAO.getVolunteerList(centerId, offset, size);
    }

    @Override
    public List<CenterMainVO> getAdoptionList(String centerId, int offset, int size) { // 페이지네이션을 위한 매개변수 추가
        return centerMainDAO.getAdoptionList(centerId, offset, size);
    }

    @Override
    public int updateRecruitmentStatus(String userId, int status, String rejectReason, String centerId, String resNo) {
        return centerMainDAO.updateRecruitmentStatus(userId, status, rejectReason, centerId, resNo);
    }

    @Override
    public int updateVolunteerStatus(String userId, int status, String rejectReason, String centerId, String resNo) {
        return centerMainDAO.updateVolunteerStatus(userId, status, rejectReason, centerId, resNo);
    }

    @Override
    public int getTotalRecruitments(String centerId) {
        return centerMainDAO.getTotalRecruitments(centerId);
    }

    @Override
    public int getTotalVolunteers(String centerId) {
        return centerMainDAO.getTotalVolunteers(centerId);
    }

    @Override
    public int getTotalAdoptions(String centerId) {
        return centerMainDAO.getTotalAdoptions(centerId);
    }
}
