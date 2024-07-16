package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.vo.CenterListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerDetailVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface CenterListController {
    public ModelAndView viewCenterList(HttpServletRequest request, HttpServletResponse response,
                                       @RequestParam("userId") String userId,
                                       @RequestParam(name = "pageNo", defaultValue = "1") String pageNoStr,
                                       @RequestParam(name = "numOfRows", defaultValue = "10") int numOfRows) throws Exception;

    public ModelAndView detailCenterList(HttpServletRequest request, HttpServletResponse response, @RequestParam("userId") String userId, @RequestParam("careNm") String careNm) throws Exception;

    public ModelAndView adoptCenterList(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("info") CenterListVO centerList, @RequestParam("userId") String userId) throws Exception;

    //   public ModelAndView addAccount(HttpServletRequest request, HttpServletResponse response) throws Exception;
    public ModelAndView volCenterList(HttpServletRequest request, HttpServletResponse response, @RequestParam("userId") String userId, @RequestParam("careNm") String careNm) throws Exception;

    public ModelAndView insertVolCenterList(@ModelAttribute("info") VolunteerDetailVO volunteerDetailVO, HttpServletRequest request, HttpServletResponse response, @RequestParam("userId") String userId) throws Exception;

    public ModelAndView modVolCenterList(HttpServletRequest request, HttpServletResponse response, @RequestParam("userId") String userId, @RequestParam("vReg_no") int vReg_no) throws Exception;

    public ModelAndView updateVolCenterList(@ModelAttribute("info") VolunteerDetailVO volunteerDetailVO, HttpServletRequest request, HttpServletResponse response, @RequestParam("userId") String userId, @RequestParam("vReg_no") int vReg_no) throws Exception;

    public ModelAndView viewVolCenterList(HttpServletRequest request, HttpServletResponse response, @RequestParam("userId") String userId, @RequestParam("vReg_no") int vReg_no) throws Exception;

    public void volCLDownload(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) throws Exception;
}
