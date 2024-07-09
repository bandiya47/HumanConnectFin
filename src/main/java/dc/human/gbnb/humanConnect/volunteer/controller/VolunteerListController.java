package dc.human.gbnb.humanConnect.volunteer.controller;


import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface VolunteerListController {
    ModelAndView volunteerList(@RequestParam("userId") String userId) throws Exception;
}
