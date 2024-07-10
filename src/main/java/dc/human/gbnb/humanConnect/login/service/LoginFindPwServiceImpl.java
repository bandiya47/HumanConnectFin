package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.dao.LoginFindPwDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("loginFindPwService")
@Transactional(propagation = Propagation.REQUIRED)
public class LoginFindPwServiceImpl implements LoginFindPwService {

    @Autowired
    private LoginFindPwDAO loginFindPWDAO;


    @Override
    public String findPw(String userId,String userName,String userEmail,String userPhone) {
        return loginFindPWDAO.selectFindPw(userId,userName,userEmail,userPhone);
    }

    @Override
    public int rePw(String userId,String userPw) throws Exception {
        return loginFindPWDAO.updateFindPw(userId,userPw);
    }

    @Override
    public String findPw(String userId) {
        return loginFindPWDAO.selectFindPw(userId);
    }

    @Override
    public String findName(String userName) {
        return loginFindPWDAO.selectFindPw(userName);
    }

    @Override
    public String findEmail(String userEmail) {
        return loginFindPWDAO.selectFindPw(userEmail);
    }

    @Override
    public String findPh(String userPhone) {
        return loginFindPWDAO.selectFindPw(userPhone);
    }
}
