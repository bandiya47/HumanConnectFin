package dc.human.gbnb.humanConnect.volunteer.service;

import dc.human.gbnb.humanConnect.volunteer.vo.VolNoticeListVO;
import java.util.List;

public interface VolNoticeListService {

    List<VolNoticeListVO> getNoticeList() throws Exception;

    VolNoticeListVO getNoticeDetail(int nNumber) throws Exception;

    VolNoticeListVO getLatestNotices() throws Exception;
}
