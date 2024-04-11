package com.zima.domain;

import lombok.Data;

@Data
public class StationVO {
	// 철도역 VO
	private long sno;
	private String name;
	private String addr;
	private double latitude;
	private double longitude;
	private String url;
	private String info;
}
