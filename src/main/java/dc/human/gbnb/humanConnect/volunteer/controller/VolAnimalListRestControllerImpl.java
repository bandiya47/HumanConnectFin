package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.service.VolAnimalListService;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalSidoListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalSigunguListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalKindListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class VolAnimalListRestControllerImpl implements VolAnimalListRestController {

    @Autowired
    private VolAnimalListService volAnimalListService;

    @Override
    @GetMapping(value = "/animalList", produces = "application/json; charset=UTF-8")
    public Map<String, Object> getAnimalList(
            @RequestParam(defaultValue = "12") int numOfRows,
            @RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(defaultValue = "") String uprCd,
            @RequestParam(defaultValue = "") String orgCd,
            @RequestParam(defaultValue = "") String kindCd) {
        List<VolAnimalListVO> animalList = volAnimalListService.getAnimalList(numOfRows, pageNo, uprCd, orgCd, kindCd);
        int totalCount = volAnimalListService.getTotalCount(uprCd, orgCd, kindCd);
        int totalPage = (int) Math.ceil((double) totalCount / numOfRows);
        Map<String, Object> response = new HashMap<>();
        response.put("animalList", animalList);
        response.put("totalPage", totalPage);
        response.put("currentPage", pageNo);
        return response;
    }

    @Override
    @GetMapping(value= "/sidoList", produces = "application/json; charset=UTF-8")
    public List<VolAnimalSidoListVO> getSidoList() {
        return volAnimalListService.getSidoList();
    }

    @Override
    @GetMapping(value= "/sigunguList", produces = "application/json; charset=UTF-8")
    public List<VolAnimalSigunguListVO> getSigunguList(@RequestParam String uprCd) {
        return volAnimalListService.getSigunguList(uprCd);
    }

    @Override
    @GetMapping(value= "/kindList", produces = "application/json; charset=UTF-8")
    public List<VolAnimalKindListVO> getKindList(@RequestParam String uprCd) {
        return volAnimalListService.getKindList(uprCd);
    }
}
