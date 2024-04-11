package com.zima.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zima.domain.ReservationVO;
import com.zima.domain.TrainVO;
import com.zima.service.ReservationService;
import com.zima.service.TrainService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/train")
@Log4j
public class TrainController {
	// 예약 페이지, reservationController 와는 다르게 페이지 출력을 위한 컨트롤러
	
	@Autowired
	private TrainService trainService;
	
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/search")
	public String getSearch() {
		
		return "/reservation/search";
	}
	
	@PostMapping("/search")
	public String PostSearch(@RequestParam("dep_place") String dep_place, @RequestParam("arr_place") String arr_place, @RequestParam("dep_time") long dep_time, @RequestParam("arr_time") long arr_time, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id = authentication.getName();
		model.addAttribute("id", id);
		
		List<TrainVO> result = trainService.search(dep_place, arr_place, dep_time, arr_time);
		
		// 노선 에서 시간을 20240505090500 같은 형태로 받게 되는데 이를 2024년 05월 05일 09시 05분 의 형태로 출력하기 위한 작업
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		
		for(TrainVO train : result) {
			try {
				Date depDate = sdf.parse(String.valueOf(train.getDep_time()));
				String formattedDepTime = outputFormat.format(depDate);
				train.setFormattedDepTime(formattedDepTime);
				
				Date arrDate = sdf.parse(String.valueOf(train.getArr_time()));
				String formattedArrTime = outputFormat.format(arrDate);
				train.setFormattedArrTime(formattedArrTime);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		result.forEach(train -> log.info(train));
		model.addAttribute("result", result);
		
		return "/reservation/searchResult";
	}
	
	@PostMapping("/reservationConfirm")
	public String PostReservationContrim(@RequestParam("tno") long tno, @RequestParam("seat_id") String seat_id, @RequestParam("user_id") String uesr_id, Model model) {
		ReservationVO vo = ReservationVO.builder().tno(tno).seat_id(seat_id).user_id(uesr_id).build();
		TrainVO train = trainService.getOneByTno(tno);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		try {
			Date depDate = sdf.parse(String.valueOf(train.getDep_time()));
			String formattedDepTime = outputFormat.format(depDate);
			train.setFormattedDepTime(formattedDepTime);
			
			Date arrDate = sdf.parse(String.valueOf(train.getArr_time()));
			String formattedArrTime = outputFormat.format(arrDate);
			train.setFormattedArrTime(formattedArrTime);
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("train", train);
		model.addAttribute("vo", vo);
		
		return "/reservation/reservation";
	}
	
	@PostMapping("/reservation")
	public String PostReservation(@RequestParam("tno") long tno, @RequestParam("seat_id") String seat_id, @RequestParam("user_id") String user_id, RedirectAttributes rttr) {
		ReservationVO vo = ReservationVO.builder().tno(tno).seat_id(seat_id).user_id(user_id).build();
		reservationService.insert(vo);
		
	
		
		rttr.addAttribute("message", "예약이 완료되었습니다.");
		
		
		return "redirect:/train/reservationResult";
	}
	
	@GetMapping("/reservationResult")
	public String reservationResult() {
		
		return "reservation/reservationResult";
	}
}
