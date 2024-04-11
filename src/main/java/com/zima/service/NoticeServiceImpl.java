package com.zima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zima.domain.Criteria;
import com.zima.domain.NoticeVO;
import com.zima.mapper.NoticeMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getList() {
		// TODO Auto-generated method stub
		log.info("getList...");
		return mapper.getList();
	}

	@Override
	public void insert(NoticeVO notice) {
		// TODO Auto-generated method stub
		log.info("insert....");
		mapper.insert(notice);
	}

	@Override
	public void insertSelectKey(NoticeVO notice) {
		// TODO Auto-generated method stub
		log.info("insert2...");
		mapper.insertSelectKey(notice);
	}

	@Override
	public NoticeVO read(long nno) {
		// TODO Auto-generated method stub
		log.info("read....");
		return mapper.read(nno);
	}

	@Override
	public int update(NoticeVO notice) {
		// TODO Auto-generated method stub
		log.info("update....");
		return mapper.update(notice);
	}

	@Override
	public int delete(long nno) {
		// TODO Auto-generated method stub
		log.info("delete....");
		return mapper.delete(nno);
	}

	@Override
	public List<NoticeVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public int updateReadCount(long nno) {
		// TODO Auto-generated method stub
		return mapper.updateReadCount(nno);
	}

}
