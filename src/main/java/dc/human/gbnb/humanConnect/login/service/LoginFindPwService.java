package dc.human.gbnb.humanConnect.login.service;

public interface LoginFindPwService {

    public String findPw(String userId, String userName, String userEmail, String userPhone);

    public int rePw(String userId, String userPw) throws Exception;

}
