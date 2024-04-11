package com.zima.service;

import java.util.List;

import com.zima.domain.TrainVO;

public interface TrainService {
	public List<TrainVO> getList();
	public TrainVO getOneByTno(long tno);
	public void insert(TrainVO vo);
	public int update(TrainVO vo);
	public int delete(long tno);
	
	// 검색 창에서 조건에 맞춰 검색
	public List<TrainVO> search(String dep_place, String arr_place,  long dep_time, long arr_time);
	
	// 노선 수 표시
	public int getTotalCount();
}
