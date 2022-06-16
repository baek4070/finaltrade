package net.koreate.user.service;

import java.util.List;
import java.util.Map;

import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.SearchVO;
import net.koreate.user.vo.UserVO;

public interface UserService {

	// 회원가입
	void signUp(UserVO vo) throws Exception;

	// 로그인
//	UserVO signIn(UserDTO dto) throws Exception;
	
	// 정보 수정
	String updateSign(UserVO vo) throws Exception;
	
	// 로그아웃
	void signOut() throws Exception;
	
	// 아이디 사용
	UserVO getUserById(String u_id) throws Exception;

	
	boolean getUsersById(String u_id) throws Exception;

	// 최근 접속시간 최신화
	void updateVisitDate(String u_id) throws Exception;

	// 회원 탈퇴
	String withdraw(UserVO vo) throws Exception;
	
	// 메시지 전달용
	String getMessage(int result) throws Exception;

	// 메시지 전달용
	String getResult(int result) throws Exception;

	UserVO updateData(UserVO vo) throws Exception;

	UserVO select(String u_id) throws Exception;

	List<UserVO> getAll() throws Exception;
	
	// 유저 권한
	List<AuthVO> getAuthById(AuthVO vo) throws Exception;

	// 활성 비활성 버튼
	void deleteF(UserVO vo) throws Exception;
	
	// 사용자 이름으로 검색기능
	List<UserVO> getSearchList(String word) throws Exception;
	
	// 권한만 가져오기
	String onlyAuthById(String u_id) throws Exception;

	
}
