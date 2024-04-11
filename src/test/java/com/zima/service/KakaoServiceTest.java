package com.zima.service;

import static org.junit.Assert.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.zima.domain.KakaoVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/security-context.xml")
@Log4j
public class KakaoServiceTest {
	
	@Test
	public KakaoVO userInfo() throws IOException{
		log.info("사용자 정보 보기------------------------");
		String access_Token = "W694TEcmRdOrETopX-jJRZ6yXya8U-kF_qXsrliLzWVXzDzHbYaLTdbP8aAKPXUbAAABjqb8DaEh5oEAb4_jFQ";
		KakaoVO userInfo = new KakaoVO();
		
 		String reqURl = "https://kapi.kakao.com/v2/user/me";

 		try {
 			URL url = new URL(reqURl);
 			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
 			conn.setRequestMethod("POST");
 			
 			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
 			
 			int responseCode = conn.getResponseCode();
 			log.info("responseCode: " + responseCode);
 			
 			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
 			
 			String line = "";
 			String result = "";
 			
 			while((line = br.readLine()) != null) {
 				result += line;
 			}
 			
 			log.info("responseBody: " + result);
 			
 			JsonParser parser = new JsonParser();
 			JsonElement element = parser.parse(result);
 			
 			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
 			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
 			
 			long id = element.getAsJsonObject().get("id").getAsLong();
 			
 			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
 			String email = kakao_account.getAsJsonObject().get("email").getAsString();
 			
 			log.info("id: " + id);
 			log.info("nickname : " + nickname);
 			
 			userInfo.setKakaoId(id);
 			userInfo.setNickname(nickname);
 			userInfo.setKakaoEmail(email);
 		} catch(Exception e) {
 			e.printStackTrace();
 		}
 		return userInfo;
	}

}
