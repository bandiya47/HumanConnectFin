package dc.human.gbnb.humanConnect.center.controller;

import dc.human.gbnb.humanConnect.center.vo.CenterRegVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


public interface CenterRegController {
	public ModelAndView centerReg(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public List<CenterRegVO> addCenterReg(@ModelAttribute("info") CenterRegVO centerRegVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
}
