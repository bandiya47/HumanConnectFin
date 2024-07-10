package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.center.vo.CenterNoticeListVO;
import dc.human.gbnb.humanConnect.volunteer.vo.VolNoticeListVO;
import java.util.List;

public interface VolNoticeListService {

    List<VolNoticeListVO> getNoticeList(int page, int size) throws Exception;

    VolNoticeListVO getNoticeDetail(int nNumber) throws Exception;

    int countNotices() throws Exception;
}
