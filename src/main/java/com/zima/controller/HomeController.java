package com.zima.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

/**
 * 메인 페이지
 */
@Controller
@Log4j
public class HomeController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
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
}
