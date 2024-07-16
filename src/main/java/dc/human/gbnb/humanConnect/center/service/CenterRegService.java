package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import java.util.List;

public interface CenterRegService {

	 public int addCenterReg(CenterRegVO centerRegVO) throws Exception;
	 public int updateCenterReg(CenterRegVO centerRegVO) throws Exception;
	 public int v_noCenterReg() throws Exception;
	 public List listCenterReg(int v_no) throws Exception;
	 public List listIdCenterReg(String centerId) throws Exception;
	 List<CenterMainVO> getRecruitmentList(String centerId, int v_no, int page, int size) throws Exception;
	 int getTotalRecruitments(String centerId, int v_no) throws Exception;
	int updateRecruitmentStatus(String userId, int status, String rejectReason, String centerId, String resNo) throws Exception;
}
