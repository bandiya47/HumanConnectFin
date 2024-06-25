package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.dao.LoginDAO;
import dc.human.gbnb.humanConnect.login.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service("loginService")
@Transactional(propagation = Propagation.REQUIRED)
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDAO loginDAO;

    @Override
    public String validateUser(String userId, String userPassword) throws Exception {

        return loginDAO.validateUser(userId, userPassword);
    }

    @Override
    public UserVO getUserDetails(String userId, String tableName) throws Exception {
        return loginDAO.getUserDetails(userId, tableName);
    }
}
