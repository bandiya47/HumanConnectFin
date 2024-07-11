package dc.human.gbnb.humanConnect.center.dao;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CenterMainDAO {
    List<CenterMainVO> getRecruitmentList(@Param("centerId") String centerId, @Param("offset") int offset, @Param("size") int size);

    List<CenterMainVO> getVolunteerList(@Param("centerId") String centerId, @Param("offset") int offset, @Param("size") int size);

    List<CenterMainVO> getAdoptionList(@Param("centerId") String centerId, @Param("offset") int offset, @Param("size") int size);

    int updateRecruitmentStatus(@Param("userId") String userId,
                                @Param("status") int status,
                                @Param("rejectReason") String rejectReason,
                                @Param("centerId") String centerId,
                                @Param("resNo") String resNo);

    int updateVolunteerStatus(@Param("userId") String userId,
                              @Param("status") int status,
                              @Param("rejectReason") String rejectReason,
                              @Param("centerId") String centerId,
                              @Param("resNo") String resNo);

    int getTotalRecruitments(@Param("centerId") String centerId);

    int getTotalVolunteers(@Param("centerId") String centerId);

    int getTotalAdoptions(@Param("centerId") String centerId);
}
