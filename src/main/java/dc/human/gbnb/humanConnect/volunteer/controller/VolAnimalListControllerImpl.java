package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.service.VolAnimalListService;
import dc.human.gbnb.humanConnect.volunteer.vo.VolAnimalListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class VolAnimalListControllerImpl implements VolAnimalListController {

    @Autowired
    private VolAnimalListService volAnimalListService;

    @Override
    @RequestMapping("/volAnimalList")
    public String getAnimalListPage(Model model,
                                    @RequestParam(defaultValue = "12") int numOfRows,
                                    @RequestParam(defaultValue = "1") int pageNo,
                                    @RequestParam(defaultValue = "") String uprCd,
                                    @RequestParam(defaultValue = "") String orgCd,
                                    @RequestParam(defaultValue = "") String kindCd,
                                    @RequestParam("userId") String userId) {
        List<VolAnimalListVO> animalList = volAnimalListService.getAnimalList(numOfRows, pageNo, uprCd, orgCd, kindCd);
        model.addAttribute("animalList", animalList);
        model.addAttribute("userId", userId);
        return "volAnimalList"; // JSP 파일명 (volAnimalList.jsp)
    }
}
