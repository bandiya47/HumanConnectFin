package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterNoticeListService;
import dc.human.gbnb.humanConnect.center.vo.CenterNoticeListVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CenterNoticeListControllerImpl implements CenterNoticeListController {

    @Autowired
    private CenterNoticeListService centerNoticeListService;

    @Override
    @RequestMapping(value = "/centerNoticeList.do", method = RequestMethod.GET)
    public ModelAndView centerNoticeList(@RequestParam("centerId") String centerId,
                                         @RequestParam(value = "page", defaultValue = "1") int page,
                                         @RequestParam(value = "size", defaultValue = "10") int size) throws Exception {
        ModelAndView mav = new ModelAndView();
        List<CenterNoticeListVO> centerNoticeList = centerNoticeListService.getNoticeList(page, size);
        int totalNotices = centerNoticeListService.countNotices();

        mav.setViewName("centerNoticeList"); // JSP 파일명 지정
        mav.addObject("centerNoticeList", centerNoticeList); // JSP에 데이터 전달
        mav.addObject("centerId", centerId);
        mav.addObject("currentPage", page);
        mav.addObject("totalPages", (int) Math.ceil((double) totalNotices / size));
        return mav;
    }

    @Override
    @RequestMapping(value = "/viewCenterNoticeDetail.do", method = RequestMethod.GET)
    public ModelAndView viewNoticeDetail(HttpServletRequest request, HttpServletResponse response,
                                         @RequestParam("nNumber") String nNumber,
                                         @RequestParam("centerId") String centerId) throws Exception {

        CenterNoticeListVO result = centerNoticeListService.getNoticeDetail(Integer.parseInt(nNumber));
        ModelAndView mav = new ModelAndView("/centerNoticeDetail");

        mav.addObject("noticeList", result);
        mav.addObject("centerId", centerId);
        return mav;
    }
}
