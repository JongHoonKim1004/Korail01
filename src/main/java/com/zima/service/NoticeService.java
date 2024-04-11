package com.zima.service;

import java.util.List;

import com.zima.domain.Criteria;
import com.zima.domain.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> getList();
	public void insert(NoticeVO notice);
	public void insertSelectKey(NoticeVO notice);
	public NoticeVO read(long nno);
	public int update(NoticeVO notice);
	public int delete(long nno);
	
	// 공지사항 게시글 조회시 조회수 올리는 메서드
	public int updateReadCount(long nno);
	
	// 공지사항 게시글 목록 페이징
	public List<NoticeVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
}
