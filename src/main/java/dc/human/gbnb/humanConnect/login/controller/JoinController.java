package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.vo.JoinVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

public interface JoinController {

    @PostMapping("/join")
    ModelAndView processJoin(@ModelAttribute("join") JoinVO joinVO,
                             HttpServletRequest request, HttpServletResponse response) throws Exception;

    @GetMapping("/join")
    ModelAndView showJoin(HttpServletRequest request, HttpServletResponse response) throws Exception;

    @PostMapping("/checkUserIdDuplicate")
    @ResponseBody
    Map<String, String> checkUserIdDuplicate(@RequestParam("u_Id") String u_Id) throws Exception;
}
