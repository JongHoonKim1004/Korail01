package com.zima.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zima.domain.StationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class StationMapperTests {
	@Autowired
	private StationMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(station -> log.info(station));
	}
	
	@Test
	public void testInsert() {
		StationVO vo = new StationVO();
		vo.setName("테스트역");
		vo.setAddr("경기도 수원시 권선구 매송고색로895-1 중심빌딩, 3층");
		vo.setLatitude(127.0012323);
		vo.setLongitude(37.000012);
		
		mapper.insert(vo);
		log.info(vo);
	}
	
	@Test
	public void testGetOne() {
		StationVO station = mapper.getOne(1L);
		log.info(station);
	}
	
	@Test
	public void testUpdate() {
		StationVO vo = mapper.getOne(5L);
		vo.setUrl("/resources/img/station/station005.jpg");
		vo.setInfo("청량리역(Cheongnyangni station, 淸凉里驛) 또는 청량리(서울시립대입구)역(Cheongnyangni(University of Seoul) station, 淸凉里(市立大入口)驛)은 대한민국 서울특별시 동대문구 전농동에 있는 경원선, 중앙선의 철도역이자 수도권 전철 1호선, 수도권 전철 경의·중앙선, 수도권 전철 경춘선, 수도권 전철 수인·분당선의 전철역이자 환승역이다.\r\n"
				+ "\r\n"
				+ "일제강점기였던 1938년 5월 1일에 동경성역(東京城驛)으로 역명이 변경되었다가 1942년 6월 1일에 본래의 역명인 청량리역으로 다시 환원되었다.");
				
				
				
		int result = mapper.update(vo);
		log.info("UPDATE RESULT" + result);
	}
	
	@Test
	public void testDelete() {
		long snoToDelete = 202L;
		int result = mapper.delete(snoToDelete);
		
		log.info(result);
	}
	
	@Test
	public void testSearchName() {
		String name = "서";
		List<StationVO> list = mapper.searchName(name);
		list.forEach(station -> log.info(station));
	}
	
	@Test
	public void testSearchLocation() {
		String addr = "서울특별시";
		List<StationVO> list = mapper.searchLocation(addr);
		list.forEach(station -> log.info(station));
	}
}
