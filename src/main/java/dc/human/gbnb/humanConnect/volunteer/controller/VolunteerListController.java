package dc.human.gbnb.humanConnect.volunteer.controller;


import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface VolunteerListController {
    ModelAndView volunteerList
            (@RequestParam("userId") String userId,
             @RequestParam(value = "page", defaultValue = "1") int page,
             @RequestParam(value = "size", defaultValue = "10") int size) throws Exception;
}
