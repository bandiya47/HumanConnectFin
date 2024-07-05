package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.dao.MainDAO;
import dc.human.gbnb.humanConnect.volunteer.service.MainService;
import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("mainService")
@Transactional
public class MainServiceImpl implements MainService {

    @Autowired
    private MainDAO mainDAO;

    @Override
    public List<MainVO> getMyVolunteerList(String u_id) {
        System.out.println("Service received u_id: " + u_id);
        List<MainVO> myVolunteerList = mainDAO.getMyVolunteerList(u_id);
        if (myVolunteerList != null) {
            for (MainVO vo : myVolunteerList) {
                if (vo == null) {
                    System.out.println("vo is null");
                } else {
                    System.out.println("u_id: " + vo.getU_id());
                    System.out.println("v_no: " + vo.getV_no());
                    System.out.println("v_title: " + vo.getV_title());
                    System.out.println("vreg_start_date: " + vo.getVreg_start_date());
                    System.out.println("vreg_end_date: " + vo.getVreg_end_date());
                    System.out.println("c_name: " + vo.getC_name());
                    System.out.println("c_phone: " + vo.getC_phone());
                    System.out.println("service_type: " + vo.getService_type());
                }
            }
        } else {
            System.out.println("myVolunteerList is null");
        }
        return myVolunteerList;
    }

//    @Override
//    public List<CenterMainVO> getVolunteerList(String centerId) {
//        return mainDAO.getVolunteerList(centerId);
//    }

//    @Override
//    public List<CenterMainVO> getAdoptionList(String centerId) {
//        return mainDAO.getAdoptionList(centerId);
//    }
//
//    @Override
//    public int updateStatus(String userId, int status, String rejectReason, String centerId) {
//        return centerMainDAO.updateStatus(userId, status, rejectReason, centerId);
//    }
//
//    @Override
//    public String getLatestRecruitmentTitle(String centerId) {
//        return centerMainDAO.getLatestRecruitmentTitle(centerId);
//    }
}