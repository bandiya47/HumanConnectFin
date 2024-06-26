package dc.human.gbnb.humanConnect.center.dao;

import dc.human.gbnb.humanConnect.center.vo.CenterRecruitListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CenterRecruitListDAO {
    List<CenterRecruitListVO> getRecruitmentList(@Param("centerId") String centerId, @Param("start") int start, @Param("end") int end);
    int getTotalRecords(@Param("centerId") String centerId);
}