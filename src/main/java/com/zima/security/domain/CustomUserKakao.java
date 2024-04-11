package com.zima.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.zima.domain.UsersVO;

import lombok.Getter;

@Getter
public class CustomUserKakao extends User{
	// 카카오 소셜 로그인을 통해 들어온 일반회원
	private static final long serialVersionUID = 1L;
	
	private UsersVO users;
	
	public CustomUserKakao(String id, String password, Collection<? extends GrantedAuthority> authorities) {
		super(id, password, authorities);
	}
	
	public CustomUserKakao(UsersVO vo) {
		super(vo.getId(), "", vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.users = vo;
	}
}
