package dc.human.gbnb.humanConnect.center.dao;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("centerMainDAO")
public interface CenterMainDAO {

    List<CenterMainVO> getRecruitmentList(String centerId) throws DataAccessException;

    List<CenterMainVO> getVolunteerList(String centerId) throws DataAccessException;

    List<CenterMainVO> getAdoptionList(String centerId) throws DataAccessException;

    int updateStatus(String userId, int status, String rejectReason, String centerId) throws DataAccessException;

    String getLatestRecruitmentTitle(String centerId) throws DataAccessException;
}