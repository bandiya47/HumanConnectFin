package dc.human.gbnb.humanConnect.login.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface findPwController {

    public String findPw(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userName") String userName,
            @RequestParam(name="userEmail") String userEmail,
            HttpSession session);
    public String rePw(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userPw") String userPw,
            HttpSession session);
}
