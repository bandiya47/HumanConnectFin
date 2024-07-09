package dc.human.gbnb.humanConnect.admin.service;

import dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO;

import java.util.List;

public interface AdminNoticeListService {

    List<AdminNoticeListVO> getNoticeList() throws Exception;

    void deleteNotices(List<Integer> nNumbers) throws Exception;

    void addNotice(AdminNoticeListVO notice) throws Exception;

    AdminNoticeListVO getNoticeDetail(int nNumber) throws Exception;


    AdminNoticeListVO getLatestNotices() throws Exception;
}
