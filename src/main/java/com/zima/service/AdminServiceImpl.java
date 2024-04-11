package com.zima.service;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.zima.domain.AdminVO;
import com.zima.mapper.AdminMapper;
import com.zima.security.domain.CustomUserAdmin;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Override
	public List<AdminVO> getList() {
		// TODO Auto-generated method stub
		log.info("GETLIST>>>>");
		return mapper.getList();
	}

	@Override
	public void insert(AdminVO vo) {
		// TODO Auto-generated method stub
		log.info("INSERT>>>>");
		String encodedPassword = encoder.encode(vo.getPassword());
		vo.setPassword(encodedPassword);
		mapper.insert(vo);
		log.info("SUCCESS>>>>");
		
	}

	@Override
	public AdminVO getOne(long ano) {
		// TODO Auto-generated method stub
		log.info("GETONE>>>>");
		return mapper.getOne(ano);
	}

	@Override
	public int update(AdminVO vo) {
		// TODO Auto-generated method stub
		log.info("UPDATE>>>>");
		return mapper.update(vo);
	}

	@Override
	public int delete(long ano) {
		// TODO Auto-generated method stub
		log.info("DELETE>>>>");
		return mapper.delete(ano);
	}

	@Override
	public AdminVO getOneById(String id) {
		// TODO Auto-generated method stub
		return mapper.getOneById(id);
	}

	@Override
	public AdminVO read(String id) {
		// TODO Auto-generated method stub
		return mapper.read(id);
	}

	@Override
	public boolean checkPassword(String id, String password) {
		// TODO Auto-generated method stub
		
		//입력한 아이디의 비밀번호(인코딩된 비밀번호)를 가져온 후 입력한 비밀번호가 가져온 비밀번호(인코딩된 비밀번호)와 일치하는지 비교하여 그 결과를 표시
		AdminVO vo = mapper.getOneById(id);
		String encodedPassword = vo.getPassword();
		
		return encoder.matches(password, encodedPassword);
	}

	@Override
	public void setAuthenticationAdmin(String id) {
		// TODO Auto-generated method stub
		
		// 비밀번호가 일치하면 권한을 포함한 정보를 가져온다
		AdminVO admin = mapper.read(id);
		
		List<GrantedAuthority> authorities = admin.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList());

		// 가져온 정보를 인증 처리를 할 수 있도록 담고 인증 처리를 한다
		UserDetails userDetails = new CustomUserAdmin(admin);
		
		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		
	}

}
