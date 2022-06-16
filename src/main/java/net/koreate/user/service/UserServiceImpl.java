package net.koreate.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.user.dao.UserDAO;
import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO ud;
	
	@Inject
	PasswordEncoder encoder;
	
	@Transactional
	@Override
	public void signUp(UserVO vo) throws Exception {
		String u_pw = vo.getU_pw();
		System.out.println("암호화 전"+u_pw);
		vo.setU_pw(encoder.encode(u_pw));
		System.out.println("암호화 후 : "+vo.getU_pw());
		ud.signUp(vo);
		ud.insertAuth(vo.getU_id());
	}

	@Override
	public void signOut() throws Exception {
		
	}

	@Override
	public String getResult(int result) {
		return (result > 0) ? "수정 성공" : "수정 실패";
	}
	
	@Override
	public String getMessage(int message) {
		return (message > 0) ? "탈퇴 성공" : "탈퇴 실패";
	}
	
	@Override
	public UserVO getUserById(String u_id) throws Exception {
		return ud.getUserById(u_id);
	}

	@Override
	public String updateSign(UserVO vo) throws Exception {
		int result = ud.updateUser(vo);
		System.out.println("service userupdate"+result);
		return getResult(result); 
	}

	@Override
	public boolean getUsersById(String u_id) throws Exception {
		
		UserVO vo = ud.getUserById(u_id);
		System.out.println("sv 아이디 체크"+u_id);
		return vo == null ? true : false;
	}

	@Override
	public void updateVisitDate(String u_id) throws Exception {
		ud.getUpdateVisitDate(u_id);
	}

	@Override
	public String withdraw(UserVO vo) throws Exception {
		int message = ud.withdraw(vo);
		return getMessage(message);
	}

	@Override
	public UserVO updateData(UserVO vo) throws Exception {
		return ud.updateData(vo);
	}

	@Override
	public UserVO select(String u_id) throws Exception{
		System.out.println("service u_id"+u_id);
		return ud.select(u_id);
	}

	@Override
	public List<UserVO> getAll() throws Exception {
		return ud.getAll();
	}

	@Override
	public List<AuthVO> getAuthById(AuthVO vo) throws Exception {
		System.out.println(vo);
		List<AuthVO> list = ud.getAuthById(vo.getU_id());
		boolean authYN = true;
		for(AuthVO auth : list) {
			if(auth.getU_auth().equals(vo.getU_auth())) {
			 	ud.getDeleteAuth(vo);
				System.out.println("service "+vo);
				authYN = false;
				break;
			}
		}
		if(authYN) {
			ud.getAddAuth(vo);
			System.out.println("service add "+vo);
		}
		return ud.getAuthById(vo.getU_id());
	}

	@Override
	public void deleteF(UserVO vo) throws Exception {
		ud.deleteF(vo);
	}

	@Override
	public List<UserVO> getSearchList(String word) throws Exception {
		String u_name = word;
		List<UserVO> list = ud.getSearchList(u_name);
		return list;
	}

	@Override
	public String onlyAuthById(String u_id) throws Exception {
		return ud.onlyAuth(u_id);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
