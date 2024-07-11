package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerListVO;
import java.util.List;

public interface VolunteerListService {

    List<VolunteerListVO> getVolunteerList(int page, int size) throws Exception;
    int getVolunteerCount() throws Exception;

}
