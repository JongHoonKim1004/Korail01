package com.zima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zima.domain.Criteria;
import com.zima.domain.StationVO;
import com.zima.mapper.StationMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class StationServiceImpl implements StationService {
	@Autowired
	private StationMapper mapper;
	
	@Override
	public List<StationVO> getList() {
		// TODO Auto-generated method stub
		log.info("GETLIST>>>>");
		return mapper.getList();
	}

	@Override
	public void insert(StationVO vo) {
		// TODO Auto-generated method stub
		log.info("INSERT>>>>");
		mapper.insert(vo);
		log.info("INSERT SUCCESS>>");
	}

	@Override
	public StationVO getOne(long sno) {
		// TODO Auto-generated method stub
		log.info("GETONE>>>>");
		return mapper.getOne(sno);
	}

	@Override
	public int update(StationVO vo) {
		// TODO Auto-generated method stub
		log.info("UPDATE>>>");
		return mapper.update(vo);
	}

	@Override
	public int delete(long sno) {
		// TODO Auto-generated method stub
		log.info("DELETE>>>>");
		return mapper.delete(sno);
	}

	@Override
	public List<StationVO> searchName(String name) {
		// TODO Auto-generated method stub
		log.info("SEARCH BY NAME>>>>");
		return mapper.searchName(name);
	}

	@Override
	public List<StationVO> searchLocation(String addr) {
		// TODO Auto-generated method stub
		log.info("SEARCH BY LOCATION>>>>");
		return mapper.searchLocation(addr);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

	@Override
	public List<StationVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

}
