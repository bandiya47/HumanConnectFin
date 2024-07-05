package dc.human.gbnb.humanConnect.admin.controller;

import dc.human.gbnb.humanConnect.admin.vo.CenterMemberVO;
import dc.human.gbnb.humanConnect.admin.vo.MemberVO;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminController {
    ModelAndView showMemberList(@RequestParam(value = "searchQuery", required = false) String searchQuery);
    ModelAndView showMemberDetail(@RequestParam("u_id") String u_id);
    String updateMember(MemberVO memberVO);
    String deleteMember(@RequestParam("u_id") String u_id);
    public ModelAndView showCenterMemberList(@RequestParam(value = "searchQuery", required = false) String searchQuery,
                                             @RequestParam(value = "page", defaultValue = "1") int page,
                                             @RequestParam(value = "size", defaultValue = "10") int size);
    ModelAndView showCenterMemberDetail(@RequestParam("c_id") String c_id);
    String updateCenterMember(CenterMemberVO centerMember);
    String deleteCenterMember(@RequestParam("c_id") String c_id);
}
