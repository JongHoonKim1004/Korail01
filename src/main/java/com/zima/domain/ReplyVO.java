package com.zima.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReplyVO {
	// 댓글 VO
	private long rno;
	private long qno;
	private String reply;
	private String replyer;
	private Date regDate;
}
