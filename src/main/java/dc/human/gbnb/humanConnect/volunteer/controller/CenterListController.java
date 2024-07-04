package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.vo.CenterListVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;


public interface CenterListController {
	public ModelAndView viewCenterList(HttpServletRequest request, HttpServletResponse response,@RequestParam("userId") String userId) throws Exception;
	public ModelAndView detailCenterList(HttpServletRequest request, HttpServletResponse response,@RequestParam("userId") String userId, @RequestParam("careNm") String careNm) throws Exception;
	public ModelAndView adoptCenterList(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("info") CenterListVO centerList, @RequestParam("userId") String userId) throws Exception;

}
