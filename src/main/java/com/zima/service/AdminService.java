package com.zima.service;

import java.util.List;

import com.zima.domain.AdminVO;

public interface AdminService {
	public List<AdminVO> getList();
	public void insert(AdminVO vo);
	public AdminVO getOne(long ano);
	public int update(AdminVO vo);
	public int delete(long ano);
	
	// 관리자 아이디로 정보 가져오기
	public AdminVO getOneById(String id);
	
	// 관리자 아이디로 권한까지 가져오기
	public AdminVO read(String id);
	
	// 비밀번호 일치 확인
	public boolean checkPassword(String id, String password);
	
	// 비밀번호 맞으면 로그인 처리
	public void setAuthenticationAdmin(String id);
}
