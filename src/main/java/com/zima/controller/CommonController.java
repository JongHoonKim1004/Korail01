package com.zima.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	// 권한이 없으면 이 페이지로 이동
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("ACCESS DENIED : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
}
