package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.vo.UserVO;

public interface LoginService {

    public String validateUser(String userId, String userPassword) throws Exception;

    public UserVO getUserDetails(String userId, String tableName) throws Exception;

}
