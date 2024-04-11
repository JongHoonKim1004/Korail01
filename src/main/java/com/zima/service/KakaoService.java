package com.zima.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.zima.domain.KakaoVO;
import com.zima.domain.UsersVO;
import com.zima.mapper.UsersMapper;
import com.zima.security.domain.CustomUserAdmin;
import com.zima.security.domain.CustomUserKakao;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KakaoService {
	@Autowired
	private UsersMapper mapper;
	
	// 카카오 로그인 후 액세스 토큰 받기
	public String getAccessToken(String authoerize_code) {
		log.info("---------------토큰발급---------------");
		String access_Token = "";
		String refresh_Token = "";
		String id_token = "";
		
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            sb.append("&client_id=86ae0f597d243b1233b4eab0ffc4965f");
            sb.append("&redirect_uri=http://localhost:8282/login/oauth2/code/kakao");
            sb.append("&code=" + authoerize_code);
            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();
            log.info(responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			log.info("RESPONSE BODY: " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			id_token = element.getAsJsonObject().get("id_token").getAsString();
			
			log.info("access_Token: " + access_Token);
			log.info("refresh_Token: " + refresh_Token);
			log.info("id_Token: " + id_token);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return access_Token;
	}
	
	// 액세스 토큰 받은 후, 토큰으로 사용자 정보 받아오기
	public KakaoVO userInfo(String access_Token) throws IOException{
		log.info("사용자 정보 보기------------------------");
		KakaoVO userInfo = new KakaoVO();
		
 		String reqURl = "https://kapi.kakao.com/v2/user/me";

 		try {
 			URL url = new URL(reqURl);
 			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
 			conn.setRequestMethod("GET");
 			
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
	
	// 받은 사용자 정보의 이메일로 유저 조회 후 로그인 처리 
	public void setAuthentication(String email) {
		UsersVO kakaouser = mapper.searchUsersByEmail(email);
		
		List<GrantedAuthority> authorities = kakaouser.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList());
		
		UserDetails userDetails = new CustomUserKakao(kakaouser);
		
		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
	}
	
	
	// 카카오 로그인을 통해 받은 정보를 유저 DB 에 검색
	public int confirmUsersByEmail(String email) {
		int result = mapper.confirmUsersByEmail(email);
		
		return result;
	}
}
