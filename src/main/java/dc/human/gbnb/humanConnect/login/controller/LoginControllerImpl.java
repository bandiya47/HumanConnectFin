package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import dc.human.gbnb.humanConnect.login.service.LoginService;

@Controller
public class LoginControllerImpl implements LoginController{

    @Autowired
    private LoginService loginService;

    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public ModelAndView showLoginPage() {
        return new ModelAndView("login"); // 로그인 페이지를 반환
    }

    @RequestMapping(method = RequestMethod.POST, value = "/login")
    public ModelAndView login(
            @RequestParam(name = "userId") String userId,
            @RequestParam(name = "password") String userPassword
    ) {
        ModelAndView mav = new ModelAndView();
        try {
            String msg = "";
            String viewName = "login"; // 기본 뷰 이름을 로그인 페이지로 설정
            UserVO userVO = null;

            System.out.println("userId:" + userId + ":userPassword:" + userPassword);
            String userType = loginService.validateUser(userId, userPassword);
            System.out.println("userType:" + userType);

            if (userType != null && !userType.isEmpty()) {
                userVO = loginService.getUserDetails(userId, userType);

                if ("VOLUNTEER_USER".equals(userType)) {
                    if (userVO.getUType() == 1) {
                        viewName = "redirect:/main";
                    } else if (userVO.getUType() == 0) {
                        viewName = "redirect:/adminMain";
                    }
                } else if ("CENTER_MNG_TABLE".equals(userType)) {
                    viewName = "redirect:/centerMain";
                }
            } else {
                msg = "아이디 또는 비밀번호가 잘못되었습니다.";
                mav.addObject("errorMessage", msg);
            }

            System.out.println("viewName:" + viewName);

            mav.addObject("userVO", userVO);
            mav.addObject("userId", userId);
            mav.setViewName(viewName);

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return mav;
    }
}
