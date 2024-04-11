package com.zima.security;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.zima.domain.UsersVO;
import com.zima.mapper.UsersMapper;
import com.zima.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	// 일반회원 로그인 페이지를 통해 로그인하는 일반회원(카카오 로그인 포함)은 이 작업을 통해 인증이 완료됨
	@Autowired
	private UsersMapper usersMapper;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
			log.warn("LOAD USER BY ID : " + id);
			
			UsersVO vo = usersMapper.read(id);
			
			log.warn("QUERID BY USERSMAPPER: " + vo);
			
			
			return new CustomUser(vo);
		
	}
	
	
}
