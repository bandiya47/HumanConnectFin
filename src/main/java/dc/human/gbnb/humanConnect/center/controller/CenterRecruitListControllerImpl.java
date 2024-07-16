package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.service.CenterRecruitListService;
import dc.human.gbnb.humanConnect.center.vo.CenterRecruitListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller("centerRecruitListController")
public class CenterRecruitListControllerImpl implements CenterRecruitListController {

    @Autowired
    private CenterRecruitListService centerRecruitListService;

    @Override
    @RequestMapping(value= "/recruitlist", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView centerRecruitList(@RequestParam("centerId") String centerId) {
        List<CenterRecruitListVO> recruitmentList = centerRecruitListService.getRecruitmentList(centerId);

        ModelAndView mav = new ModelAndView("centerRecruitList");
        mav.addObject("recruitmentList", recruitmentList);
        mav.addObject("centerId", centerId);

        return mav;
    }
}