package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import java.util.List;

@Mapper
@Repository("volunteerDAO")
public interface VolunteerDAO {

//    int insertVolunteerList(VolunteerListVO volunteerListVO) throws DataAccessException ;

    @Autowired
    SqlSession sqlSession = null; // MyBatis SqlSession 주입
    List<VolunteerListVO> getVolunteerList(String userId)  throws DataAccessException;
}