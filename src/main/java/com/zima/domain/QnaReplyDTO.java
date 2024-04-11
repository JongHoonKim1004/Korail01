package com.zima.domain;

import java.util.List;

import lombok.Data;

@Data
public class QnaReplyDTO {
	private QnaVO qna;
	private List<ReplyVO> reply;
}
