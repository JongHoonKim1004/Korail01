package com.zima.domain;

import java.util.List;

import lombok.Data;

@Data
public class AdminVO {
	// 관리자 VO, 관리자 권한을 별도 VO 로 편성
	private long ano;
	private String id;
	private String password;
	private String phone;
	private String email;
	
	private List<AdminAuthVO> authList;
}
