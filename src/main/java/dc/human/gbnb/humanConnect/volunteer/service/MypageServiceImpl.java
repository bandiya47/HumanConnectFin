package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.dao.MypageDAO;
import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;

import java.util.List;


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
	//봉사마이페이지
	@Override
	public List<MypageVO> getMypageVolunteerList(String u_id) {
		System.out.println("Service received u_id: " + u_id);
		List<MypageVO> mypageVolunteerList = mypageDAO.getMypageVolunteerList(u_id);
		if (mypageVolunteerList != null) {
			for (MypageVO vol : mypageVolunteerList) {
				if (vol == null) {
					System.out.println("vol is null");
				} else {
					System.out.println("vol_u_id: " + vol.getU_id());
					System.out.println("vol_v_no: " + vol.getV_no());
					System.out.println("vol_v_title: " + vol.getV_title());
					System.out.println("vol_vreg_start_date: " + vol.getVreg_start_date());
					System.out.println("vol_vreg_end_date: " + vol.getVreg_end_date());
					System.out.println("vol_c_name: " + vol.getC_name());
					System.out.println("vol_c_phone: " + vol.getC_phone());
					System.out.println("vol_service_type: " + vol.getService_type());
				}
			}
		} else {
			System.out.println("myVolunteerList is null");
		}
		return mypageVolunteerList;
	}

}