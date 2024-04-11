package com.zima.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.zima.domain.AdminVO;
import com.zima.domain.UsersVO;

import lombok.Getter;

@Getter
public class CustomUserAdmin extends User{
	// 관리자 로그인 창을 통해 들어온 관리자
	private static final long serialVersionUID = 1L;
	
	private AdminVO admin;
	
	public CustomUserAdmin(String id, String password, Collection<? extends GrantedAuthority> authorities) {
		super(id, password, authorities);
	}
	
	public CustomUserAdmin(AdminVO vo) {
		super(vo.getId(), vo.getPassword(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.admin = vo;
	}
}
