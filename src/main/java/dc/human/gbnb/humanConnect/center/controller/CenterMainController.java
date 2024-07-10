package dc.human.gbnb.humanConnect.center.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CenterMainController {
    public ModelAndView showCenterMain(@RequestParam("userId") String userId,
                                       @RequestParam(value = "page", defaultValue = "1") int page,
                                       @RequestParam(value = "size", defaultValue = "7") int size);

    ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam("centerId") String centerId,
            @RequestParam("section") String section,
            @RequestParam("resNo") String resNo,
            @RequestParam(value = "rejectReason", required = false) String rejectReason
    );
    public ModelAndView showAdoptionList(@RequestParam("centerId") String centerId,
                                         @RequestParam(value = "page", defaultValue = "1") int page,
                                         @RequestParam(value = "size", defaultValue = "7") int size);
}
