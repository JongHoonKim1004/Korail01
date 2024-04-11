package com.zima.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.zima.domain.UsersVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	// 소셜 로그인이 아닌 일반 로그인으로 들어온 일반회원
	private static final long serialVersionUID = 1L;
	
	private UsersVO users;
	
	public CustomUser(String id, String password, Collection<? extends GrantedAuthority> authorities) {
		super(id, password, authorities);
	}
	
	public CustomUser(UsersVO vo) {
		super(vo.getId(), vo.getPassword(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.users = vo;
	}
}
