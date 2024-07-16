package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalSidoListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalSigunguListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalKindListVO;

import java.util.List;

public interface VolAnimalListService {
    List<VolAnimalListVO> getAnimalList(int numOfRows, int pageNo, String uprCd, String orgCd, String kindCd);
    List<VolAnimalSidoListVO> getSidoList();
    List<VolAnimalSigunguListVO> getSigunguList(String uprCd);
    List<VolAnimalKindListVO> getKindList(String uprCd);
    int getTotalCount(String uprCd, String orgCd, String kindCd);
}
