package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.dao.CenterListDAO;
import dc.human.gbnb.humanConnect.volunteer.vo.CenterListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("centerListService")
@Transactional(propagation = Propagation.REQUIRED)
public class CenterListServiceImpl implements CenterListService {
	@Autowired
	private CenterListDAO centerListDAO;





	@Override
	public int addAdoptCenterList(CenterListVO centerListVO) throws Exception {
		return centerListDAO.insertAdoptCenterList(centerListVO);
	}

	@Override
	public int addCenterList(CenterListVO centerListVO) throws Exception {
		return centerListDAO.insertCenterList(centerListVO);
	}

	public int selectNmCenterList(String name) throws Exception {
		int no =0;
		no= centerListDAO.selectNoCenterList(name).getSelect();
		return no;
	}


	public List listvolCenterList(String careNm) throws Exception {
		List volCenterList = null;
		volCenterList = centerListDAO.selectListVolCenterList(careNm);
		return volCenterList;
	}



}
