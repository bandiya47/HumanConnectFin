package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import dc.human.gbnb.humanConnect.center.dao.CenterRegDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("centerRegService")
@Transactional(propagation = Propagation.REQUIRED)
public class CenterRegServiceImpl implements CenterRegService {
	@Autowired
	private CenterRegDAO centerRegDAO;



	@Override
	public int addCenterReg(CenterRegVO centerRegVO) throws Exception {
		return centerRegDAO.insertCenterReg(centerRegVO);
	}

	@Override
	public int updateCenterReg(CenterRegVO centerRegVO) throws Exception {
		return centerRegDAO.updateCenterReg(centerRegVO);
	}

	@Override
	public int v_noCenterReg() throws Exception {
		int v_no =0;
		v_no=centerRegDAO.selectVNoCenterReg().getV_no();
		return v_no;
	}

	@Override
	public List listCenterReg(int v_no) throws Exception {
		List centerRegList = null;
		centerRegList = centerRegDAO.selectCenterRegList(v_no);
		return centerRegList;
	}

	@Override
	public List listIdCenterReg(String centerId) throws Exception{
		List centerRegList = null;
		centerRegList = centerRegDAO.selectCenterRegIdList(centerId);
		return centerRegList;
	}

	@Override
	public List<CenterMainVO> getRecruitmentList(String centerId, int v_no, int page, int size) throws Exception {
		int offset = (page - 1) * size;
		Map<String, Object> params = new HashMap<>();
		params.put("centerId", centerId);
		params.put("v_no", v_no);
		params.put("offset", offset);
		params.put("limit", size);
		return centerRegDAO.getRecruitmentList(params);
	}

	@Override
	public int getTotalRecruitments(String centerId, int v_no) throws Exception {
		return centerRegDAO.getTotalRecruitments(centerId, v_no);
	}

	@Override
	public int updateRecruitmentStatus(String userId, int status, String rejectReason, String centerId, String resNo) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("status", status);
		params.put("rejectReason", rejectReason);
		params.put("centerId", centerId);
		params.put("resNo", resNo);
		return centerRegDAO.updateRecruitmentStatus(params);
	}

}
