package dc.human.gbnb.humanConnect.center.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


@Mapper
@Repository("centerMypageDAO")
public interface CenterMypageDAO {



	 public MypageVO selectAllCenterPrivacyList(String centerId) throws DataAccessException;

	 public int updateCenterDetails(MypageVO mypageVO) throws DataAccessException;



	public int checkCenterPrivacyPw(@Param("centerId") String centerId, @Param("c_pwd") String c_pwd) throws DataAccessException;

}
