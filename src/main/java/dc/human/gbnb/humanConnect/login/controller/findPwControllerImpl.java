package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.service.LoginFindPwService;
import dc.human.gbnb.humanConnect.login.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class findPwControllerImpl implements findPwController{

    @Autowired
    private LoginFindPwService loginFindPwService;

    @RequestMapping(method = RequestMethod.GET, value="/viewFindPw.do")
    public ModelAndView viewFindPw(HttpSession session){
        ModelAndView mav = new ModelAndView("/loginPw");

        return mav;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/findPw.do")
    @ResponseBody
    public String findPw(
            @RequestParam(name="userId") String userId,
            HttpSession session
    ) {
        String Result = null;
        try {

            System.out.println(userId);
            Result=loginFindPwService.findPw(userId);
            System.out.println(Result);
            if(Result.equals(userId)){
                System.out.println("ok");
                return Result;

            }else{
                Result= "no";
                return Result;
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return Result;
    }

    @Override
    @RequestMapping(method = RequestMethod.POST, value="/rePw.do")
    @ResponseBody
    public String rePw(
            @RequestParam(name="userId") String userId,
            @RequestParam(name="userPw") String userPw,
            HttpSession session
    ) {
        String Result = null;
        try {

            System.out.println(userId);

            int update=0;
            update=loginFindPwService.rePw(userId,userPw);

            if(update>0){
                Result=userId;
                return Result;

            }else{
                Result= "no";
                return Result;
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return Result;
    }


}
