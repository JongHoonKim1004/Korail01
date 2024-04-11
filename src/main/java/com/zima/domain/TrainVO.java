package com.zima.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TrainVO {
	// 철도 노선 VO
	private long tno;
	private String dep_place;
	private String arr_place;
	
	// 여기 시간은 20240505090500 형태로 받아짐
	private long dep_time;
	private long arr_time;
	private String grade;
	
	// 여기 시간은 바꾸는 과정을 거져서 2024년 05월 05일 09시 05분 형태로 만듬
	private String formattedDepTime;
	private String formattedArrTime;
}
