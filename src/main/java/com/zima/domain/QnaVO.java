package com.zima.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	// Q&A VO
	private long qno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int readCount;
}
