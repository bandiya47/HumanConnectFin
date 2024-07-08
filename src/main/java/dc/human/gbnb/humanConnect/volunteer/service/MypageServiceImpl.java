package dc.human.gbnb.humanConnect.volunteer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dc.human.gbnb.humanConnect.volunteer.dao.MypageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dc.human.gbnb.humanConnect.volunteer.dao.MypageDAO;
import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;


@Service("mypageService")	//빈으로 등록되는 이름
@Transactional(propagation = Propagation.REQUIRED) //트랜젝션 관리대상. REQUIRED 속성.
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public MypageVO privacyList(String u_id) throws Exception {
		return mypageDAO.selectAllPrivacyList(u_id);
	}


	public int updateUserDetails(MypageVO mypageVO) throws Exception {
		return mypageDAO.updateUserDetails(mypageVO);
	}

	@Override
	public int checkPrivacyPw(String userId, String u_pwd) throws Exception {
		return mypageDAO.checkPrivacyPw(userId, u_pwd);
	}

	@Override
	public int removePrivacy(String u_id) throws Exception {
		return mypageDAO.deletePrivacy(u_id);
	}

}