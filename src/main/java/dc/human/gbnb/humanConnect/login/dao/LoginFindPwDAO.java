package dc.human.gbnb.humanConnect.login.dao;

import dc.human.gbnb.humanConnect.login.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("loginFindPwDAO")
public interface LoginFindPwDAO {


    public String selectFindPw(String userId) throws DataAccessException;
    public int updateFindPw(String userId,String userPw) throws DataAccessException;

}