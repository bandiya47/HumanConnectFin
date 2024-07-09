package dc.human.gbnb.humanConnect.admin.controller;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminNoticeListController {
    ModelAndView adminNoticeList() throws Exception;

    @RequestMapping(value= "/viewNoticeDetail.do", method = RequestMethod.GET)
    ModelAndView viewNoticeDetail(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam("nNumber") String nNumber) throws Exception;
}
