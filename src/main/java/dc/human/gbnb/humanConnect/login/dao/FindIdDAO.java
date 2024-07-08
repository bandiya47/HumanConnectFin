package dc.human.gbnb.humanConnect.login.dao;

import dc.human.gbnb.humanConnect.login.vo.FindIdVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("FindIdDAO")
public interface FindIdDAO {
    String searchMember(FindIdVO findIdVO);
}
