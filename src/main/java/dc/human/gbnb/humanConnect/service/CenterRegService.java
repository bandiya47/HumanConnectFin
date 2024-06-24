package dc.human.gbnb.humanConnect.service;

import dc.human.gbnb.humanConnect.vo.CenterRegVO;

import java.util.List;

public interface CenterRegService {

	 public int addCenterReg(CenterRegVO centerRegVO) throws Exception;
	 public int v_noCenterReg() throws Exception;
	 public List listCenterReg(int v_no) throws Exception;
}
