package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.dao.VolNoticeListDAO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolNoticeListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service("volNoticeListService")
public class VolNoticeListServiceImpl implements VolNoticeListService {

    @Autowired
    private VolNoticeListDAO volNoticeListDAO;

    public List<VolNoticeListVO> getNoticeList() throws Exception {
        return volNoticeListDAO.getNoticeList();
    }

    public VolNoticeListVO getNoticeDetail(int nNumber) throws Exception {
        return volNoticeListDAO.getNoticeDetail(nNumber);
    }

    public VolNoticeListVO getLatestNotices() throws Exception {
        return volNoticeListDAO.getLatestNotice();
    }

    public VolNoticeListVO getLatestNotice() throws Exception {
        return volNoticeListDAO.getLatestNotice();
    }
}
