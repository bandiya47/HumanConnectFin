package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.vo.CenterMainVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface CenterMainController {

    ModelAndView showCenterMain(HttpSession session);

    ModelAndView handlePostRequest(
            @RequestParam("action") String action,
            @RequestParam("userId") String userId,
            @RequestParam(value = "rejectReason", required = false) String rejectReason,
            HttpSession session
    );
}