package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.vo.CenterRecruitListVO;

import java.util.List;
public interface CenterRecruitListService {
    List<CenterRecruitListVO> getRecruitmentList(String centerId, int pageNumber, int pageSize);
    int getTotalRecords(String centerId);
}
