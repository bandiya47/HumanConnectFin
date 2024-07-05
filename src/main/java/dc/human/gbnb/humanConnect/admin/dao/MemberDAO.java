package dc.human.gbnb.humanConnect.admin.dao;

import dc.human.gbnb.humanConnect.admin.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberDAO {
	List<MemberVO> selectAllMemberList();
	MemberVO selectMemberById(@Param("u_id") String u_id);
	int updateMember(MemberVO memberVO);
	int deleteMember(@Param("u_id") String u_id);
	List<MemberVO> searchMembers(@Param("searchQuery") String searchQuery);
}
