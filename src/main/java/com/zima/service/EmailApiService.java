package com.zima.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;

public interface EmailApiService {

	// 인증번호를 넣은 이메일을 전송
	public int sendEmailWithCode(String to) throws Exception; 
	

}
