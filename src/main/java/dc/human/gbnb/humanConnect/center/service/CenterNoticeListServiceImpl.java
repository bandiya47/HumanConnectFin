package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.dao.CenterNoticeListDAO;
import dc.human.gbnb.humanConnect.center.vo.CenterNoticeListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("centerNoticeListService")
public class CenterNoticeListServiceImpl implements CenterNoticeListService {

    @Autowired
    private CenterNoticeListDAO centerNoticeListDAO;

    @Override
    public List<CenterNoticeListVO> getNoticeList(int page, int size) throws Exception {
        int offset = (page - 1) * size + 1;
        return centerNoticeListDAO.getNoticeList(offset, size);
    }

    @Override
    public CenterNoticeListVO getNoticeDetail(int nNumber) throws Exception {
        return centerNoticeListDAO.getNoticeDetail(nNumber);
    }

    @Override
    public int countNotices() throws Exception {
        return centerNoticeListDAO.countNotices();
    }
}
