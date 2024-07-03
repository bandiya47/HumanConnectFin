package dc.human.gbnb.humanConnect.center.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CenterRecruitListController {
    @PostMapping("/recruitlist")
    ModelAndView centerRecruitList(@RequestParam("centerId") String centerId);
}