package com.zima.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zima.domain.StationVO;
import com.zima.service.StationService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/station/*")
public class StationController {
	// 철도역 페이지
	
	@Autowired
	private StationService stationService;
	
	@GetMapping("/stationSearch")
	public String stationSearch() {
		
		return "/station/stationSearch";
	}
	
	@PostMapping("/searchName")
	public String searchName(String name,Model model) {
		List<StationVO> list = stationService.searchName(name);
		
		model.addAttribute("list", list);
		
		return "/station/stationSearchResult";
	}
	
	@PostMapping("/searchLocation")
	public String searchLocation(String addr, Model model) {
		List<StationVO> list = stationService.searchLocation(addr);
		
		model.addAttribute("list", list);
		return "/station/stationSearchResult";
	}
	
	@GetMapping("/stationInfo")
	public String stationInfo(@RequestParam("sno") long sno, Model model) {
		StationVO station = stationService.getOne(sno);
		model.addAttribute("station", station);
		
		log.info(station);
		return "/station/stationInfo";
	}
	
	@GetMapping("/stationList")
	public String stationList(Model model) {
		List<StationVO> list = stationService.getList();
		model.addAttribute("list", list);
		
		return "/station/stationList";
	}
}
