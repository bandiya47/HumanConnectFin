package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;

import java.util.List;

public interface CenterMainService {
    List<CenterMainVO> getRecruitmentList(String centerId, String vTitle);

    List<CenterMainVO> getVolunteerList(String centerId);

    List<CenterMainVO> getAdoptionList(String centerId);

    String getLatestRecruitmentTitle(String centerId);

    int updateRecruitmentStatus(String userId, int status, String rejectReason, String centerId);

    int updateVolunteerStatus(String userId, int status, String rejectReason, String centerId);
}