package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.login.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MainController {

    ModelAndView showMain(HttpSession session);

    ModelAndView handlePostRequest(
            @RequestParam("userId") String userId,@RequestParam("userVO") UserVO userVO,
            HttpSession session
    );
}