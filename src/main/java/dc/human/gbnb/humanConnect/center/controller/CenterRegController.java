package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;


public interface CenterRegController {
	public ModelAndView viewCenterReg(HttpServletRequest request, HttpServletResponse response,@RequestParam("centerId") String centerId, @RequestParam("v_no") int v_no) throws Exception;
	public ModelAndView centerReg(HttpServletRequest request, HttpServletResponse response, @RequestParam("centerId") String centerId) throws Exception;
	public List<CenterRegVO> addCenterReg(@ModelAttribute("info") CenterRegVO centerRegVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public List<CenterRegVO> updateCenterReg(@ModelAttribute("info") CenterRegVO centerRegVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView modifyCenterReg(HttpServletRequest request, HttpServletResponse response,@RequestParam("centerId") String centerId, @RequestParam("v_no") int v_no) throws Exception;
}
