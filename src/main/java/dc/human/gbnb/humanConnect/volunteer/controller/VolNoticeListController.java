package dc.human.gbnb.humanConnect.volunteer.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface VolNoticeListController {
    @RequestMapping(value = "/volNoticeList.do", method = RequestMethod.GET)
    ModelAndView volNoticeList(@RequestParam("userId") String userId,
                               @RequestParam(value = "page", defaultValue = "1") int page,
                               @RequestParam(value = "size", defaultValue = "10") int size)  throws Exception;

    @RequestMapping(value = "/viewVolNoticeDetail.do", method = RequestMethod.GET)
    ModelAndView viewNoticeDetail(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam("nNumber") String nNumber,
                                  @RequestParam("userId") String userId) throws Exception;
}