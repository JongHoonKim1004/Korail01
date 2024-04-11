package com.zima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zima.domain.TrainVO;
import com.zima.mapper.TrainMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TrainServiceImpl implements TrainService {
	@Autowired
	private TrainMapper mapper;
	
	
	@Override
	public List<TrainVO> getList() {
		// TODO Auto-generated method stub
		log.info("GETLIST>>>>");
		return mapper.getList();
	}

	@Override
	public TrainVO getOneByTno(long tno) {
		// TODO Auto-generated method stub
		log.info("GETONEBYTNO>>>>");
		return mapper.getOneByTno(tno);
	}

	@Override
	public List<TrainVO> search(String dep_place, String arr_place, long dep_time, long arr_time) {
		// TODO Auto-generated method stub
		log.info("SEARCH>>>>");
		return mapper.search(dep_place, arr_place, dep_time, arr_time);
	}

	@Override
	public void insert(TrainVO vo) {
		// TODO Auto-generated method stub
		log.info("INSERT");
		mapper.insert(vo);
		log.info("INSERT SUCCESS");

	}

	@Override
	public int update(TrainVO vo) {
		// TODO Auto-generated method stub
		log.info("UPDATE>>>>");
		return mapper.update(vo);
	}

	@Override
	public int delete(long tno) {
		// TODO Auto-generated method stub
		log.info("DELETE>>>>");
		return mapper.delete(tno);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

}
