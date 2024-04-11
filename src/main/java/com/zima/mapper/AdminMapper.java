package com.zima.mapper;

import java.util.List;

import com.zima.domain.AdminVO;

public interface AdminMapper {
	public List<AdminVO> getList();
	public void insert(AdminVO vo);
	public AdminVO getOne(long ano);
	public int update(AdminVO vo);
	public int delete(long ano);
	
	// 관리자 등록시 관리자 권한 부여
	public void insertAdminAuth(String id);
	
	// 관리자 아이디로 권한을 제외한 정보 가져오기
	public AdminVO getOneById(String id);
	
	// 관리자 아이디로 권한을 포함한 가져오기
	public AdminVO read(String id);
	
}
