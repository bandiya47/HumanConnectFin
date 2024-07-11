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
    public ModelAndView showMemberList(@RequestParam(value = "searchQuery", required = false) String searchQuery,
                                       @RequestParam(value = "page", defaultValue = "1") int page,
                                       @RequestParam(value = "size", defaultValue = "20") int size) {
        ModelAndView mav = new ModelAndView("adminMain");
        List<MemberVO> memberList;
        if (searchQuery != null && !searchQuery.isEmpty()) {
            memberList = memberService.searchMembers(searchQuery, page, size);
        } else {
            memberList = memberService.listMembers(page, size);
        }
        int totalRecords = searchQuery != null && !searchQuery.isEmpty() ? memberService.countSearchedMembers(searchQuery) : memberService.countAllMembers();
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        mav.addObject("memberList", memberList);
        mav.addObject("searchQuery", searchQuery);
        mav.addObject("currentPage", page);
        mav.addObject("totalPages", totalPages);
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
    public ModelAndView showCenterMemberList(@RequestParam(value = "searchQuery", required = false) String searchQuery,
                                             @RequestParam(value = "page", defaultValue = "1") int page,
                                             @RequestParam(value = "size", defaultValue = "20") int size) {
        ModelAndView mav = new ModelAndView("adminCenterMem");
        List<CenterMemberVO> centerMemberList;

        if (searchQuery == null || searchQuery.isEmpty()) {
            centerMemberList = centerMemberService.listAllCenterMembers(page, size);
        } else {
            centerMemberList = centerMemberService.searchCenterMembers(searchQuery, page, size);
        }

        mav.addObject("centerMemberList", centerMemberList);
        mav.addObject("searchQuery", searchQuery);
        mav.addObject("currentPage", page);
        int totalRecords = searchQuery == null || searchQuery.isEmpty() ? centerMemberService.countAllCenterMembers() : centerMemberService.countSearchedCenterMembers(searchQuery);
        int totalPages = (int) Math.ceil((double) totalRecords / size);
        mav.addObject("totalPages", totalPages);
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
    public String updateCenterMember(@RequestParam("oldCId") String oldCId, CenterMemberVO centerMember) {
        centerMember.setOldCId(oldCId); // oldCId 설정
        centerMemberService.updateCenterMember(centerMember);
        return "redirect:/adminCenterMem";
    }

    @Override
    @PostMapping("/deleteCenterMember")
    public String deleteCenterMember(@RequestParam("c_id") String c_id) {
        centerMemberService.deleteCenterMember(c_id);
        return "redirect:/adminCenterMem";
    }
}
