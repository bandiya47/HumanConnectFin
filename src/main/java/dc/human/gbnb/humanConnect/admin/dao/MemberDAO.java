package dc.human.gbnb.humanConnect.admin.dao;

import dc.human.gbnb.humanConnect.admin.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberDAO {
	List<MemberVO> selectAllMemberList();
	MemberVO selectMemberById(String u_id);
}
