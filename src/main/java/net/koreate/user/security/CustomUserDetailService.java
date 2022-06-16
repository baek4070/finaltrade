package net.koreate.user.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import net.koreate.user.dao.UserDAO;
import net.koreate.user.vo.UserVO;

public class CustomUserDetailService implements UserDetailsService {

	@Inject
	UserDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO vo = null;
		try {
			vo = dao.getUserById(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo == null ? null : new CustomUser(vo);
	}
}
