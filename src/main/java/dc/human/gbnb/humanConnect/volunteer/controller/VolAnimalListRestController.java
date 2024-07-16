package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalSidoListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalSigunguListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalKindListVO;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface VolAnimalListRestController {
    Map<String, Object> getAnimalList(
            @RequestParam int numOfRows,
            @RequestParam int pageNo,
            @RequestParam String uprCd,
            @RequestParam String orgCd,
            @RequestParam String kindCd);
    List<VolAnimalSidoListVO> getSidoList();
    List<VolAnimalSigunguListVO> getSigunguList(@RequestParam String uprCd);
    List<VolAnimalKindListVO> getKindList(@RequestParam String uprCd);
}
