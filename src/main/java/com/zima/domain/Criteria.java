package com.zima.domain;

import lombok.Data;

@Data 
public class Criteria {
	// 목록 페이징 처리를 위한 VO
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.amount = amount;
		this.pageNum = pageNum;
	}
	
}
