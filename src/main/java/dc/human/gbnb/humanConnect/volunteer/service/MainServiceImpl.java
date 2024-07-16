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
                    System.out.println("vo_u_id: " + vo.getU_id());
                    System.out.println("vo_v_no: " + vo.getV_no());
                    System.out.println("vo_v_title: " + vo.getV_title());
                    System.out.println("vo_vreg_start_date: " + vo.getVreg_start_date());
                    System.out.println("vo_vreg_end_date: " + vo.getVreg_end_date());
                    System.out.println("vo_c_name: " + vo.getC_name());
                    System.out.println("vo_c_phone: " + vo.getC_phone());
                    System.out.println("vo_service_type: " + vo.getService_type());
                }
            }
        } else {
            System.out.println("myVolunteerList is null");
        }
        return myVolunteerList;
    }


    @Override
    public List<MainVO> getMyAdoptList(String u_id) {
        System.out.println("Service received u_id: " + u_id);
        List<MainVO> myAdoptList = mainDAO.getMyAdoptList(u_id);
        if (myAdoptList != null) {
            for (MainVO advo : myAdoptList) {
                if (advo == null) {
                    System.out.println("advo is null");
                } else {
                    System.out.println("advo_u_id: " + advo.getU_id());
                    System.out.println("advo_c_name: " + advo.getC_name());
                    System.out.println("advo_visit_date: " + advo.getVisit_date());
                    System.out.println("advo_visit_time: " + advo.getVisit_time());
                }
            }
        } else {
            System.out.println("myAdoptList is null");
        }
        return myAdoptList;
    }

    @Override
    public List<MainVO> getApproachVolList(String u_id) {
        System.out.println("Service received u_id: " + u_id);
        List<MainVO> approachVolList = mainDAO.getApproachVolList(u_id);
        if (approachVolList != null) {
            for (MainVO avo : approachVolList) {
                if (avo == null) {
                    System.out.println("vo is null");
                } else {
//                    System.out.println("avo_u_id: " + avo.getU_id());
//                    System.out.println("avo_v_title: " + avo.getV_title());
//                    System.out.println("avo_vreg_start_date: " + avo.getVreg_start_date());
//                    System.out.println("avo_vreg_end_date: " + avo.getVreg_end_date());
//                    System.out.println("avo_vreg_start_date: " + avo.getVreg_start_date());
//                    System.out.println("avo_vreg_end_date: " + avo.getVreg_end_date());
//                    System.out.println("avo_c_name: " + avo.getC_name());
//                    System.out.println("avo_c_phone: " + avo.getC_phone());
//                    System.out.println("avo_c_addr1: " + avo.getC_addr1());
//                    System.out.println("avo_service_type: " + avo.getService_type());
                }
            }
        } else {
//            System.out.println("approachVolList is null");
        }
        return approachVolList;
    }


}