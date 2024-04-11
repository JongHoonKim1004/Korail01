package com.zima.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UsersVO {
	// 유저 VO, 유저 권한은 별도 VO로 편성
	private long uno;
	private String id;
	private String password;
	private String phone;
	private String email;
	private String name;
	private Date regDate;
	
	private List<UsersAuthVO> authList = new ArrayList<UsersAuthVO>();
}
