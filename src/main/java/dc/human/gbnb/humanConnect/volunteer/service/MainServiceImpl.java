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
        System.out.println(u_id);
        List<MainVO> myVolunteerList = mainDAO.getMyVolunteerList(u_id);
        System.out.println("MainServiceImpl Printing **myVolunteerList**: " + myVolunteerList);
        return myVolunteerList;
        //return mainDAO.getMyVolunteerList(u_id);
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