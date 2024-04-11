package com.zima.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class EmailApiServiceImpl implements EmailApiService {
	@Autowired
	private JavaMailSender mailSender;


	@Override
	public int sendEmailWithCode(String to) throws Exception {
		// TODO Auto-generated method stub
		// 6자리 인증번호 설정
		Random random = new Random();
		int randomCode = random.nextInt(888888) + 111111;
		
		// 메시지 보내는 내용, 대상 설정
		MimeMessage message = mailSender.createMimeMessage();
		
		// 메시지 보낼 대상 제목 선정
		message.addRecipients(Message.RecipientType.TO, to);
		message.setSubject("회원가입 인증 메일");
		
		// 메시지 내용
		String msg = "";
		msg += "<p>하단의 인증번호를 입력해주세요</p>";
		msg += "<p>30분 이내에 입력해주세요</p>";
		msg += "<p>감사합니다.</p>";
		msg += randomCode;
		
		// 보내는 사람 등 설정
		message.setText(msg, "utf-8", "html");
		message.setFrom(new InternetAddress("kjh_9823@naver.com", "김종훈"));
		
		// 메일 전송
		try {
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return randomCode;
	}

}
