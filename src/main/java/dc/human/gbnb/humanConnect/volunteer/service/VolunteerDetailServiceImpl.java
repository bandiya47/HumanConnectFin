package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.dao.VolunteerDetailDAO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("volunteerDetailService")
@Transactional(propagation = Propagation.REQUIRED)
public class VolunteerDetailServiceImpl implements VolunteerDetailService {
	@Autowired
	private VolunteerDetailDAO volunteerDetailDAO;



	@Override
	public List listVolunteerDetail(int v_no) throws Exception {
		List volunteerDetailList = null;
		volunteerDetailList = volunteerDetailDAO.selectListVolunteerDetail(v_no);
		return volunteerDetailList;
	}

	@Override
	public int addVolunteerDetail(VolunteerDetailVO volunteerDetailVO) throws Exception {
		return volunteerDetailDAO.insertVolunteerDetail(volunteerDetailVO);
	}

	@Override
	public int v_noVolunteerDetail() throws Exception {
		int vReg_no =0;
		vReg_no= volunteerDetailDAO.selectVRNoVolunteerDetail().getvReg_no();
		return vReg_no;
	}

	@Override
	public int addVolunteerDetail2(VolunteerDetailVO volunteerDetailVO) throws Exception {
		return volunteerDetailDAO.insertVolunteerDetail2(volunteerDetailVO);
	}

	@Override
	public List listRegVolunteerDetail(int vReg_no) throws Exception {
		List volunteerDetailList = null;
		volunteerDetailList = volunteerDetailDAO.selectListRegVolunteerDetail(vReg_no);
		return volunteerDetailList;
	}



}
