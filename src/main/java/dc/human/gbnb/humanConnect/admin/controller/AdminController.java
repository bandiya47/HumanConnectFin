package dc.human.gbnb.humanConnect.admin.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminController {
    ModelAndView showMemberList(@RequestParam(value = "searchQuery", required = false) String searchQuery);
    ModelAndView showMemberDetail(@RequestParam("u_id") String u_id);
}
