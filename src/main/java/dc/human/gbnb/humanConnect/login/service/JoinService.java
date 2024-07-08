package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.vo.JoinVO;

public interface JoinService {

    boolean isUserIdAvailable(String u_Id);

    int addMember(JoinVO joinVO) throws Exception;
}

