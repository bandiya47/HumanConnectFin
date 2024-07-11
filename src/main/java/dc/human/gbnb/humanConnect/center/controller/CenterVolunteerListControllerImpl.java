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
import java.util.logging.Logger;

@Controller("centerVolunteerListController")
public class CenterVolunteerListControllerImpl implements CenterVolunteerListController {

    private static final Logger logger = Logger.getLogger(CenterVolunteerListControllerImpl.class.getName());

    @Autowired
    private CenterMainService centerMainService;

    @GetMapping("/centerVolunteerList")
    @Override
    public ModelAndView showVolunteerList(
            @RequestParam("centerId") String centerId,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "5") int size) {
        ModelAndView mav = new ModelAndView("centerVolunteerList");
        List<CenterMainVO> volunteerList = centerMainService.getVolunteerList(centerId, page, size);
        int totalRecords = centerMainService.getTotalVolunteers(centerId);
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        mav.addObject("volunteerList", volunteerList);
        mav.addObject("centerId", centerId);
        mav.addObject("currentPage", page);
        mav.addObject("totalPages", totalPages);
        return mav;
    }

    @PostMapping("/centerVolunteerList")
    @Override
    public ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam("centerId") String centerId,
            @RequestParam("resNo") String resNo,
            @RequestParam(value = "rejectReason", required = false) String rejectReason) {
        logger.info("Received POST request with action: " + action + ", userId: " + userId + ", centerId: " + centerId + ", resNo: " + resNo + ", rejectReason: " + rejectReason);
        int updateRow = 0;

        if ("approve".equals(action)) {
            updateRow = centerMainService.updateVolunteerStatus(userId, 1, null, centerId, resNo);
        } else if ("reject".equals(action)) {
            updateRow = centerMainService.updateVolunteerStatus(userId, 2, rejectReason, centerId, resNo);
        } else if ("complete".equals(action)) {
            updateRow = centerMainService.updateVolunteerStatus(userId, 3, null, centerId, resNo);
        }

        logger.info("Update result: " + updateRow);

        ModelAndView mav = new ModelAndView("redirect:/centerVolunteerList");
        mav.addObject("centerId", centerId);
        return mav;
    }
}