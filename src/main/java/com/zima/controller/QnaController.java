package com.zima.controller;

import java.util.List;

import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zima.domain.Criteria;
import com.zima.domain.PageDTO;
import com.zima.domain.QnaVO;
import com.zima.service.QnaService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
public class QnaController {
	// Q&A 페이지(관리자 페이지가 아닌 일반 회원 페이지, 답글 작성을 제외한 모든 작업 가능)
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/qnaList")
	public String qnaList(Model model, Criteria cri) {
		List<QnaVO> list = qnaService.getListWithPaging(cri);
		
		int total = qnaService.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", list);
		
		return "/qna/qnaList";
	}
	
	@GetMapping("/qnaWrite")
	public String qnaWriteForm(@ModelAttribute("cri") Criteria cri, HttpSession session, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id = authentication.getName();
		
		model.addAttribute("id", id);
		
		return "/qna/qnaWrite";
	}
	
	@PostMapping("/qnaWrite")
	public String qnaWrite(@ModelAttribute("cri") Criteria cri, QnaVO vo, RedirectAttributes rttr) {
		qnaService.insert(vo);
		
		rttr.addFlashAttribute("message", "Q&A 등록이 완료되었습니다.");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/qna/qnaList";
	}
	
	@GetMapping("/qnaView")
	public String qnaView(@RequestParam("qno") long qno,@ModelAttribute("cri") Criteria cri, Model model) {
		QnaVO vo = qnaService.getOne(qno);
		int readcount = qnaService.updateReadCount(qno);

		model.addAttribute("qna", vo);
		
		return "qna/qnaView";
	}
	
	@GetMapping("/qnaModify")
	public String qnaModifyGet(@RequestParam("qno") long qno,@ModelAttribute("cri") Criteria cri, Model model) {
		QnaVO qna = qnaService.getOne(qno);
		model.addAttribute("qna", qna);
		
		return "/qna/qnaModify";
	}
	
	@PostMapping("/qnaModify")
	public String qnaModify(@ModelAttribute("cri") Criteria cri, QnaVO vo, RedirectAttributes rttr) {
		int result = qnaService.update(vo);
		if(result == 1) {
			rttr.addFlashAttribute("message", "수정이 완료되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "수정에 실패했습니다.");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		
		return "redirect:/qna/qnaList";
	}
	
	@PostMapping("/qnaDelete")
	public String qnaDelete(@RequestParam("qno") long qno,@ModelAttribute("cri") Criteria cri , RedirectAttributes rttr) {
		int result = qnaService.delete(qno);
		if(result == 1) {
			rttr.addFlashAttribute("message", "삭제가 완료되었습니다.");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/qna/qnaList";
	}
}

