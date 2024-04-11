package com.zima.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zima.domain.Criteria;
import com.zima.domain.UsersVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class UsersMapperTests {
	@Autowired
	private UsersMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(user -> log.info(user));
	}
	
	@Test
	public void testInsert() {
		UsersVO vo = new UsersVO();
		vo.setId("zima4");
		vo.setName("김종훈");
		vo.setPassword("1234");
		vo.setPhone("01050956331");
		vo.setEmail("zima0412@gmail.com");
		
		mapper.insert(vo);
		log.info(vo);
	}
	
	//uno가 2단위씩 증가 사용 자제
	@Test
	public void testInsert2() {
		UsersVO vo = new UsersVO();
		vo.setId("zima3");
		vo.setName("김종훈");
		vo.setPassword("1234");
		vo.setPhone("01050956331");
		vo.setEmail("zima0412@gmail.com");
		
		mapper.insertSelectKey(vo);
		log.info(vo);
	}
	
	@Test
	public void testGetOne() {
		UsersVO users = mapper.getOne(1L);
		log.info(users);
	}
	
	@Test
	public void testRead() {
		UsersVO vo = mapper.read("user1");
		log.info(vo);
//		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}

	@Test
	public void testUpdate() {
		UsersVO users = new UsersVO();
		users.setPassword(encoder.encode("1234"));
		users.setName("김종훈");
		users.setPhone("01050956331");
		users.setEmail("korea@korea.kr");
		users.setUno(52L);
		
		int result = mapper.update(users);
		log.info("UPDATE RESULT : " + result);
	}
	
	@Test
	public void testDelete() {
		long idToDelete = 5L;
		int result = mapper.delete(idToDelete);
		log.info("DELETE RESULT : " + result);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria(2,5);
		List<UsersVO> list = mapper.getListWithPaging(cri);
		list.forEach(users -> log.info(users));
	}
}
