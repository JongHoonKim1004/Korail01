package com.zima.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	// 댓글 페이징 DTO
	private int replyCnt;
	private List<ReplyVO> list;
}
