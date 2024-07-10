package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterMainService;
import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller("centerMainController")
public class CenterMainControllerImpl implements CenterMainController {

    @Autowired
    private CenterMainService centerMainService;

    @Override
    @GetMapping("/centerMain")
    public ModelAndView showCenterMain(@RequestParam("userId") String userId,
                                       @RequestParam(value = "page", defaultValue = "1") int page,
                                       @RequestParam(value = "size", defaultValue = "7") int size) {
        String centerId = userId;
        int offset = (page - 1) * size;

        ModelAndView mav = new ModelAndView("centerMain");
        List<CenterMainVO> recruitmentList = centerMainService.getRecruitmentList(centerId, offset, size);
        int totalRecords = centerMainService.getTotalRecruitments(centerId);
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        mav.addObject("recruitmentList", recruitmentList);
        mav.addObject("volunteerList", centerMainService.getVolunteerList(centerId));
        mav.addObject("adoptionList", centerMainService.getAdoptionList(centerId, offset, size));
        mav.addObject("centerId", userId);
        mav.addObject("currentPage", page);
        mav.addObject("totalPages", totalPages);

        return mav;
    }

    @Override
    @PostMapping("/centerMain")
    public ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam("centerId") String centerId,
            @RequestParam("section") String section,
            @RequestParam(value = "rejectReason", required = false) String rejectReason,
            @RequestParam("resNo") String resNo
    ) {
        int updateRow = 0;

        if ("approve".equals(action)) {
            if ("recruitment".equals(section)) {
                updateRow = centerMainService.updateRecruitmentStatus(userId, 1, null, centerId, resNo);
            } else if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 1, null, centerId, resNo);
            }
        } else if ("reject".equals(action)) {
            if ("recruitment".equals(section)) {
                updateRow = centerMainService.updateRecruitmentStatus(userId, 2, rejectReason, centerId, resNo);
            } else if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 2, rejectReason, centerId, resNo);
            }
        } else if ("complete".equals(action)) {
            if ("recruitment".equals(section)) {
                updateRow = centerMainService.updateRecruitmentStatus(userId, 3, null, centerId, resNo);
            } else if ("volunteer".equals(section)) {
                updateRow = centerMainService.updateVolunteerStatus(userId, 3, null, centerId, resNo);
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

    @Override
    @GetMapping("/centerAdoptionList")
    public ModelAndView showAdoptionList(@RequestParam("centerId") String centerId,
                                         @RequestParam(value = "page", defaultValue = "1") int page,
                                         @RequestParam(value = "size", defaultValue = "7") int size) {
        List<CenterMainVO> adoptionList = centerMainService.getAdoptionList(centerId, page, size);
        int totalRecords = centerMainService.getTotalAdoptions(centerId);
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        ModelAndView mav = new ModelAndView("centerAdoptionList");
        mav.addObject("adoptionList", adoptionList);
        mav.addObject("centerId", centerId);
        mav.addObject("currentPage", page);
        mav.addObject("totalPages", totalPages);

        return mav;
    }
}