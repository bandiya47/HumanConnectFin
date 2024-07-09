package dc.human.gbnb.humanConnect.center.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CenterNoticeListController {
    @RequestMapping(value = "/centerNoticeList.do", method = RequestMethod.GET)
    ModelAndView centerNoticeList(@RequestParam("centerId") String centerId,
                                  @RequestParam(value = "page", defaultValue = "1") int page,
                                  @RequestParam(value = "size", defaultValue = "10") int size) throws Exception;

    @RequestMapping(value = "/viewCenterNoticeDetail.do", method = RequestMethod.GET)
    ModelAndView viewNoticeDetail(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam("nNumber") String nNumber,
                                  @RequestParam("centerId") String centerId) throws Exception;
}
