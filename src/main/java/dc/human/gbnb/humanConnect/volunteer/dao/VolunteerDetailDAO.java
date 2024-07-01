package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerDetailVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository("volunteerDetailDAO")
public interface VolunteerDetailDAO {

	 public List selectListVolunteerDetail(int v_no) throws DataAccessException;
	 public int insertVolunteerDetail(VolunteerDetailVO volunteerDetailVO) throws DataAccessException;
	 public VolunteerDetailVO selectVRNoVolunteerDetail () throws DataAccessException;
	 public int insertVolunteerDetail2(VolunteerDetailVO volunteerDetailVO) throws DataAccessException;
	 public List selectListRegVolunteerDetail(int vReg_no) throws DataAccessException;





}
