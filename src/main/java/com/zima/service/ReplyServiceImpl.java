package com.zima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zima.domain.Criteria;
import com.zima.domain.ReplyPageDTO;
import com.zima.domain.ReplyVO;
import com.zima.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;
	
	
	@Override
	public List<ReplyVO> getList() {
		// TODO Auto-generated method stub
		log.info("GETLIST>>>>");
		return mapper.getList();
	}

	@Override
	public void insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("INSERT>>>>");
		mapper.insert(vo);
		log.info("SUCCESS>>>>");
	}

	@Override
	public ReplyVO getOneByRno(long rno) {
		// TODO Auto-generated method stub
		log.info("GETONEBYRNO>>>>");
		return mapper.getOneByRno(rno);
	}

	@Override
	public ReplyVO read(String replyer) {
		// TODO Auto-generated method stub
		log.info("READ>>>>");
		return mapper.read(replyer);
	}

	@Override
	public int update(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("UPDATE");
		return mapper.update(vo);
	}

	@Override
	public int delete(long rno) {
		// TODO Auto-generated method stub
		log.info("DELETE>>>>");
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getListByQno(long qno, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListByQno(qno, cri);
	}


	@Override
	public int getCountByQno(long qno) {
		// TODO Auto-generated method stub
		return mapper.getCountByQno(qno);
	}

	@Override
	public List<ReplyVO> getListQno(long qno) {
		// TODO Auto-generated method stub
		return mapper.getListQno(qno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, long qno) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(mapper.getCountByQno(qno), mapper.getListByQno(qno, cri));
	}

}
