package dc.human.gbnb.humanConnect.admin.service;

import dc.human.gbnb.humanConnect.admin.dao.AdminNoticeListDAO;
import dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service("adminNoticeListService")
public class AdminNoticeListServiceImpl implements AdminNoticeListService {

    @Autowired
    private AdminNoticeListDAO adminNoticeListDAO;


    public List<AdminNoticeListVO> getNoticeList() throws Exception {
        return adminNoticeListDAO.getNoticeList();
    }

    public void deleteNotices(List<Integer> nNumbers) throws Exception {
        adminNoticeListDAO.deleteNotices(nNumbers);
    }

    public void addNotice(AdminNoticeListVO notice) throws Exception {
        System.out.println("===============================");

        notice.setnDate(LocalDate.now().toString());
        adminNoticeListDAO.insertNotice(notice);
    }

    public AdminNoticeListVO getNoticeDetail(int nNumber) throws Exception {
        AdminNoticeListVO adminNoticeList = null;
        adminNoticeList = adminNoticeListDAO.getNoticeDetail(nNumber);
        return adminNoticeList;
    }

    public AdminNoticeListVO getLatestNotices() throws Exception {
        return  adminNoticeListDAO.getLatestNotice();
    }

    public AdminNoticeListVO getLatestNotice() throws Exception {
        return adminNoticeListDAO.getLatestNotice();
    }

    public void updateNotice(AdminNoticeListVO notice) throws Exception {
        adminNoticeListDAO.updateNotice(notice);
    }
}
