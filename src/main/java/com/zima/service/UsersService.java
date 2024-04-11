package com.zima.service;

import java.util.List;

import com.zima.domain.Criteria;
import com.zima.domain.UsersVO;

public interface UsersService {
	public List<UsersVO> getList();
	public void insert(UsersVO vo);
	public void insertSelectKey(UsersVO vo);
	public UsersVO getOne(long uno);
	public UsersVO read(String id);
	public int update(UsersVO vo);
	public int delete(long uno);
	
	// 일반회원 가입 시 ROLE_USER 권한 부여
	public void insertAuthUser(String id);
	
	// 관리자 페이지에서 유저 수 표시
	public int countById(String id);
	
	// 관리자 페이지에서 유저 목록 페이징
	public List<UsersVO> getListWithPaging(Criteria cri);
	public int getTotalCount();
	
	// 소셜 로그인에서 이메일 정보 대조용 및 이메일로 회원 정보 불러오기
	public int confirmUsersByEmail(String email);
	public UsersVO searchUsersByEmail(String email);
	
	// 아이디를 통해 본인 정보 받아오기
	public UsersVO getOneById(String id);
}
