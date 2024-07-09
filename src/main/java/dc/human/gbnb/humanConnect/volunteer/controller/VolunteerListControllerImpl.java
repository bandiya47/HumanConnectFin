package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerListVO;
import dc.human.gbnb.humanConnect.volunteer.service.VolunteerListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class VolunteerListControllerImpl implements VolunteerListController {

    @Autowired
    private VolunteerListService volunteerListService;

    @RequestMapping(method = RequestMethod.GET, value="/volunteerList.do")
    public ModelAndView volunteerList(@RequestParam("userId") String userId) throws Exception {
        ModelAndView mav = new ModelAndView("/volunteerList");
        List<VolunteerListVO> volunteerList = volunteerListService.getVolunteerList(userId);

        mav.setViewName("volunteerList"); // JSP 파일명 지정
        mav.addObject("userId", userId);
        mav.addObject("volunteerList", volunteerList); // JSP에 데이터 전달

        return mav;
    }
}
