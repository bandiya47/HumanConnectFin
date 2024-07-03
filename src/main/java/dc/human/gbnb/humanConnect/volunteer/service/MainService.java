package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;

import java.util.List;

public interface MainService {

    List<MainVO> getMyVolunteerList(String u_id);




    //String getLatestRecruitmentTitle(String centerId);
}