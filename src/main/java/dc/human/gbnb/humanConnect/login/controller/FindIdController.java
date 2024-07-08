package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.vo.FindIdVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

public interface FindIdController {

    public ModelAndView findId(@ModelAttribute("/findId") FindIdVO findIdVO,
                      HttpServletRequest request, HttpServletResponse response) throws Exception;
    public ModelAndView showFindId(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
