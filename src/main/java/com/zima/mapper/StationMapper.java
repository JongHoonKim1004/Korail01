package com.zima.mapper;

import java.util.List;

import com.zima.domain.Criteria;
import com.zima.domain.StationVO;

public interface StationMapper {
	public List<StationVO> getList();
	public void insert(StationVO vo);
	public StationVO getOne(long sno);
	public int update(StationVO vo);
	public int delete(long sno);
	
	// 이름을 기준으로 철도역 검색
	public List<StationVO> searchName(String name);
	
	// 주소를 기준으로 철도역 검색
	public List<StationVO> searchLocation(String addr);
	
	// 철도역 개수를 표시
	public int getTotalCount();
	
	// 철도역 리스트 페이징
	public List<StationVO> getListWithPaging(Criteria cri);
}
