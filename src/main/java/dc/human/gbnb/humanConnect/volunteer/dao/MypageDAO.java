package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;
import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository("mypageDAO")
public interface MypageDAO {
	 public MypageVO selectAllPrivacyList(String u_id) throws DataAccessException;

	 public int updateUserDetails(MypageVO mypageVO) throws DataAccessException;

	 public int checkPrivacyPw(@Param("u_id") String u_id, @Param("u_pwd") String u_pwd) throws DataAccessException;

	 public int deletePrivacy(String u_id) throws DataAccessException;
	//봉사마이페이지
	List<MypageVO> getMypageVolunteerList(String u_id) throws DataAccessException;
}
