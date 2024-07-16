package dc.human.gbnb.humanConnect.login.controller;

import dc.human.gbnb.humanConnect.login.service.JoinService;
import dc.human.gbnb.humanConnect.login.vo.JoinVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;


@RestController
public class JoinControllerImpl implements JoinController {

    @Autowired
    private JoinService joinService;

    @Override
    @PostMapping("/join")
    public ModelAndView processJoin(@ModelAttribute("join") JoinVO joinVO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        int result = joinService.addMember(joinVO); // 회원가입 처리 서비스 호출

        ModelAndView mav = new ModelAndView("joinResult"); // 회원가입 결과 페이지로 이동
        if (result > 0) {
            mav.addObject("success", true); // 회원가입 성공 여부 전달
        } else {
            mav.addObject("success", false); // 회원가입 실패 여부 전달
        }
        return mav;
    }

    @Override
    @GetMapping("/join")
    public ModelAndView showJoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        return new ModelAndView("join"); // 회원가입 폼 페이지로 이동
    }

    @Override
    @PostMapping("/checkUserIdDuplicate")
    @ResponseBody
    public Map<String, String> checkUserIdDuplicate(@RequestParam("u_Id") String u_Id) throws Exception {
        Map<String, String> response = new HashMap<>();
        if (joinService.isUserIdDuplicate(u_Id)) {
            response.put("status", "duplicate");
        } else {
            response.put("status", "available");
        }
        return response;
    }

}



    // 회원가입 처리 서블릿 (예시)
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
//        // 회원가입 로직 처리
//        boolean isSuccess =      // 회원가입 로직에 따라 true 또는 false로 설정
//                request.setAttribute("isSuccess", isSuccess);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
//        dispatcher.forward(request, response);
//    }

