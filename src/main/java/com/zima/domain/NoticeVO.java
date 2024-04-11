package com.zima.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	// 공지사항 VO
	private long nno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int readCount;
}
