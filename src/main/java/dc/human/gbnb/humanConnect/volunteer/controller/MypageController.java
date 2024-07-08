package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.vo.MypageVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface MypageController {
    //user 개인정보내역 출력
    public ModelAndView privacyList(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception;
    //

    //수정하는 창으로 넘어감
    public ModelAndView updatePrivacy(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception;
    //수정입력을 저장해줌
    public ModelAndView savePrivacy(
                                   @ModelAttribute() MypageVO mypageVO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception;
    //비번확인하는 창으로 넘어감
    public ModelAndView showPrivacyPw(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception;

    //비밀번호 입력을 처리해줌.
    public ModelAndView checkPrivacyPw(@RequestParam("userId") String userId,
                                       @RequestParam("u_pwd") String u_pwd,
                                       HttpServletRequest request,
                                       HttpServletResponse response) throws Exception;

    //회원 탈퇴를 처리해줌
    public ModelAndView removePrivacy(@RequestParam("userId") String u_id, HttpServletRequest request, HttpServletResponse response) throws Exception;


}




