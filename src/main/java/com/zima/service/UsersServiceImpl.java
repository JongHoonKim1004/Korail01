package com.zima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.zima.domain.Criteria;
import com.zima.domain.UsersVO;
import com.zima.mapper.UsersMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Override
	public List<UsersVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public void insert(UsersVO vo) {
		// TODO Auto-generated method stub
		mapper.insert(vo);
	}

	@Override
	public void insertSelectKey(UsersVO vo) {
		// TODO Auto-generated method stub
		mapper.insertSelectKey(vo);
	}

	@Override
	public UsersVO getOne(long uno) {
		// TODO Auto-generated method stub
		return mapper.getOne(uno);
	}

	@Override
	public UsersVO read(String id) {
		// TODO Auto-generated method stub
		return mapper.read(id);
	}

	@Override
	public int update(UsersVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long uno) {
		// TODO Auto-generated method stub
		return mapper.delete(uno);
	}

	@Override
	public void insertAuthUser(String id) {
		// TODO Auto-generated method stub
		mapper.insertAuthUser(id);
	}

	@Override
	public int countById(String id) {
		// TODO Auto-generated method stub
		return mapper.countById(id);
	}

	@Override
	public List<UsersVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

	@Override
	public int confirmUsersByEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.confirmUsersByEmail(email);
	}

	@Override
	public UsersVO searchUsersByEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.searchUsersByEmail(email);
	}

	@Override
	public UsersVO getOneById(String id) {
		// TODO Auto-generated method stub
		return mapper.getOneById(id);
	}
	


}
