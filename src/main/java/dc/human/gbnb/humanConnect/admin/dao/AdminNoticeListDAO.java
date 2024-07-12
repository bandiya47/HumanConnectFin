package dc.human.gbnb.humanConnect.admin.dao;

import dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
@Repository("adminNoticeListDAO")
public interface AdminNoticeListDAO {

    @Autowired
    SqlSession sqlSession = null; // MyBatis SqlSession 주입

    List<AdminNoticeListVO> getNoticeList()  throws DataAccessException;

    void deleteNotices(@Param("nNumbers") List<Integer> nNumbers) throws DataAccessException;

    void insertNotice(AdminNoticeListVO notice) throws Exception;

    AdminNoticeListVO getNoticeDetail(int nNumber) throws DataAccessException;

    AdminNoticeListVO getLatestNotice() throws DataAccessException;

    void updateNotice(AdminNoticeListVO notice) throws Exception;
}