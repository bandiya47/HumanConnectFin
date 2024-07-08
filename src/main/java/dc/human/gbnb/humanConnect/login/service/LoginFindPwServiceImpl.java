package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.dao.LoginFindPwDAO;
import dc.human.gbnb.humanConnect.login.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Service("loginFindPwService")
@Transactional(propagation = Propagation.REQUIRED)
public class LoginFindPwServiceImpl implements LoginFindPwService {

    @Autowired
    private LoginFindPwDAO loginFindPWDAO;


    @Override
    public String findPw(String userId) throws Exception {
        return loginFindPWDAO.selectFindPw(userId);
    }
    @Override
    public int rePw(String userId,String userPw) throws Exception {
        return loginFindPWDAO.updateFindPw(userId,userPw);
    }
}
