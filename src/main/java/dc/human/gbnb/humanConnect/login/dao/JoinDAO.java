package dc.human.gbnb.humanConnect.login.dao;

import dc.human.gbnb.humanConnect.login.vo.JoinVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface JoinDAO {

    @Select("SELECT COUNT(*) FROM volunteer_user WHERE u_Id = #{u_Id}")
    int countByUserId(String u_Id);

    default boolean isUserIdAvailable(String u_Id) {
        return countByUserId(u_Id) == 0;
    }

    int insertMember(JoinVO joinVO) throws DataAccessException;

}
