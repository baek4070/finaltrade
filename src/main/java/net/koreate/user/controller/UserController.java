package net.koreate.user.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Inject
	JavaMailSender mailSender;
	
	@Inject
	UserService us;
	
	@Inject 
	PasswordEncoder encoder;
	
	// 로그인 security에서 전반적으로 처리
	@GetMapping("/signIn")
	public String signIn(String message,Model model,String result) {
		model.addAttribute("message",message);
		model.addAttribute("result",result);
		return "user/signIn";	
	}

	@GetMapping("/signUpText")
	public String signUpText(RedirectAttributes rttr,UserVO vo) {
		rttr.addAttribute(vo);
		return "redirect:/user/signUp";
	}
	
	// 회원가입 페이지
	@GetMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	// 로그아웃
	@GetMapping("/signOut")
	public void signOut() {
		
	}
	
	// 회원정보 수정
	@GetMapping("/info")
	public String info(UserVO vo) {
		return "/user/info";
	}
	
	@GetMapping("/text")
	public String text() {
		return "/user/text";
	}
	
	// ???
	@PostMapping("/signUp")
	public String postSignUp() {
		return "user/signUp";
	}
	
	// 아이디 중복체크
	@PostMapping("/uidCheck")
	@ResponseBody
	public boolean uidCheck(String u_id) throws Exception{
		boolean isCheck = us.getUsersById(u_id);
		System.out.println(isCheck);
		return isCheck;
	}
	
	// 이메일 발송
	@GetMapping("/checkEmail")
	@ResponseBody
	public String sendMail(@RequestParam("u_id") String email) throws Exception{
		System.out.println(email);
		String code = "";
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,"UTF-8");
		messageHelper.setFrom("rlaghlwlsx@gmail.com");
		messageHelper.setTo(email);
		messageHelper.setSubject("이메일 인증코드 확인");
		for(int i=0; i<5; i++) {
			code += (int)(Math.random()*10);
		}
		System.out.println("code : "+code);
		String msg = "다음 인증 코드르 입력해주세요.<h2>"+code+"</h2>";
		messageHelper.setText(msg,true);
		mailSender.send(message);
		System.out.println("발송완료");
		
		return code;
	}
	
	// 회원 가입
	@PostMapping("/signUpPost")
	public String signUp(UserVO vo) throws Exception{
		System.out.println(vo);
		us.signUp(vo);
		return "redirect:/user/signIn";
	}

	// 회원 정보 수정
	@PostMapping("signUpdatePost")
	public String signUpdatePost(UserVO vo,RedirectAttributes rttr) throws Exception {
		UserVO uid = us.select(vo.getU_id());
		System.out.println(uid);
		if(uid != null) {
			if(encoder.matches(vo.getU_pw(), uid.getU_pw())) {
				
				String msg = us.updateSign(vo);
				System.out.println(msg);
				rttr.addFlashAttribute("result",msg);
				return "redirect:/user/signOut";
			}
		}
		String msg = "수정 실패";
		rttr.addFlashAttribute("result",msg);
		return "redirect:/user/info";
	}
	
	// 회원 탈퇴
	@GetMapping("/withdraw")
	public String signWithdraw() throws Exception{
		return "user/withdraw";
	}
	
	// 삭제
	@PostMapping("/withdrawPost")
	public String withdraw(UserVO vo,RedirectAttributes rttr) throws Exception{
		System.out.println("controller withdraw"+vo);
		UserVO id = us.select(vo.getU_id());
		boolean result = false;
		if(id != null) {
			if(encoder.matches(vo.getU_pw(), id.getU_pw())) {
				String message = us.withdraw(vo);
				rttr.addFlashAttribute("message",message);
				result = true;
			}else {
				String message = "탈퇴 실패";
				result = false;
				System.out.println(result);
				rttr.addFlashAttribute("message",message);
				return "redirect:/user/withdraw";
			}
		}
		return "redirect:/user/signOut";
	}
	
	// 중복 로그인 블럭 페이지
	@GetMapping("/signOff")
	public String signOff(Model model) {
		return "user/signOff";
	}
	
	// 관리자 페이지 
	@GetMapping("/master")
	public String master(Model model,String word) throws Exception {
		List<UserVO> userList = us.getAll();
		model.addAttribute("userList",userList);
		List<UserVO> searchList = us.getSearchList(word);
		model.addAttribute("searchList",searchList);
		return "user/master";
	}
	
	@PostMapping("changeAuth")
	@ResponseBody
	public List<AuthVO> changeAuth(AuthVO vo,Model model) throws Exception{
		System.out.println("asdasdasd"+vo);
		List<AuthVO> list = us.getAuthById(vo);
		System.out.println("con list "+list);
		
		/*
		 * String detailAuth = us.onlyAuthById(vo.getU_id());
		 * model.addAttribute("userAuth",detailAuth);
		 * System.out.println("권한이다 "+detailAuth);
		 */
		return list;
	}
	
	@PostMapping("delete")
	@ResponseBody
	public String delete(UserVO vo) throws Exception{
		us.deleteF(vo);
		return vo.getU_withdraw();
	}
	
}
