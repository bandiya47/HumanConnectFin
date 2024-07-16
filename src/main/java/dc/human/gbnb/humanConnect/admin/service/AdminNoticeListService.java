package dc.human.gbnb.humanConnect.admin.service;

import dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO;

import java.util.List;

public interface AdminNoticeListService {

    List<AdminNoticeListVO> getNoticeList(int limit, int offset) throws Exception;
    
    int getTotalNoticeCount() throws Exception;

    void deleteNotices(List<Integer> nNumbers) throws Exception;

    void addNotice(AdminNoticeListVO notice) throws Exception;

    AdminNoticeListVO getNoticeDetail(int nNumber) throws Exception;

    AdminNoticeListVO getLatestNotices() throws Exception;

    void updateNotice(AdminNoticeListVO notice) throws Exception;
}
