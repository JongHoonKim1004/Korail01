package com.zima.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zima.domain.Criteria;
import com.zima.domain.ReplyPageDTO;
import com.zima.domain.ReplyVO;
import com.zima.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/*")
@AllArgsConstructor
@NoArgsConstructor
@Log4j
public class ReplyController {
	// 댓글 관련 컨트롤러, 페이지를 보여주기 위함이 아닌 정보를 요청하기 위한 용도
	
	@Autowired
	private ReplyService service;
	
	@PostMapping(value="/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
			service.insert(vo);
			int result = 1;
		
		return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
	@GetMapping(value="/pages/{qno}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("qno") long qno, @PathVariable("page") int page){
		log.info("GETLIST>>>>");
		Criteria cri = new Criteria(page, 4); 
		
		return new ResponseEntity<ReplyPageDTO>(service.getListPage(cri, qno),HttpStatus.OK);
	}
	
	@GetMapping(value="/{rno}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") long rno){
		log.info("get: " + rno);
		
		return new ResponseEntity<ReplyVO>(service.getOneByRno(rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rno}" , produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") long rno){
		log.info("remove: " + rno);
		return service.delete(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = RequestMethod.PUT, value="/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@PathVariable("rno") long rno, @RequestBody ReplyVO vo){
		vo.setRno(rno);
		
		return service.update(vo) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
}
