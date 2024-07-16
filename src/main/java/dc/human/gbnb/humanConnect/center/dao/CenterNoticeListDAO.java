package dc.human.gbnb.humanConnect.center.dao;

import dc.human.gbnb.humanConnect.center.vo.CenterNoticeListVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
@Repository("centerNoticeListDAO")
public interface CenterNoticeListDAO {
    List<CenterNoticeListVO> getNoticeList(@Param("offset") int offset, @Param("size") int size) throws DataAccessException;
    CenterNoticeListVO getNoticeDetail(int nNumber) throws DataAccessException;
    int countNotices() throws DataAccessException;
}
