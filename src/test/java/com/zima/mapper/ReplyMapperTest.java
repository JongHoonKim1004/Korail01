package com.zima.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zima.domain.ReplyVO;
import com.zima.domain.UsersVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReplyMapperTest {
	@Autowired
	private ReplyMapper mapper;
	
	
	@Test
	public void testInsert() {
		ReplyVO vo = ReplyVO.builder().qno(131L).reply("zima").replyer("admin").build();
		
		try {
			mapper.insert(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
