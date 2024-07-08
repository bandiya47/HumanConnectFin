package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.service.FindIdService;
import dc.human.gbnb.humanConnect.login.vo.FindIdVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@RequestMapping("/findId") 메서드가 아니라 클래스를 통해 맵핑이 되기때문에 주석처리
public class FindIdControllerImpl implements FindIdController {

    @Autowired
    private FindIdService findIdService;

    @Override
    @PostMapping("/findId")
    public ModelAndView findId(@ModelAttribute("findId") FindIdVO findIdVO,
                               HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        FindIdVO result = findIdService.findMember(findIdVO);

        ModelAndView mav = new ModelAndView("findIdResult");  // findIdResult.jsp에 해당하는 뷰 이름
        mav.addObject("result", result);
        return mav;
    }

    @Override
    @GetMapping("/findId")
    public ModelAndView showFindId(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        return new ModelAndView("/findId");  // findId.jsp에 해당하는 뷰 이름
    }


}


