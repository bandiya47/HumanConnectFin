package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.dao.JoinDAO;
import dc.human.gbnb.humanConnect.login.vo.JoinVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service("JoinService")
@Transactional(propagation = Propagation.REQUIRED)
public class JoinServiceImpl implements JoinService {

    @Autowired
    private JoinDAO joinDAO;

    @Override
    public boolean isUserIdDuplicate(String u_Id) throws Exception {
        int count = joinDAO.checkDuplicateUserId(u_Id);
        return count > 0;
    }

    @Override
    public int addMember(JoinVO joinVO) throws Exception {
        return joinDAO.insertMember(joinVO);
    }

}