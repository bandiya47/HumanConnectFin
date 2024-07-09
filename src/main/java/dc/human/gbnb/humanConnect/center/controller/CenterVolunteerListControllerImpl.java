package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("centerVolunteerListController")
public class CenterVolunteerListControllerImpl implements CenterVolunteerListController {

    @Autowired
    private CenterMainService centerMainService;

    @Override
    @GetMapping("/centerVolunteerList")
    public ModelAndView showVolunteerList(@RequestParam("centerId") String centerId) {
        ModelAndView mav = new ModelAndView("centerVolunteerList");
        mav.addObject("volunteerList", centerMainService.getVolunteerList(centerId));
        mav.addObject("centerId", centerId);
        return mav;
    }

    @Override
    @PostMapping("/centerVolunteerList")
    public ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam("centerId") String centerId,
            @RequestParam("section") String section,
            @RequestParam("resNo") String resNo,
            @RequestParam(value = "rejectReason", required = false) String rejectReason
    ) {
        int updateRow = 0;

        if ("approve".equals(action)) {
            if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 1, null, centerId, resNo);
            }
        } else if ("reject".equals(action)) {
            if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 2, rejectReason, centerId, resNo);
            }
        } else if ("complete".equals(action)) {
            if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 3, null, centerId, resNo);
            }
        }

        ModelAndView mav = new ModelAndView("redirect:/centerVolunteerList");
        mav.addObject("centerId", centerId);
        if (updateRow > 0) {
            mav.addObject("message", "수정되었습니다");
        } else {
            mav.addObject("message", "다시 확인해주세요");
        }

        return mav;
    }
}