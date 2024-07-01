package dc.human.gbnb.humanConnect.volunteer.controller;

import dc.human.gbnb.humanConnect.volunteer.vo.VolunteerDetailVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;


public interface VolunteerDetailController {
	public ModelAndView viewVolunteerDetail(HttpServletRequest request, HttpServletResponse response,@RequestParam("userId") String userId, @RequestParam("v_no") int v_no) throws Exception;
	public ModelAndView regVolunteerDetail(HttpServletRequest request, HttpServletResponse response,@RequestParam("userId") String userId, @RequestParam("v_no") int v_no) throws Exception;
	public ModelAndView insertVolunteerDetail(@ModelAttribute("info") VolunteerDetailVO volunteerDetailVO, HttpServletRequest request, HttpServletResponse response,@RequestParam("userId") String userId) throws Exception;
	public Map uploadVolunteerDetail(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
