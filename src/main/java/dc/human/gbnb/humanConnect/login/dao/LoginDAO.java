package dc.human.gbnb.humanConnect.login.dao;

import dc.human.gbnb.humanConnect.login.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository("loginDAO")
public interface LoginDAO {

    /**
     * 로그인 타입 정보 조회
     * @param userId
     * @param userPassword
     * @return
     * @throws DataAccessException
     */
    public String validateUser(String userId, String userPassword) throws DataAccessException;

    public UserVO getUserDetails(String userId, String tableName) throws DataAccessException;
}