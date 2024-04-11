package com.zima.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zima.domain.QnaReplyDTO;
import com.zima.domain.QnaVO;
import com.zima.domain.ReplyVO;
import com.zima.domain.ReservationDTO;
import com.zima.domain.ReservationVO;
import com.zima.domain.TrainVO;
import com.zima.domain.UsersVO;
import com.zima.service.QnaService;
import com.zima.service.ReplyService;
import com.zima.service.ReservationService;
import com.zima.service.TrainService;
import com.zima.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {
	// 일반 페이지 내 마이페이지 관련 컨트롤러
	
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private ReplyService replyService;
	
	// 회원정보 변경시 비밀번호 인코딩
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	// 메인페이지
	@GetMapping("/main")
	public void getMypageMain(Model model, HttpSession session) {
		// 아이디를 받아오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id = authentication.getName();
		log.info("id: " + id);
		// 메인페이지에 표시할 개인정보 불러오기
		UsersVO user = usersService.getOneById(id);
		model.addAttribute("user", user);
		
		// 메인페이지에 표시할 예약의 일부 불러오기
		List<ReservationVO> reservationList = reservationService.getListMinByUserId(id);
		List<Long> tnoList = reservationService.getTnoByUserId(id);
		List<TrainVO> trainList = new ArrayList<TrainVO>();
		List<ReservationDTO> dtoList = new ArrayList<ReservationDTO>();
		
		for(long tno : tnoList) {
			TrainVO vo = trainService.getOneByTno(tno);
			trainList.add(vo);
		}
		
		// 노선 에서 시간을 20240505090500 같은 형태로 받게 되는데 이를 2024년 05월 05일 09시 05분 의 형태로 출력하기 위한 작업
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
				
		for(int i = 0 ; i < reservationList.size() ; i++) {
			ReservationVO reservationVO = reservationList.get(i);
			TrainVO trainVO = trainList.get(i);
			// 시간 설정을 여기서 변경 후 대입
			try {
				Date depDate = sdf.parse(String.valueOf(trainVO.getDep_time()));
				String formattedDepTime = outputFormat.format(depDate);
				trainVO.setFormattedDepTime(formattedDepTime);
				
				Date arrDate = sdf.parse(String.valueOf(trainVO.getArr_time()));
				String formattedArrTime = outputFormat.format(arrDate);
				trainVO.setFormattedArrTime(formattedArrTime);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			// 시간 설정이 끝난 VO 들을 DTO 로 통합
			ReservationDTO dto = new ReservationDTO();
			dto.setReservationVO(reservationVO);
			dto.setTrainVO(trainVO);
			
			dtoList.add(dto);
		}
		
		model.addAttribute("dtoList", dtoList);
				
		// 메인페이지에 표시할 Q&A와 댓글 개수 불러오기
		List<QnaVO> qnaList = qnaService.getListMinByWriter(id);
		List<Integer> replyCountList = new ArrayList<Integer>();
		for(QnaVO vo : qnaList) {
			int replyCount = replyService.getCountByQno(vo.getQno());
			replyCountList.add(replyCount);
		}
		model.addAttribute("replyCountList", replyCountList);
		model.addAttribute("qnaList", qnaList);
	}
	
	// 회원정보 수정 페이지
	@PostMapping("/usersModify")
	public String getUsersModify(Model model, @RequestParam("uno") long uno) {
		UsersVO user = usersService.getOne(uno);
		model.addAttribute("user", user);
		
		return "/mypage/infoModify";
	}
	
	// 회원정보 수정 메서드
	@PostMapping("/infoModify")
	public String PostInfoModify(UsersVO vo, RedirectAttributes rttr) {
		String encodedPassword = encoder.encode(vo.getPassword());
		vo.setPassword(encodedPassword);
		
		int updateResult = usersService.update(vo);
		log.info("UPDATE RESULT:  " + updateResult);
		if(updateResult == 1) {
			rttr.addFlashAttribute("message", "회원정보 수정이 완료되었습니다.");
		}
		
		
		return "redirect:/mypage/main";
	}
	
	// '나의 예약' 자세히 보기
	@GetMapping("/reservationList")
	public void getReservationList(@RequestParam("user_id") String user_id, Model model) {
		// DTO 설정을 위한 준비
		List<ReservationVO> reservationList = reservationService.getListByUserId(user_id);
		List<Long> tnoList = reservationService.getTnoByUserId(user_id);
		List<TrainVO> trainList = new ArrayList<TrainVO>();
		List<ReservationDTO> dtoList = new ArrayList<ReservationDTO>();
		
		for(long tno : tnoList) {
			TrainVO vo = trainService.getOneByTno(tno);
			trainList.add(vo);
		}
		
		// 노선 에서 시간을 20240505090500 같은 형태로 받게 되는데 이를 2024년 05월 05일 09시 05분 의 형태로 출력하기 위한 작업
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
				
		for(int i = 0 ; i < reservationList.size() ; i++) {
			ReservationVO reservationVO = reservationList.get(i);
			TrainVO trainVO = trainList.get(i);
			// 시간 설정을 여기서 변경 후 대입
			try {
				Date depDate = sdf.parse(String.valueOf(trainVO.getDep_time()));
				String formattedDepTime = outputFormat.format(depDate);
				trainVO.setFormattedDepTime(formattedDepTime);
				
				Date arrDate = sdf.parse(String.valueOf(trainVO.getArr_time()));
				String formattedArrTime = outputFormat.format(arrDate);
				trainVO.setFormattedArrTime(formattedArrTime);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			// 시간 설정이 끝난 VO 들을 DTO 로 통합
			ReservationDTO dto = new ReservationDTO();
			dto.setReservationVO(reservationVO);
			dto.setTrainVO(trainVO);
			
			dtoList.add(dto);
		}
		
		model.addAttribute("dtoList", dtoList);
	}
	
	// 예약 상세보기 페이지
	@GetMapping("/reservationView")
	public void getReservationView(@RequestParam("rno") long rno, Model model) {
		ReservationVO reservation = reservationService.getOneByRno(rno);
		
		TrainVO train = trainService.getOneByTno(reservation.getTno());
		
		// 시간 설정
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
		
		// 마지막으로 정보들을 DTO 에 담아 보낸다
		ReservationDTO dto = new ReservationDTO();
		dto.setReservationVO(reservation);
		dto.setTrainVO(train);
		
		model.addAttribute("dto", dto);
		
	}
	
	// 마이페이지 내에서 예약 취소
	@PostMapping("/cancelReservation")
	public String PostCancelReservation(@RequestParam("rno") long rno, RedirectAttributes rttr) {
		int delete = reservationService.delete(rno);
		
		if(delete == 1) {
			rttr.addFlashAttribute("message", "예약 취소가 완료되었습니다.");
		}
		
		// 아이디를 받아오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id = authentication.getName();
		
		
		return "redirect:/mypage/reservationList?user_id=" + id;
	}
	
	
	// 마이페이지 Q&A 자세히 보기
	@GetMapping("/qnaList")
	public void getQnaList(@RequestParam("writer") String writer, Model model) {
		List<QnaVO> qnaList = qnaService.getListByWriter(writer);
		List<QnaReplyDTO> dtoList = new ArrayList<QnaReplyDTO>();
		List<ReplyVO> replyList = new ArrayList<ReplyVO>(); 
		qnaList.forEach(qna -> log.info(qna));
		
		for(int i = 0 ; i < qnaList.size(); i++) {
			QnaVO qna = qnaList.get(i);
			replyList = replyService.getListQno(qna.getQno());
			
			QnaReplyDTO dto = new QnaReplyDTO();
			dto.setQna(qna);
			dto.setReply(replyList);
			
			dtoList.add(dto);
			
		}
		
		model.addAttribute("dtoList", dtoList);
		
	}
	
	
	// Q&A 상세보기 페이지
	@GetMapping("/qnaView")
	public void getQnaView(@RequestParam("qno")long qno, Model model) {
		// 게시글 조회로 인한 조회수 증가 처리
		int readCount = qnaService.updateReadCount(qno);
		
		// List 불러오기
		QnaVO qna = qnaService.getOne(qno);
		List<ReplyVO> replyList = replyService.getListQno(qno);
		
		// DTO 에 넣기
		QnaReplyDTO dto = new QnaReplyDTO();
		dto.setQna(qna);
		dto.setReply(replyList);
		
		model.addAttribute("dto", dto);
	}
}
