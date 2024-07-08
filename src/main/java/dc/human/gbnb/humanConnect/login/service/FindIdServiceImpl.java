package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.vo.FindIdVO;
import dc.human.gbnb.humanConnect.login.dao.FindIdDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("FindIdService")
public class FindIdServiceImpl implements FindIdService {
    @Autowired
    private FindIdDAO findIdDAO;

    @Override
    public FindIdVO findMember(FindIdVO findIdVO) {
        String u_Id = findIdDAO.searchMember(findIdVO);
        findIdVO.setU_Id(u_Id);
        return findIdVO;
    }

}
