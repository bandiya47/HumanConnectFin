package dc.human.gbnb.humanConnect.center.dao;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CenterMainDAO {
    List<CenterMainVO> getRecruitmentList(String centerId);

    List<CenterMainVO> getVolunteerList(String centerId);

    List<CenterMainVO> getAdoptionList(String centerId);

    String getLatestRecruitmentTitle(String centerId);

    int updateStatus(@Param("userId") String userId,
                     @Param("status") int status,
                     @Param("rejectReason") String rejectReason,
                     @Param("centerId") String centerId);
}