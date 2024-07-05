package dc.human.gbnb.humanConnect.admin.controller;

import dc.human.gbnb.humanConnect.admin.service.MemberService;
import dc.human.gbnb.humanConnect.admin.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminControllerImpl implements AdminController {

    @Autowired
    private MemberService memberService;

    @Override
    @GetMapping("/adminMain")
    public ModelAndView showMemberList(@RequestParam(value = "searchQuery", required = false) String searchQuery) {
        ModelAndView mav = new ModelAndView("adminMain");
        List<MemberVO> memberList = memberService.listMembers();
        mav.addObject("memberList", memberList);
        return mav;
    }

    @Override
    @GetMapping("/adminMemDetail")
    public ModelAndView showMemberDetail(@RequestParam("u_id") String u_id) {
        ModelAndView mav = new ModelAndView("adminMemDetail");
        MemberVO member = memberService.getMemberById(u_id);
        mav.addObject("member", member);
        return mav;
    }
}
