package com.zima.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zima.domain.UsersVO;
import com.zima.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/users/*")
@Log4j
public class UsersController {
	// 일반 회원의 로그인, 로그아웃, 회원가입 컨트롤러(카카오 소셜 로그인 URI 를 제외한 나머지 기능, 마이페이지는 별도)
	
	@Autowired
	private UsersService usersService;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("/login")
	public String login(String error, String logout, Model model) {
		log.info("ERROR >>>> " + error);
		log.info("LOGOUT >>> " + logout);
		
		if(error != null) {
			model.addAttribute("error", "로그인 중 에러가 발생하였습니다");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃이 완료되었습니다.");
		}
		
		return "/users/login";
	}
	
	@GetMapping("/logout")
	public String logoutGet() {
		log.info("LOGOUT");
		
		return "/users/logout";
	}
	
	@GetMapping("/terms")
	public String terms() {
		
		return "/users/terms";
	}
	
	@GetMapping("/register")
	public String register() {
		
		return "/users/register";
	}
	
	@PostMapping("/register")
	public String registerPost(UsersVO vo, RedirectAttributes rttr) {
		String encodedPassword = encoder.encode(vo.getPassword());
		vo.setPassword(encodedPassword);
		
		usersService.insert(vo);
		usersService.insertAuthUser(vo.getId());
		rttr.addFlashAttribute("result", vo.getId());
		
		
		return "redirect:./registerResult";
	}
	
	@GetMapping("/registerResult")
	public void registerResult() {
		
	}
	
	// 아이디 중복 체크 페이지
	@GetMapping("/idCheck")
	public void idCheck(@RequestParam("id") String id, Model model) {
		int result = usersService.countById(id);
		
		model.addAttribute("id", id);
		model.addAttribute("result", result);
	}
	
	// 카카오 로그인으로 정보를 받았고 이메일을 확인했을 때 회원 정보에 없으면 이 주소로 리다이렉트
	@GetMapping("/kakaoRegister")
	public String kakaoRegister(Model model, @ModelAttribute("userEmail") String userEmail, @ModelAttribute("nickname") String nickname) {
		model.addAttribute("nickname", nickname);
		model.addAttribute("userEmail", userEmail);
		
		return "/users/kakaoRegister";
	}
	
	// 이 페이지는 카카오로 로그인 한 회원이 로그아웃을 요청을 한 후 토큰이 제거된 후에 오는 페이지, 세션을 제거해서 페이지 내 로그아웃 처리를 완료한다
	@GetMapping("/kakaoLogout")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();
		log.info("카카오 로그아웃 완료");
		return "redirect:/";
	}
	
	// 아이디 찾기 페이지
	@GetMapping("/idFind")
	public String getIdFind() {
		
		return "/users/idFind";
	}
	
	// 아이디 찾는 메서드, 결과 출력
	@PostMapping("/idFind")
	public String PostIdFind(@RequestParam("email") String email, Model model) {
		UsersVO user = usersService.searchUsersByEmail(email);
		model.addAttribute("user", user);
		return "/users/idFindResult";
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping("/passwordFind")
	public String getPasswordFind() {
		
		return "/users/passwordFind";
	}
	
	// 인증번호 확인 까지 끝나면 비밀번호 변경 페이지로 이동
	@PostMapping("/passwordFind")
	public String PostPasswordFind(@RequestParam("checkedEmail") String email, Model model) {
		UsersVO vo = usersService.searchUsersByEmail(email);
		model.addAttribute("user", vo);
		
		
		return "/users/passwordChange";
	}
	
	// 비밀번호 변경 페이지 submit
	@PostMapping("/passwordChange")
	public String PostPasswordChange(UsersVO vo, RedirectAttributes rttr) {
		int updateResult = usersService.update(vo);
		
		
		return "redirect:/users/passwordFindResult";
	}
	
	
}
