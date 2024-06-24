package dc.human.gbnb.humanConnect.dao;

import dc.human.gbnb.humanConnect.vo.CenterRegVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository("centerRegDAO")
public interface CenterRegDAO {

	 public int insertCenterReg(CenterRegVO centerRegVO) throws DataAccessException ;
	 public CenterRegVO selectVNoCenterReg () throws DataAccessException;
	 public List selectCenterRegList(int v_no) throws DataAccessException;
}
