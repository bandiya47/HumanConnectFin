package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.dao.JoinDAO;
import dc.human.gbnb.humanConnect.login.vo.JoinVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("JoinService")
@Transactional
public class JoinServiceImpl implements JoinService {

    @Autowired
    private JoinDAO joinDAO;

    @Override
    public boolean isUserIdAvailable(String u_Id) {
        return joinDAO.isUserIdAvailable(u_Id);
    }

    @Override
    public int addMember(JoinVO joinVO) throws Exception {
        return joinDAO.insertMember(joinVO);
    }

}