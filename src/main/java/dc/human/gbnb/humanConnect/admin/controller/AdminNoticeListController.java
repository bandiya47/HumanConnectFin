package dc.human.gbnb.humanConnect.admin.controller;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

public interface AdminNoticeListController {

    ModelAndView adminNoticeList(
            @RequestParam(value = "page",
                    defaultValue = "1") int page) throws Exception;

    ModelAndView viewNoticeDetail(
            HttpServletRequest request,
            HttpServletResponse response,
            String nNumber) throws Exception;


    ModelAndView updateNoticeDetail(@RequestParam("nNumber") int nNumber,
                                    @RequestParam("nTitle") String nTitle,
                                    @RequestParam("nContent") String nContent) throws Exception;

    public Map upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

    public void CenterDownload(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) throws Exception;
}
