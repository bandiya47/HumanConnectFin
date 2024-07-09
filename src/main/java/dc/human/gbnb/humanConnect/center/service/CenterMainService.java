package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;

import java.util.List;

public interface CenterMainService {
    List<CenterMainVO> getRecruitmentList(String centerId, int page, int size);

    List<CenterMainVO> getVolunteerList(String centerId);

    List<CenterMainVO> getAdoptionList(String centerId);

    int updateRecruitmentStatus(String userId, int status, String rejectReason, String centerId, String resNo);

    int updateVolunteerStatus(String userId, int status, String rejectReason, String centerId, String resNo);

    int getTotalRecruitments(String centerId);
}
