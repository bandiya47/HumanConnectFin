package dc.human.gbnb.humanConnect.center.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CenterMainController {
    ModelAndView showCenterMain(@RequestParam("userId") String userId);

    ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam(value = "rejectReason", required = false) String rejectReason
    );
}