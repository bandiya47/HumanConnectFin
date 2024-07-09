package dc.human.gbnb.humanConnect.center.service;

import dc.human.gbnb.humanConnect.center.vo.CenterNoticeListVO;
import java.util.List;

public interface CenterNoticeListService {
    List<CenterNoticeListVO> getNoticeList(int page, int size) throws Exception;
    CenterNoticeListVO getNoticeDetail(int nNumber) throws Exception;
    int countNotices() throws Exception;
}
