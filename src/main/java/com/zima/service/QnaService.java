package com.zima.service;

import java.util.List;

import com.zima.domain.Criteria;
import com.zima.domain.NoticeVO;
import com.zima.domain.QnaVO;

public interface QnaService {
	public List<QnaVO> getList();
	public void insert(QnaVO vo);
	public QnaVO getOne(long qno);
	public int update(QnaVO vo);
	public int delete(long qno);
	
	// Q&A 조회시 조회수 올라가는 메서드
		public int updateReadCount(long qno);
		
	// Q&A 게시글 페이징
	public List<QnaVO> getListWithPaging(Criteria cri);
	public int getTotalCount();
		
	// 작성자의 Q&A 를 일부 가져오는 메서드
	public List<QnaVO> getListMinByWriter(String writer);
		
	// 작성자의 Q&A 를 가져오는 메서드
	public List<QnaVO> getListByWriter(String writer);
}
