package com.zima.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zima.domain.TrainVO;

public interface TrainMapper {
	public List<TrainVO> getList();
	public TrainVO getOneByTno(long tno);
	public void insert(TrainVO vo);
	public int update(TrainVO vo);
	public int delete(long tno);

	// 검색 페이지에서 조건에 맞춰 검색
	public List<TrainVO> search(@Param("dep_place") String dep_place,@Param("arr_place") String arr_place,@Param("dep_time") long dep_time,@Param("arr_time") long arr_time);
	
	// 노선 수 표시
	public int getTotalCount();
}
