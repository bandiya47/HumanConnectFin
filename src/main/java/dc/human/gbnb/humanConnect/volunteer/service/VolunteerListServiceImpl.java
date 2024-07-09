package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.dao.VolunteerDAO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerListVO;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("volunteerListService")
public class VolunteerListServiceImpl implements VolunteerListService {

    @Resource
    private VolunteerDAO volunteerDAO;

    @Override
    public List<VolunteerListVO> getVolunteerList() throws Exception {
        return volunteerDAO.getVolunteerList();
    }
}
