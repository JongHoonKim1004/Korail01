package com.zima.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zima.domain.Criteria;
import com.zima.domain.NoticeVO;
import com.zima.domain.PageDTO;
import com.zima.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
public class NoticeController {
	// 공지사항 페이지(관리자 페이지가 아닌 일반 회원 페이지, 목록 및 내용 조회만 가능)
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/noticeList")
	public String noticeList(Model model, Criteria cri) {
		List<NoticeVO> list = noticeService.getListWithPaging(cri);
		
		int total = noticeService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", list);
		
		return "/notice/noticeList";
	}
	
	@GetMapping("/noticeView")
	public String noticeView(@RequestParam("nno") long nno, @ModelAttribute("cri") Criteria cri, Model model) {
		NoticeVO vo = noticeService.read(nno);
		int result = noticeService.updateReadCount(nno);
		model.addAttribute("vo", vo);
		
		return "/notice/noticeView";
	}
}
