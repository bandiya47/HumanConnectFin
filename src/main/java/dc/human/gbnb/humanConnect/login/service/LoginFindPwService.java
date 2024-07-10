package dc.human.gbnb.humanConnect.login.service;

public interface LoginFindPwService {

    String findPw(String userId, String userName, String userEmail, String userPhone);

    public int rePw(String userId, String userPw) throws Exception;

    String findPw(String userId);

    String findName(String userName);

    String findEmail(String userEmail);

    String findPh(String userPhone);
}
