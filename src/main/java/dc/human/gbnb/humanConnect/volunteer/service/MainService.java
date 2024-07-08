package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;

import java.util.List;

public interface MainService {

    List<MainVO> getMyVolunteerList(String u_id);

    List<MainVO> getMyAdoptList(String u_id);

    List<MainVO> getApproachVolList(String u_id);


}