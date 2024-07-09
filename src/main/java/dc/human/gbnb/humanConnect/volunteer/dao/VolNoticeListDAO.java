package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.VolNoticeListVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
@Repository("volNoticeListDAO")
public interface VolNoticeListDAO {

    List<VolNoticeListVO> getNoticeList()  throws DataAccessException;

    VolNoticeListVO getNoticeDetail(int nNumber) throws DataAccessException;

    VolNoticeListVO getLatestNotice() throws DataAccessException;
}
