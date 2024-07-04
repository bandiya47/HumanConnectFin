package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.CenterListVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository("centerListDAO")
public interface CenterListDAO {

	 public int insertAdoptCenterList(CenterListVO centerListVO) throws DataAccessException;

}
