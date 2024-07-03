package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("centerMainController")
public class CenterMainControllerImpl implements CenterMainController {

    @Autowired
    private CenterMainService centerMainService;

    @Override
    @GetMapping("/centerMain")
    public ModelAndView showCenterMain(@RequestParam("userId") String userId) {
        String centerId = userId;

        String vTitle = centerMainService.getLatestRecruitmentTitle(centerId);
        ModelAndView mav = new ModelAndView("centerMain");
        mav.addObject("latestRecruitmentTitle", vTitle);
        mav.addObject("recruitmentList", centerMainService.getRecruitmentList(centerId, vTitle));
        mav.addObject("volunteerList", centerMainService.getVolunteerList(centerId));
        mav.addObject("adoptionList", centerMainService.getAdoptionList(centerId));
        mav.addObject("centerId", userId);

        return mav;
    }

    @Override
    @PostMapping("/centerMain")
    public ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam("centerId") String centerId,
            @RequestParam("section") String section,
            @RequestParam(value = "rejectReason", required = false) String rejectReason
    ) {
        int updateRow = 0;

        if ("approve".equals(action)) {
            if ("recruitment".equals(section)) {
                updateRow = centerMainService.updateRecruitmentStatus(userId, 1, null, centerId);
            } else if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 1, null, centerId);
            }
        } else if ("reject".equals(action)) {
            if ("recruitment".equals(section)) {
                updateRow = centerMainService.updateRecruitmentStatus(userId, 2, rejectReason, centerId);
            } else if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 2, rejectReason, centerId);
            }
        } else if ("complete".equals(action)) {
            if ("recruitment".equals(section)) {
                updateRow = centerMainService.updateRecruitmentStatus(userId, 3, null, centerId);
            } else if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 3, null, centerId);
            }
        }

        ModelAndView mav = new ModelAndView("redirect:/centerMain");
        mav.addObject("userId", centerId);
        if (updateRow > 0) {
            mav.addObject("message", "수정되었습니다");
        } else {
            mav.addObject("message", "다시 확인해주세요");
        }

        return mav;
    }
}