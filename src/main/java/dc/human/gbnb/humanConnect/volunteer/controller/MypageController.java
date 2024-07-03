package dc.human.gbnb.humanConnect.volunteer.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface MypageController {

    public ModelAndView privacyList( @RequestParam("userId") String userId,HttpServletRequest request, HttpServletResponse response) throws Exception;
    public ModelAndView CenterprivacyList( @RequestParam("centerId") String userId,HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView privacyEdit(@RequestParam("u_id") String u_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
