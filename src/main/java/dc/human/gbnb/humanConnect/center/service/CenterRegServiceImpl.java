package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import dc.human.gbnb.humanConnect.center.dao.CenterRegDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;


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

}
