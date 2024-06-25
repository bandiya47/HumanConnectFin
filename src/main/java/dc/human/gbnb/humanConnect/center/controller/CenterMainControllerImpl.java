package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterMainService;
import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import dc.human.gbnb.humanConnect.login.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CenterMainControllerImpl implements CenterMainController {

    @Autowired
    private CenterMainService centerMainService;

    @Override
    @GetMapping("/centerMain")
    public ModelAndView showCenterMain(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("userVO");

        if (user == null || user.getUserId() == null) {
            return new ModelAndView("redirect:/login");
        }

        String centerId = user.getUserId();

        ModelAndView mav = new ModelAndView("centerMain");
        List<CenterMainVO> recruitmentList = centerMainService.getRecruitmentList(centerId);
        List<CenterMainVO> volunteerList = centerMainService.getVolunteerList(centerId);
        List<CenterMainVO> adoptionList = centerMainService.getAdoptionList(centerId);

        System.out.println("리스트: " + recruitmentList);

        mav.addObject("recruitmentList", recruitmentList);
        mav.addObject("volunteerList", volunteerList);
        mav.addObject("adoptionList", adoptionList);
        mav.addObject("latestRecruitmentTitle", centerMainService.getLatestRecruitmentTitle(centerId));

        return mav;
    }

    @Override
    @PostMapping("/centerMain")
    public ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam(value = "rejectReason", required = false) String rejectReason,
            HttpSession session
    ) {
        UserVO user = (UserVO) session.getAttribute("userVO");

        if (user == null || user.getUserId() == null) {
            return new ModelAndView("redirect:/login");
        }

        String centerId = user.getUserId();
        int updateRow = 0;

        if ("approve".equals(action)) {
            updateRow = centerMainService.updateStatus(userId, 1, null, centerId);
        } else if ("reject".equals(action)) {
            updateRow = centerMainService.updateStatus(userId, 2, rejectReason, centerId);
        } else if ("complete".equals(action)) {
            updateRow = centerMainService.updateStatus(userId, 3, null, centerId);
        }

        ModelAndView mav = new ModelAndView("redirect:/centerMain");
        if (updateRow > 0) {
            mav.addObject("message", "수정되었습니다");
        } else {
            mav.addObject("message", "다시 확인해주세요");
        }

        return mav;
    }
}