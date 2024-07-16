package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.center.vo.CenterNoticeListVO;
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

    public List<VolNoticeListVO> getNoticeList(int page, int size) throws Exception {
        int offset = (page - 1) * size + 1;
        return volNoticeListDAO.getNoticeList(offset, size);
    }

    public VolNoticeListVO getNoticeDetail(int nNumber) throws Exception {
        return volNoticeListDAO.getNoticeDetail(nNumber);
    }

    public VolNoticeListVO getLatestNotices() throws Exception {
        return volNoticeListDAO.getLatestNotice();
    }
    @Override
    public int countNotices() throws Exception {
        return volNoticeListDAO.countNotices();
    }
    public VolNoticeListVO getLatestNotice() throws Exception {
        return volNoticeListDAO.getLatestNotice();
    }
}
