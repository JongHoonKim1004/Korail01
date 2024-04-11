package com.zima.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zima.service.EmailApiService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/email/*")
@RequiredArgsConstructor
public class EmailApiController {
	@Autowired
	private EmailApiService emailService;
	
	// AJAX 를 통해 받은 요청으로 이메일 전송, 코드를 세션에 저장
	@PostMapping("/send")
	public ResponseEntity<Integer> sendEmailTest(@RequestBody String email, HttpSession session) throws Exception{
		int result = emailService.sendEmailWithCode(email);
		session.setAttribute("code", result);
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	// 입력한 인증번호와 함께 요청이 오면 세션에서 인증코드를 가져와 비교 후, 결과를 반환
	@PostMapping("/authCode")
	public boolean checkAuthCode(@RequestParam("inputCode") String inputCode, HttpSession session){
		int input = Integer.parseInt(inputCode);
		int randomCode = (int) session.getAttribute("code");
		
		return input == randomCode ;
		
	}
}
