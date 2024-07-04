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



}
