package dc.human.gbnb.humanConnect.admin.dao;

import dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository("adminNoticeListDAO")
public interface AdminNoticeListDAO {

    @Autowired
    SqlSession sqlSession = null; // MyBatis SqlSession 주입

    List<AdminNoticeListVO> getNoticeList(Map<String, Object> params) throws Exception;

    int getTotalNoticeCount() throws Exception;

    void deleteNotices(@Param("nNumbers") List<Integer> nNumbers) throws DataAccessException;

    void insertNotice(AdminNoticeListVO notice) throws Exception;

    AdminNoticeListVO getNoticeDetail(int nNumber) throws DataAccessException;

    AdminNoticeListVO getLatestNotice() throws DataAccessException;

    void updateNotice(AdminNoticeListVO notice) throws Exception;
}