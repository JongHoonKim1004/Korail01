package com.zima.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zima.domain.Criteria;
import com.zima.domain.NoticeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class NoticeMapperTests {
	@Autowired
	private NoticeMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(notice -> log.info(notice));
	}
	
	@Test
	public void testInsert() {
		NoticeVO vo = new NoticeVO();
		vo.setTitle("new title");
		vo.setContent("new content");
		vo.setWriter("admin");
		
		mapper.insert(vo);
		log.info(vo);
	}

	@Test
	public void testPaging() {
		Criteria cri = new Criteria(3,5);
		List<NoticeVO> list = mapper.getListWithPaging(cri);
		list.forEach(notice -> log.info(notice));
	}
}
