package com.zima.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zima.domain.Criteria;
import com.zima.domain.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> getList();
	public void insert(ReplyVO vo);
	public ReplyVO getOneByRno(long rno);
	public int update(ReplyVO vo);
	public int delete(long rno);

	// 작성자 별로 댓글 구분
	public ReplyVO read(String replyer);
	
	// 댓글 목록 페이징
	public List<ReplyVO> getListByQno(@Param("qno") long qno, @Param("cri") Criteria cri);
	
	// 특정 질문에 대한 댓글 목록만 받아오기
	public List<ReplyVO> getListQno(long qno);
	
	// Q&A에 달린 댓글 수 표시
	public int getCountByQno(long qno);
	
	
}
