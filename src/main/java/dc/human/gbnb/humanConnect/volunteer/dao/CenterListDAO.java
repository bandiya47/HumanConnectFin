package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.CenterListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerDetailVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository("centerListDAO")
public interface CenterListDAO {

	 public int insertAdoptCenterList(CenterListVO centerListVO) throws DataAccessException;
	 public int insertCenterList(CenterListVO centerListVO) throws DataAccessException;
	 public CenterListVO selectNoCenterList (String name) throws DataAccessException;
	 public List selectListVolCenterList(String careNm) throws DataAccessException;


}
