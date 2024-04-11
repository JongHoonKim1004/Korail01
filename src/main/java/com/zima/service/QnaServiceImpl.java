package com.zima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zima.domain.Criteria;
import com.zima.domain.NoticeVO;
import com.zima.domain.QnaVO;
import com.zima.mapper.QnaMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaMapper mapper;
	
	
	@Override
	public List<QnaVO> getList() {
		// TODO Auto-generated method stub
		log.info("GETLIST>>>>");
		return mapper.getList();
	}

	@Override
	public void insert(QnaVO vo) {
		// TODO Auto-generated method stub
		log.info("INSERT>>>>");
		mapper.insert(vo);
		log.info("INSERT SUCCESS");
	}

	@Override
	public QnaVO getOne(long qno) {
		// TODO Auto-generated method stub
		log.info("GETONE>>>>");
		return mapper.getOne(qno);
	}

	@Override
	public int update(QnaVO vo) {
		// TODO Auto-generated method stub
		log.info("UPDATE>>>>");
		return mapper.update(vo);
	}

	@Override
	public int delete(long qno) {
		// TODO Auto-generated method stub
		log.info("DELETE>>>>");
		return mapper.delete(qno);
	}

	@Override
	public int updateReadCount(long qno) {
		// TODO Auto-generated method stub
		log.info("UPDATE READCOUNT>>>>");
		return mapper.updateReadCount(qno);
	}

	@Override
	public List<QnaVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

	@Override
	public List<QnaVO> getListMinByWriter(String writer) {
		// TODO Auto-generated method stub
		return mapper.getListMinByWriter(writer);
	}

	@Override
	public List<QnaVO> getListByWriter(String writer) {
		// TODO Auto-generated method stub
		return mapper.getListByWriter(writer);
	}

}
