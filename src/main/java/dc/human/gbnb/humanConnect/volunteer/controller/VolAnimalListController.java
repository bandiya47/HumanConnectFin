package dc.human.gbnb.humanConnect.volunteer.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

public interface VolAnimalListController {
    String getAnimalListPage(Model model,
                             @RequestParam(defaultValue = "10") int numOfRows,
                             @RequestParam(defaultValue = "1") int pageNo,
                             @RequestParam(defaultValue = "") String uprCd,
                             @RequestParam(defaultValue = "") String orgCd,
                             @RequestParam(defaultValue = "") String kindCd);
}
