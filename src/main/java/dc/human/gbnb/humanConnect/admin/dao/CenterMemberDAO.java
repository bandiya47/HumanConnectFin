package dc.human.gbnb.humanConnect.admin.dao;

import dc.human.gbnb.humanConnect.admin.vo.CenterMemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CenterMemberDAO {
    List<CenterMemberVO> selectAllCenterMembers(@Param("offset") int offset, @Param("size") int size);
    List<CenterMemberVO> searchCenterMembers(@Param("searchQuery") String searchQuery, @Param("offset") int offset, @Param("size") int size);
    CenterMemberVO selectCenterMemberById(String c_id);
    void updateCenterMember(CenterMemberVO centerMember);
    void resetCenterPW(CenterMemberVO centerMember);
    void deleteCenterMember(String c_id);
    int countAllCenterMembers();
    int countSearchedCenterMembers(String searchQuery);
}
