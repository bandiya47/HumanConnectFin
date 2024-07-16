package dc.human.gbnb.humanConnect.login.service;

public interface LoginFindPwService {

    public String findPw(String userId, String userName, String userEmail);

    public int rePw(String userId, String userPw) throws Exception;

}
