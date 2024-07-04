package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.vo.CenterListVO;

import java.util.List;

public interface CenterListService {

	 public int addAdoptCenterList(CenterListVO centerListVO) throws Exception;
	 public int addCenterList(CenterListVO centerListVO) throws Exception;
	 public int selectNmCenterList(String name) throws Exception;
	 public List listvolCenterList(String careNm) throws Exception;


}
