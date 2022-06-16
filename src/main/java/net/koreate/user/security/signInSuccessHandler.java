package net.koreate.user.security;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.UserVO;

public class signInSuccessHandler implements AuthenticationSuccessHandler {

	@Inject
	UserService us;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		CustomUser user = (CustomUser)authentication.getPrincipal();
		System.out.println("user : "+user);
		UserVO vo = user.getUser();
		System.out.println("vo "+vo);
		
		try {
			 us.updateVisitDate(vo.getU_id());
			 
			 System.out.println("이건가"+vo.getU_id());
		} catch (Exception e) {
			 e.printStackTrace(); 
		}
		String context = File.separator;
		response.sendRedirect(context);
	}

}
