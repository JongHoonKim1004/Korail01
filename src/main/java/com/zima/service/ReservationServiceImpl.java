package com.zima.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zima.domain.Criteria;
import com.zima.domain.ReservationVO;
import com.zima.mapper.ReservationMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationMapper resMapper;
	
	
	@Override
	public List<ReservationVO> getList() {
		// TODO Auto-generated method stub
		return resMapper.getList();
	}

	@Override
	public void insert(ReservationVO vo) {
		// TODO Auto-generated method stub
		log.info("insert>>>>");
		resMapper.insert(vo);
		log.info("success>>>>");
	}

	@Override
	public ReservationVO getOneByRno(long rno) {
		// TODO Auto-generated method stub
		return resMapper.getOneByRno(rno);
	}

	@Override
	public int update(ReservationVO vo) {
		// TODO Auto-generated method stub
		return resMapper.update(vo);
	}

	@Override
	public int delete(long rno) {
		// TODO Auto-generated method stub
		return resMapper.delete(rno);
	}

	@Override
	public List<String> reservationSearch(long tno) {
		// TODO Auto-generated method stub
		return resMapper.reservationSearch(tno);
	}

	@Override
	public List<ReservationVO> getListByUserId(String user_id) {
		// TODO Auto-generated method stub
		return resMapper.getListByUserId(user_id);
	}

	@Override
	public List<ReservationVO> getListMinByUserId(String user_id) {
		// TODO Auto-generated method stub
		return resMapper.getListMinByUserId(user_id);
	}

	@Override
	public List<Long> getTnoByUserId(String user_id) {
		// TODO Auto-generated method stub
		return resMapper.getTnoByUserId(user_id);
	}

	@Override
	public List<ReservationVO> getListPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return resMapper.getListPaging(cri);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return resMapper.getTotalCount();
	}

	@Override
	public List<ReservationVO> getListMin() {
		// TODO Auto-generated method stub
		return resMapper.getListMin();
	}

}
