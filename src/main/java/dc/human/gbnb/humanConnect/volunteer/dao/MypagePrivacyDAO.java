package dc.human.gbnb.humanConnect.volunteer.dao;

import dc.human.gbnb.humanConnect.volunteer.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository("mypagePrivacyDAO")
public interface MypagePrivacyDAO {

	/**
	 * 모든 회원 목록을 조회합니다.
	 *
	 * @return 회원 목록을 포함한 List 객체
	 * @throws DataAccessException 데이터 접근 중 에러 발생 시 예외 처리
	 */
	 public List selectAllMemberList() throws DataAccessException;

	/**
	 * 새로운 회원을 추가합니다.
	 *
	 * @param memberVO 회원 정보를 포함한 MemberVO 객체
	 * @return 삽입 결과를 나타내는 정수 값
	 * @throws DataAccessException 데이터 접근 중 에러 발생 시 예외 처리
	 */
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;

	/**
	 * 기존 회원을 삭제합니다.
	 *
	 * @param id 삭제할 회원의 ID
	 * @return 삭제 결과를 나타내는 정수 값
	 * @throws DataAccessException 데이터 접근 중 에러 발생 시 예외 처리
	 */
	 public int deleteMember(String u_id) throws DataAccessException;

	/**
	 * 회원 로그인을 처리합니다.
	 *
	 * @param memberVO 로그인 정보를 포함한 MemberVO 객체
	 * @return 로그인된 회원 정보를 포함한 MemberVO 객체
	 * @throws DataAccessException 데이터 접근 중 에러 발생 시 예외 처리
	 */
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

}
