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
    public List<CenterMainVO> getRecruitmentList(String centerId) {
        List<CenterMainVO> recruitmentList = centerMainDAO.getRecruitmentList(centerId);
        if (recruitmentList != null && !recruitmentList.isEmpty()) {
            recruitmentList.forEach(vo -> {
                System.out.println("UserID: " + vo.getUserId());
                System.out.println("Name: " + vo.getName());
                System.out.println("Phone: " + vo.getPhone());
                System.out.println("Status: " + vo.getStatus());
                System.out.println("RejectReason: " + vo.getRejectReason());
            });
        } else {
            System.out.println("Recruitment list is null or empty");
        }
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
    public String getLatestRecruitmentTitle(String centerId) {
        return centerMainDAO.getLatestRecruitmentTitle(centerId);
    }

    @Override
    public int updateStatus(String userId, int status, String rejectReason, String centerId) {
        return centerMainDAO.updateStatus(userId, status, rejectReason, centerId);
    }
}