package com.zima.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zima.domain.KakaoVO;
import com.zima.service.KakaoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class KakaoController {
	// 카카오 소셜 로그인 페이지
	
	
	@Autowired
	private KakaoService service;
	
	// 로그인 페이지 내 '카카오 로그인' 버튼 클릭시 이동하는 경로
	@GetMapping("/login/oauth2/code/kakao")
	public String login(@RequestParam("code") String code, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) throws IOException{
		log.info("CODE: " + code);
		String url = "";
		
		// 이동한 페이지에서 카카오 계정으로 로그인 후 정보 제공에 동의하면 코드 발급
		String access_Token = service.getAccessToken(code);
		
		// 위에서 발급받은 액세스 토큰으로 로그인 한 유저의 개인정보를 카카오 서버에 요청
		KakaoVO userInfo = service.userInfo(access_Token);
		
		String email = userInfo.getKakaoEmail();
		String nickname = userInfo.getNickname();
		
		// 카카오 한 유저가 이미 회원으로 가입 되어있지 이메일을 통해 체크
		int result = service.confirmUsersByEmail(email);
		
		if(result != 0) {
			session = request.getSession();
			log.info("session:" + session);
			if(userInfo.getNickname() != null) {
				session.setAttribute("nickname", userInfo.getNickname());
				session.setAttribute("access_Token", access_Token);
				session.setAttribute("KakaoId", userInfo.getKakaoId());
				session.setAttribute("email", userInfo.getKakaoEmail());
			}
			
			log.info("nickname:"+ userInfo.getNickname());
			log.info("access_Token:"+ access_Token);
			log.info("KakaoId:"+ userInfo.getKakaoId());
			log.info("KakaoEmail:"+ userInfo.getKakaoEmail());
			
			// 이미 회원정보가 있으면 그 정보를 세션에 담고 이메일로 로그인 처리
			service.setAuthentication(email);
			
			url = "redirect:../../../";
		} else {
			// 회원가입된 정보가 없으면 가입 회원가입 사이트로 보내고 이메일과 이름 정보도 같이 보냄
			
			rttr.addAttribute("userEmail", email);
			rttr.addAttribute("nickname", nickname);
			
			url = "redirect:/users/kakaoRegister";
		}
		
		
		
		return url;
	}
}
