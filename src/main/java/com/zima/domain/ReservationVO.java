package com.zima.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Builder
@AllArgsConstructor
@Data
public class ReservationVO {
	// 예약 VO (예약 번호만 있고 노선에 대한 정보는 tno를 통해 받아야 함)
	private long rno;
	private long tno;
	private String seat_id;
	private String user_id;
	private Date resDate;
}
