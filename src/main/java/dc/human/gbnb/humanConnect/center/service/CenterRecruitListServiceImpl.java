package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.dao.CenterRecruitListDAO;
import dc.human.gbnb.humanConnect.center.vo.CenterRecruitListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CenterRecruitListServiceImpl implements CenterRecruitListService {

    @Autowired
    private CenterRecruitListDAO centerRecruitListDAO;

    @Override
    public List<CenterRecruitListVO> getRecruitmentList(String centerId) {
        return centerRecruitListDAO.getRecruitmentList(centerId);
    }
}