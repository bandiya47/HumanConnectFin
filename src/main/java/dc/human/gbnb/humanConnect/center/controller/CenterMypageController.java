package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface CenterMypageController {
    //개인정보내역 출력
    public ModelAndView centerPrivacyList(@RequestParam("centerId") String userId,
                                          HttpServletRequest request,
                                          HttpServletResponse response) throws Exception;
    //

    //수정하는 창으로 넘어감
    public ModelAndView centerUpdatePrivacy(@RequestParam("centerId") String userId,
                                            HttpServletRequest request,
                                            HttpServletResponse response) throws Exception;

    //수정입력을 저장해줌
    public ModelAndView centerSavePrivacy(
                                   @ModelAttribute() MypageVO mypageVO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception;
    //비번확인하는 창으로 넘어감
    public ModelAndView showCenterPrivacyPw(@RequestParam("centerId") String userId,
                                            HttpServletRequest request, HttpServletResponse response) throws Exception;

    //비밀번호 입력을 처리해줌.
    public ModelAndView checkCenterPrivacyPw(@RequestParam("centerId") String userId,
                                       @RequestParam("c_pwd") String c_pwd,
                                       HttpServletRequest request,
                                       HttpServletResponse response) throws Exception;
}




