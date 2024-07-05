package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository("mainDAO")
public interface MainDAO {
	 List<MainVO> getMyVolunteerList(String u_id) throws DataAccessException;
}


//public interface MemberDAO {
//	public List<MemberVO> selectAllMemberList() throws DataAccessException;
//
//}