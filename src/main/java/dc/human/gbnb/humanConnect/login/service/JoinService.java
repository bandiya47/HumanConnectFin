package dc.human.gbnb.humanConnect.login.service;

import dc.human.gbnb.humanConnect.login.vo.JoinVO;

public interface JoinService {

    boolean isUserIdDuplicate(String u_Id) throws Exception;

    int addMember(JoinVO joinVO) throws Exception;
}

