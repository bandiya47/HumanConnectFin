package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerDetailVO;

import java.util.List;

public interface VolunteerDetailService {
	 public List listVolunteerDetail(int v_no) throws Exception;
	 public int addVolunteerDetail(VolunteerDetailVO volunteerDetailVO) throws Exception;
	 public int v_noVolunteerDetail() throws Exception;
	 public int addVolunteerDetail2(VolunteerDetailVO volunteerDetailVO) throws Exception;
	 public List listRegVolunteerDetail(int vReg_no) throws Exception;
	 public List listRegVolunteerDetail2(int vReg_no) throws Exception;
	 public int updateVolunteerDetail(VolunteerDetailVO volunteerDetailVO) throws Exception;
	 public int updateVolunteerDetail2(VolunteerDetailVO volunteerDetailVO) throws Exception;




}
