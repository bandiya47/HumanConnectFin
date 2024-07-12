package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.service.LoginFindPwService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Logger;

@RestController
public class findPwControllerImpl implements findPwController {

    @Autowired
    private LoginFindPwService loginFindPwService;

    private static final Logger logger = Logger.getLogger(findPwControllerImpl.class.getName());
    @RequestMapping(method = RequestMethod.GET, value="/viewFindPw.do")
    public ModelAndView viewFindPw(HttpSession session){
        return new ModelAndView("/loginPw");
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/findPw.do")
    @ResponseBody
    public String findPw(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userName") String userName,
            @RequestParam(name="userEmail") String userEmail,
            HttpSession session) {
        String result;
        try {
            result = loginFindPwService.findPw(userId, userName, userEmail);
            if (result != null) {
                return result;
            } else {
                return "no";
            }
        } catch (Exception ex) {
        }
        return "no";
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/rePw.do")
    @ResponseBody
    public String rePw(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userPw") String userPw,
            HttpSession session) {
        String result;
        try {
            int update = loginFindPwService.rePw(userId, userPw);
            if(update > 0){
                result = userId;
                return result;
            } else {
                return "no";
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return "error";
        }
    }
}