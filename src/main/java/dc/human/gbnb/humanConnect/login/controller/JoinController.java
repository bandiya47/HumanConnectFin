package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.vo.JoinVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;

public interface JoinController {

    @PostMapping("/join")
    ModelAndView processJoin(@ModelAttribute("join") JoinVO joinVO,
                             HttpServletRequest request, HttpServletResponse response) throws Exception;

    @GetMapping("/join")
    ModelAndView showJoin(HttpServletRequest request, HttpServletResponse response) throws Exception;

    @GetMapping("/checkUserId")
    @ResponseBody
    boolean checkUserId(@RequestParam("u_Id") String u_Id);
}
