package com.zima.service;

import java.util.List;

import com.zima.domain.Criteria;
import com.zima.domain.ReservationVO;

public interface ReservationService {
	public List<ReservationVO> getList();
	public void insert(ReservationVO vo);
	public ReservationVO getOneByRno(long rno);
	public int update(ReservationVO vo);
	public int delete(long rno);
	
	// 예약 화면에서 좌석 검색용
		public List<String> reservationSearch(long tno);
		
		// 아이디로 현재 예약 검색
		public List<ReservationVO> getListByUserId(String user_id);
		
		// 아이디로 예약 정보중 노선 정보만 검색
		public List<Long> getTnoByUserId(String user_id);
		
		// 예약 리스트 페이징
		public List<ReservationVO> getListPaging(Criteria cri);
		
		// 마이페이지 메인에서 예약 일부 표시
		public List<ReservationVO> getListMinByUserId(String user_id);
		
		// 총 예약수 표시
		public int getTotalCount();
		
		// 관리자 페이지 대시보드에 표시할 최근 5 예약
		public List<ReservationVO> getListMin();
}
