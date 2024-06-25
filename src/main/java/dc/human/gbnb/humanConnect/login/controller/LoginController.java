package dc.human.gbnb.humanConnect.login.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface LoginController {

    public ModelAndView login(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="password") String userPassword,
            HttpSession session
    );
}
