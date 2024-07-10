package dc.human.gbnb.humanConnect.login.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("loginFindPwDAO")
public interface LoginFindPwDAO {

    public int updateFindPw(String userId,String userPw) throws DataAccessException;

    public String selectFindPw(@Param("userId") String userId, @Param("userName") String userName, @Param("userEmail") String userEmail, @Param("userPhone") String userPhone) throws DataAccessException;

    String selectFindPw(String userId);
    String selectFindName(String userName);
    String selectFindEmail(String userEmail);
    String selectFindPh(String userPhone);
}