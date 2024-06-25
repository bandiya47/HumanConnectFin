package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.vo.UserVO;
import jakarta.servlet.http.HttpSession;
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

    @RequestMapping(method = RequestMethod.POST, value="/login")
    public ModelAndView login(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="password") String userPassword,
            HttpSession session
    ) {
        ModelAndView mav = new ModelAndView();
        try {

            String msg = "";
            String viewName = "";
            UserVO userVO = null;

            System.out.println("userId:"+userId+":userPassword:"+userPassword);
            String userType = loginService.validateUser(userId, userPassword);
            System.out.println("userType:"+userType);

            if (!"".equals(userType)) {
                userVO = loginService.getUserDetails(userId, userType);
                session.setAttribute("userVO", userVO);
                if ("VOLUNTEER_USER".equals(userType)) {
                    viewName = "redirect:/main";
                    //  rdao.getVolList() 추가적으로 작업하세요
                } else {
                    viewName = "redirect:/centerMain";
                }
            } else {
                viewName = "login";
                mav.addObject("error","1");
            }

            System.out.println("viewName:"+viewName);

            mav.addObject("userVO",userVO);
            mav.addObject("userId",userId);
            mav.setViewName(viewName);

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return mav;
    }
}
