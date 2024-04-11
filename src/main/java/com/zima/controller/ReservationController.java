package com.zima.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zima.domain.ReservationVO;
import com.zima.domain.TrainVO;
import com.zima.service.ReservationService;
import com.zima.service.TrainService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reservation/*")
public class ReservationController {
	// 예약 관련 정보를 요청한 페이지에서 출력하게 해주기 위한 컨트롤러
	
	@Autowired
	private ReservationService reservationService;

	@GetMapping(value="/tno/{tno}", produces =  {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<String>> reservationSearch(@PathVariable("tno") long tno){
		List<String> result = reservationService.reservationSearch(tno);
		
		return new ResponseEntity<List<String>>(result,HttpStatus.OK);
	}
	
	@GetMapping(value="/{rno}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReservationVO> getOneByRno(@PathVariable("rno") long rno){
		
		return new ResponseEntity<ReservationVO>(reservationService.getOneByRno(rno), HttpStatus.OK);
	}
	
	@PostMapping(value="/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insert(@RequestBody ReservationVO vo){
		reservationService.insert(vo);
		int result = 1;
		
		return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value="/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> update(@RequestBody ReservationVO vo, @PathVariable("rno") long rno){
		vo.setRno(rno);
		
		int result = reservationService.update(vo);
		return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno") long rno){
		
		return reservationService.delete(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/userId/{user_id}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReservationVO>> getListByUserId(@PathVariable("user_id") String user_id){
		List<ReservationVO> list = reservationService.getListByUserId(user_id);
		
		return new ResponseEntity<List<ReservationVO>>(list, HttpStatus.OK);
	}
}
