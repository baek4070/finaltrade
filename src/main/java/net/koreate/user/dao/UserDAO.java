package net.koreate.user.dao;

import java.util.List;

import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.SearchVO;
import net.koreate.user.vo.UserVO;

public interface UserDAO {

	// 회원가입
	void signUp(UserVO vo) throws Exception;

	// 로그인
	// 아이디 이메일 형식인지 체크용
	UserVO getUserById(String u_id) throws Exception;

	// 사용자 정보 수정
	int updateUser(UserVO vo) throws Exception;

	// 마지막 방문시간 최신화
	void getUpdateVisitDate(String u_id) throws Exception;
	
	// 권한 넣기
//	@Insert("INSERT INTO user_auth(u_id,u_auth) VALUES(#{u_id},'ROLE_USER')")
	void insertAuth(String u_id) throws Exception;
	
	// 회원 탈퇴(삭제 x u_withdraw 'y'로 변경)
	int withdraw(UserVO vo) throws Exception;

	// 수정시 데이터 반환용
	UserVO updateData(UserVO vo) throws Exception;
	
	UserVO select(String u_id) throws Exception;

	List<UserVO> getAll() throws Exception;
	
	// 계정 권한 불러오는 용도
	List<AuthVO> getAuthById(String u_id) throws Exception;
	
	// 권한 삭제
	void getDeleteAuth(AuthVO vo) throws Exception;

	// 권한 더하기
	void getAddAuth(AuthVO vo) throws Exception;

	// 삭제 활성 비활성 
	void deleteF(UserVO vo) throws Exception;
	
	// 관리자 검색 기능
	List<UserVO> getSearchList(String u_name) throws Exception;

	// 오직 권한만!
	String onlyAuth(String u_id) throws Exception;

	AuthVO getUserAuth(AuthVO vo);

}
