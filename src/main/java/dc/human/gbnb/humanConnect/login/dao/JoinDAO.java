package dc.human.gbnb.humanConnect.login.dao;

import dc.human.gbnb.humanConnect.login.vo.JoinVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

@Mapper
public interface JoinDAO {

    int checkDuplicateUserId(String u_Id) throws DataAccessException;
    int insertMember(JoinVO joinVO) throws DataAccessException;

}
