package com.zima.mapper;

import java.util.List;

import com.zima.domain.Criteria;
import com.zima.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> getList();
	public void insert(NoticeVO notice);
	public void insertSelectKey(NoticeVO notice);
	public NoticeVO read(long nno);
	public int update(NoticeVO notice);
	public int delete(long nno);
	
	// 공지사항 조회시 조회수가 올라가는 메서드
	public int updateReadCount(long nno);
	
	// 공지사항 목록 페이징
	public List<NoticeVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
}
