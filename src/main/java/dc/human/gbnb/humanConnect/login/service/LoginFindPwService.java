package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.vo.UserVO;

public interface LoginFindPwService {

    public String findPw(String userId) throws Exception;
    public int rePw(String userId,String userPw) throws Exception;

}
