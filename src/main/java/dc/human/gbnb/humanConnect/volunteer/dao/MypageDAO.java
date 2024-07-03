package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository("mypageDAO")
public interface MypageDAO {
	 public MypageVO selectAllPrivacyList(String u_id) throws DataAccessException;

	 public int privacyEdit(String u_id) throws DataAccessException;
}


//public interface MemberDAO {
//	public List<MemberVO> selectAllMemberList() throws DataAccessException;
//
//}