package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.service.VolNoticeListService;
import dc.human.gbnb.humanConnect.volunteer.vo.VolNoticeListVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class VolNoticeListControllerImpl implements VolNoticeListController {

    @Autowired
    private VolNoticeListService volNoticeListService;

    @Override
    @RequestMapping(value = "/volNoticeList.do", method = RequestMethod.GET)
    public ModelAndView volNoticeList(@RequestParam("userId") String userId,
                                      @RequestParam(value = "page", defaultValue = "1") int page,
                                      @RequestParam(value = "size", defaultValue = "10") int size) throws Exception {
        ModelAndView mav = new ModelAndView();
        List<VolNoticeListVO> volNoticeList = volNoticeListService.getNoticeList(page, size);
        int totalNotices = volNoticeListService.countNotices();

        mav.setViewName("volNoticeList"); // JSP 파일명 지정
        mav.addObject("volNoticeList", volNoticeList); // JSP에 데이터 전달
        mav.addObject("userId", userId);
        mav.addObject("currentPage", page);
        mav.addObject("totalPages", (int) Math.ceil((double) totalNotices / size));
        return mav;
    }

    @Override
    @RequestMapping(value = "/viewVolNoticeDetail.do", method = RequestMethod.GET)
    public ModelAndView viewNoticeDetail(HttpServletRequest request, HttpServletResponse response,
                                         @RequestParam("nNumber") String nNumber,
                                         @RequestParam("userId") String userId) throws Exception {

        VolNoticeListVO result = volNoticeListService.getNoticeDetail(Integer.parseInt(nNumber));
        ModelAndView mav = new ModelAndView("/volNoticeDetail");

        mav.addObject("noticeList", result);
        mav.addObject("userId", userId);
        return mav;
    }
}