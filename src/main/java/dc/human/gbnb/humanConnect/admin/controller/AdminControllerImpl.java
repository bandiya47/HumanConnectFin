package dc.human.gbnb.humanConnect.admin.controller;

import dc.human.gbnb.humanConnect.admin.service.CenterMemberService;
import dc.human.gbnb.humanConnect.admin.service.MemberService;
import dc.human.gbnb.humanConnect.admin.vo.CenterMemberVO;
import dc.human.gbnb.humanConnect.admin.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminControllerImpl implements AdminController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private CenterMemberService centerMemberService;


    @Override
    @GetMapping("/adminMain")
    public ModelAndView showMemberList(@RequestParam(value = "searchQuery", required = false) String searchQuery) {
        ModelAndView mav = new ModelAndView("adminMain");
        List<MemberVO> memberList;
        if (searchQuery != null && !searchQuery.isEmpty()) {
            memberList = memberService.searchMembers(searchQuery);
        } else {
            memberList = memberService.listMembers();
        }
        mav.addObject("memberList", memberList);
        mav.addObject("searchQuery", searchQuery);
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

    @PostMapping("/updateMember")
    public String updateMember(MemberVO memberVO) {
        memberService.updateMember(memberVO);
        return "redirect:/adminMain";
    }

    @PostMapping("/deleteMember")
    public String deleteMember(@RequestParam("u_id") String u_id) {
        memberService.deleteMember(u_id);
        return "redirect:/adminMain";
    }

    @Override
    @GetMapping("/adminCenterMem")
    public ModelAndView showCenterMemberList(@RequestParam(value = "searchQuery", required = false) String searchQuery) {
        ModelAndView mav = new ModelAndView("adminCenterMem");
        List<CenterMemberVO> centerMemberList;

        if (searchQuery == null || searchQuery.isEmpty()) {
            centerMemberList = centerMemberService.listAllCenterMembers();
        } else {
            centerMemberList = centerMemberService.searchCenterMembers(searchQuery);
        }

        mav.addObject("centerMemberList", centerMemberList);
        mav.addObject("searchQuery", searchQuery);
        return mav;
    }

    @Override
    @GetMapping("/centerMemberDetail")
    public ModelAndView showCenterMemberDetail(@RequestParam("c_id") String c_id) {
        ModelAndView mav = new ModelAndView("centerMemDetail");
        CenterMemberVO centerMember = centerMemberService.getCenterMemberById(c_id);
        mav.addObject("centerMember", centerMember);
        return mav;
    }
    @Override
    @PostMapping("/updateCenterMember")
    public String updateCenterMember(CenterMemberVO centerMember) {
        centerMemberService.updateCenterMember(centerMember);
        return "redirect:/centerMember";
    }

    @Override
    @PostMapping("/deleteCenterMember")
    public String deleteCenterMember(@RequestParam("c_id") String c_id) {
        centerMemberService.deleteCenterMember(c_id);
        return "redirect:/centerMember";
    }
}
