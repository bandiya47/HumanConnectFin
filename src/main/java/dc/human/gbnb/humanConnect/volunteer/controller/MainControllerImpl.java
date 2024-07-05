package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.service.MainService;
import dc.human.gbnb.humanConnect.volunteer.vo.MainVO;
import dc.human.gbnb.humanConnect.login.vo.UserVO;
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
            @RequestParam("userId") String userId
    ) {
        System.out.println("Received userId: " + userId);
        ModelAndView mav = new ModelAndView("main");
        List<MainVO> myVolunteerList = mainService.getMyVolunteerList(userId);
        mav.addObject("myVolunteerList", myVolunteerList);
        mav.addObject("userId", userId);
        System.out.println("Main Controller Printing **myVolunteerList**: " + myVolunteerList);
        return mav;
    }

    @Override
    @PostMapping("/main")
    public ModelAndView handlePostRequest(
            @RequestParam("userId") String userId,
            @RequestParam("userVO") UserVO userVO
    ) {
        // 만약 userVO가 null이거나 userId가 null이면 로그인 페이지로 리다이렉트
        if (userVO == null || userVO.getUserId() == null) {
            return new ModelAndView("redirect:/login");
        }

        String u_id = userVO.getUserId();
        int updateRow = 0;

        ModelAndView mav = new ModelAndView("main");
        if (updateRow > 0) {
            mav.addObject("message", "수정되었습니다");
        } else {
            mav.addObject("message", "다시 확인해주세요");
        }
        return mav;
    }
}
