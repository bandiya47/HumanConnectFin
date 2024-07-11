package dc.human.gbnb.humanConnect.center.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.logging.Logger;

public interface CenterVolunteerListController {

    Logger logger = Logger.getLogger(CenterVolunteerListController.class.getName());

    ModelAndView showVolunteerList(@RequestParam("centerId") String centerId,
                                   @RequestParam(value = "page", defaultValue = "1") int page,
                                   @RequestParam(value = "size", defaultValue = "5") int size);

    ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam("centerId") String centerId,
            @RequestParam("resNo") String resNo,
            @RequestParam(value = "rejectReason", required = false) String rejectReason
    );
}
