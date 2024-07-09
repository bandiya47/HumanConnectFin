package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerListVO;
import java.util.List;

public interface VolunteerListService {

    public List<VolunteerListVO> getVolunteerList(String userId) throws Exception;

}
