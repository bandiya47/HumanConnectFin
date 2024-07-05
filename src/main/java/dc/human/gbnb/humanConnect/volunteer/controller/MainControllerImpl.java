package dc.human.gbnb.humanConnect.volunteer.controller;


import dc.human.gbnb.humanConnect.volunteer.service.MainService;
import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;
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
public class MainControllerImpl implements MainController {

    @Autowired
    private MainService mainService;

    @Override
    @GetMapping("/main")
    public ModelAndView showMain(
            @RequestParam("userId") String userId,
            HttpSession session
    )
    {
        //UserVO user = (UserVO) session.getAttribute("userVO");
        String u_id = userId;

        //String c_name
        ModelAndView mav = new ModelAndView("main");
        List<MainVO> myVolunteerList = mainService.getMyVolunteerList(u_id);
        mav.addObject("myVolunteerList", myVolunteerList);
        mav.addObject("userId", u_id); //넘길때 이름은 걍 두자/
        System.out.println("Main Controller Printing **myVolunteerList**: " + myVolunteerList);
        return mav;
    }


    @Override
    @PostMapping("/main")
    public ModelAndView handlePostRequest(
            @RequestParam("userId") String userId,
            @RequestParam("userVO") UserVO userVO,
            HttpSession session
            )
    {
        UserVO user = (UserVO) session.getAttribute("userVO");

        if (user == null || user.getUserId() == null) {
            return new ModelAndView("redirect:/login");
        }
        String u_id = user.getUserId();

        int updateRow = 0;

        ModelAndView mav = new ModelAndView("/main");
        if (updateRow > 0) {
            mav.addObject("message", "수정되었습니다");
        } else {
            mav.addObject("message", "다시 확인해주세요");
        }
        return mav;
    }

//    원래 showMain 소스
//    @Override
//    @GetMapping("/main")
//    public ModelAndView showMain(@RequestParam("userId") String userId, HttpSession session) {
//        UserVO user = (UserVO) session.getAttribute("userVO");
//        if (userId == null) {
//            return new ModelAndView("redirect:/login");
//        }
//        String u_id = userId;
//        ModelAndView mav = new ModelAndView("main");
//        List<MainVO> myVolunteerList = mainService.getMyVolunteerList(userId);
//        System.out.println("리스트: " + myVolunteerList);
//        mav.addObject("myVolunteerList", myVolunteerList);
//        mav.addObject("userId", userId);
//
//        return mav;
//    }

}