package dc.human.gbnb.humanConnect.center.dao;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Mapper
@Repository("centerRegDAO")
public interface CenterRegDAO {

	 public int insertCenterReg(CenterRegVO centerRegVO) throws DataAccessException ;
	 public int updateCenterReg(CenterRegVO centerRegVO) throws DataAccessException ;
	 public CenterRegVO selectVNoCenterReg () throws DataAccessException;
	 public List selectCenterRegList(int v_no) throws DataAccessException;
	 public List selectCenterRegIdList(String centerId) throws DataAccessException;
	 List<CenterMainVO> getRegRecruitmentList(int v_no) throws DataAccessException;
	List<CenterMainVO> getRecruitmentList(Map<String, Object> params) throws DataAccessException;
	int getTotalRecruitments(String centerId, int v_no) throws DataAccessException;
	int updateRecruitmentStatus(Map<String, Object> params) throws DataAccessException;

}
