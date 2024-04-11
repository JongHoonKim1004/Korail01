package com.zima.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zima.domain.ReservationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReservationMapperTest {
	@Autowired
	private ReservationMapper mapper;
	
	@Test
	public void testInsert() {
		ReservationVO vo = ReservationVO.builder().tno(2).seat_id("2A").user_id("zima").build();
		
		mapper.insert(vo);
		log.info("success>>>>>>>>>>>>>>>");
	}

	@Test
	public void testSearch() {
		long tno = 2L;
		List<String> list = mapper.reservationSearch(tno);
		if(list.size() == 0) {
			log.info("list = null");
		} else {
			list.forEach(seat -> log.info(seat));
		}
		
	}
}
