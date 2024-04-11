package com.zima.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zima.domain.AdminVO;
import com.zima.domain.Criteria;
import com.zima.domain.NoticeVO;
import com.zima.domain.PageDTO;
import com.zima.domain.QnaVO;
import com.zima.domain.ReplyVO;
import com.zima.domain.ReservationVO;
import com.zima.domain.StationVO;
import com.zima.domain.TrainVO;
import com.zima.domain.UsersVO;
import com.zima.service.AdminService;
import com.zima.service.NoticeService;
import com.zima.service.QnaService;
import com.zima.service.ReplyService;
import com.zima.service.ReservationService;
import com.zima.service.StationService;
import com.zima.service.TrainService;
import com.zima.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	// 관리자 페이지 컨트롤러 
	
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private StationService stationService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private ReservationService reservationService;
	
	// 관리자 메인 페이지
	@GetMapping("/Dashboard")
	public String adminMain(Model model) {
		// 대시보드에 표시할 노선 수, 예약 수, 이용자 수, Q&A 수 표기
		int trainCount = trainService.getTotalCount();
		model.addAttribute("trainCount", trainCount);
		
		int reservationCount = reservationService.getTotalCount();
		model.addAttribute("reservationCount", reservationCount);
		
		int usersCount = usersService.getTotalCount();
		model.addAttribute("usersCount", usersCount);
		
		int qnaCount = qnaService.getTotalCount();
		model.addAttribute("qnaCount", qnaCount);
		
		// 대시보드에 표시할 최근 예약 목록
		List<ReservationVO> reservationList = reservationService.getListMin();
		model.addAttribute("reservationList", reservationList);
		
		return "/admin/adminDashboard";
	}
	
	// 관리자 페이지 로그인 및 로그아웃
	@GetMapping("/login")
	public String adminLogin() {
		
		return "/admin/adminLogin";
	}
	
	@PostMapping("/login")
	public String PostAdminLogin(@RequestParam("id") String id, @RequestParam("password") String password) {
		boolean result = adminService.checkPassword(id, password);
		if(result) {
			adminService.setAuthenticationAdmin(id);
			log.info("admin login");
		}
		
		return "redirect:/admin/Dashboard";
	}
	
	@GetMapping("/logout")
	public String getAdminLogout() {
		
		return "/admin/adminLogout";
	}

	// 공지사항 페이지
	@GetMapping("/noticeList")
	public String noticeList(Model model, Criteria cri) {
		List<NoticeVO> list = noticeService.getListWithPaging(cri);
		int total = noticeService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", list);
		
		return "/admin/notice/noticeList";
	}
	
	@GetMapping("/noticeView")
	public String noticeView(@RequestParam("nno") long nno,@ModelAttribute("cri") Criteria cri, Model model) {
		NoticeVO vo = noticeService.read(nno);
		model.addAttribute("vo", vo);
		
		return "/admin/notice/noticeView";
	}
	
	@GetMapping("/noticeWrite")
	public String noticeWrite(@ModelAttribute("cri") Criteria cri) {
		
		return "/admin/notice/noticeWrite";
	}
	
	@GetMapping("/noticeModify")
	public String noticeModify(@RequestParam("nno") long nno, @ModelAttribute("cri") Criteria cri, Model model) {
		NoticeVO vo = noticeService.read(nno);
		model.addAttribute("vo", vo);
		
		
		return "/admin/notice/noticeModify";
	}
	
	@PostMapping("/noticeModify")
	public String PostNoticeModify(@ModelAttribute("cri") Criteria cri, NoticeVO vo, RedirectAttributes rttr) {
		int result = noticeService.update(vo);
		if(result == 1) {
			rttr.addFlashAttribute("message", "공지사항이 성공적으로 수정되었습니다.");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/admin/noticeList";
	}
	
	@PostMapping("/noticeWrite")
	public String PostnoticeWrite(NoticeVO vo, @ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
		noticeService.insert(vo);
		rttr.addFlashAttribute("message", "공지사항이 정상적으로 등록되었습니다.");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/admin/noticeList";
	}
	
	@PostMapping("/noticeDelete")
	public String PostnoticeDelete(@RequestParam("nno") long nno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = noticeService.delete(nno);
		if(result == 1) {
			rttr.addFlashAttribute("message", "공지사항 삭제가 완료되었습니다.");
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
		} else {
			rttr.addFlashAttribute("message", "공지사항 삭제에 실패했습니다.");
		}
		
		
		return "redirect:/admin/noticeList";
	}
	
	
	// Q&A 페이지
	@GetMapping("/qnaList")
	public String qnaList(Model model, Criteria cri) {
		List<QnaVO> list = qnaService.getListWithPaging(cri);
		int total = qnaService.getTotalCount();	

		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", list);
		
		return "/admin/qna/qnaList";
	}
	
	@GetMapping("/qnaView")
	public String qnaView(@RequestParam("qno") long qno,@ModelAttribute("cri") Criteria cri, Model model) {
		QnaVO vo = qnaService.getOne(qno);
		int count = qnaService.updateReadCount(qno);
		model.addAttribute("vo", vo);
		
		return "/admin/qna/qnaView";
	}
	
	@GetMapping("/qnaReply")
	public String GetqnaReply(@RequestParam("qno") long qno,@ModelAttribute("cri") Criteria cri , Model model) {
		QnaVO vo = qnaService.getOne(qno);
		model.addAttribute("vo", vo);
		
		return "/admin/qna/qnaReply";
	}
	
	@PostMapping("/qnaReply")
	public String PostQnaReply(@ModelAttribute("cri") Criteria cri, ReplyVO vo, RedirectAttributes rttr) {
		replyService.insert(vo);
		rttr.addFlashAttribute("message", "답글 등록에 성공했습니다.");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		
		return "redirect:/admin/qnaList";
	}
	
	@PostMapping("/qnaDelete")
	public String PostqnaDelete(@RequestParam("qno") long qno,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = qnaService.delete(qno);
		if(result == 1) {
			rttr.addFlashAttribute("message", "Q&A 삭제에 성공하였습니다.");
		} else {
			rttr.addFlashAttribute("message", "Q&A 삭제에 실패하였습니다.");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
	return "redirect:/admin/qnaList";
	}
	
	@GetMapping("/qnaStatus")
	public void qnaStatus(Model model) {
		
	}
	
	
	// 예약 페이지
	@GetMapping("/reservationList")
	public String reservationList(Model model, Criteria cri) {
		List<ReservationVO> list = reservationService.getListPaging(cri);
		int total = reservationService.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", list);
		

		return "/admin/reservation/reservationList";
	}
	
	@GetMapping("/reservationStatus")
	public void reservationStatus(Model model) {
		
	}
	
	
	// 노선 페이지
	@GetMapping("/trainList")
	public String trainList(Model model) {
		List<TrainVO> list = trainService.getList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		
		for(TrainVO train : list) {
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
		
		model.addAttribute("list", list);
		
		return "/admin/train/trainList";
	}
	
	@GetMapping("/trainCreate")
	public String trainCreate() {
		
		
		return "/admin/train/trainCreate";
	}
	
	@PostMapping("/trainCreate")
	public String PosttrainCreate(@ModelAttribute("vo") TrainVO vo, RedirectAttributes rttr) {
		try {
		    trainService.insert(vo);
		} catch (NullPointerException e) {
		    log.error("Null Pointer Exception while inserting train data", e);
		    // 적절한 오류 처리 로직
		} catch (Exception e) {
		    log.error("Unexpected error while inserting train data", e);
		    // 다른 예외 처리
		}

		rttr.addFlashAttribute("message", "노선 추가가 완료되었습니다.");
		
		return "redirect:/admin/trainApi";
	}
	
	@PostMapping("/newTrain")
	public String PostNewTrain(TrainVO vo, RedirectAttributes rttr) {
		trainService.insert(vo);
		rttr.addFlashAttribute("message", "새 노선 등록이 완료되었습니다");
		
		return "redirect:/admin/trainCreate";
	}
	
	@GetMapping("/stationList")
	public String stationList(Model model, Criteria cri) {
		List<StationVO> list = stationService.getListWithPaging(cri);
		
		int total = stationService.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		model.addAttribute("list", list);
		
		return "/admin/station/stationList";
	}
	
	@GetMapping("/stationView")
	public String stationView(@RequestParam("sno") long sno, Model model) {
		StationVO vo = stationService.getOne(sno);
		model.addAttribute("vo", vo);
		
		return "/admin/station/stationView";
	}
	
	@GetMapping("/stationCreate")
	public String GetstationCreate() {
		
		return "/admin/station/stationCreate";
	}
	
	@PostMapping("/stationCreate")
	public String PoststationCreate(StationVO vo, RedirectAttributes rttr) {
		log.info("철도역을 등록합니다");
		stationService.insert(vo);
		
		log.info("철도역 등록이 완료되었습니다");
		rttr.addFlashAttribute("message", "철도역 등록이 완료되었습니다");
		
		return "redirect:/admin/stationList";
	}
	
	@PostMapping("/stationDelete")
	public String PoststationDelete(@RequestParam("sno") long sno, RedirectAttributes rttr) {
		int result = stationService.delete(sno);
		if(result == 1) {
			rttr.addFlashAttribute("message", "철도역 삭제에 성공했습니다.");
		} else {
			rttr.addFlashAttribute("message", "철도역 삭제에 실패했습니다.");
		}
		
		return "redirect:/admin/stationList";
	}
	
	@GetMapping("/stationStatus")
	public void stationStatus(Model model) {
		
	}
	
	
	// 유저 관리 페이지
	@GetMapping("/usersList")
	public String usersList(Model model, Criteria cri) {
		List<UsersVO> list = usersService.getListWithPaging(cri);
		
		
		model.addAttribute("list", list);
		int total = usersService.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/admin/users/usersList";
	}
	
	@GetMapping("/usersView")
	public String usersView(@RequestParam("uno") long uno, @ModelAttribute("cri") Criteria cri, Model model) {
		UsersVO vo = usersService.getOne(uno);
		model.addAttribute("vo", vo);
		
		return "/admin/users/usersView";
	}
	
	@PostMapping("/usersDelete")
	public String usersDelete(@RequestParam("uno") long uno, RedirectAttributes rttr) {
		int result = usersService.delete(uno);
		
		if(result == 1) {
			rttr.addFlashAttribute("message", "유저 삭제가 정상적으로 되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "유저 삭제에 실패했습니다.");
		}
		
		return "redirect:/admin/usersList";
	}
	
	@GetMapping("/usersStatus")
	public void usersStatus(Model model) {
		
	}
	
	
	// 관리자 관리 페이지
	@GetMapping("/adminList")
	public String adminList(Model model) {
		List<AdminVO> list = adminService.getList();
		model.addAttribute("list", list);
		
		return "/admin/admin/adminList";
	}
	
	@GetMapping("/adminView")
	public String adminView(@RequestParam("ano") long ano, Model model) {
		AdminVO vo = adminService.getOne(ano);
		model.addAttribute("vo", vo);
		
		return "/admin/admin/adminView";
	}
	
	@GetMapping("/adminCreate")
	public String adminCreate() {
		
		return "/admin/admin/adminCreate";
	}
	
	@PostMapping("/adminCreate")
	public String PostadminCreate(AdminVO vo, RedirectAttributes rttr) {
		log.info("새로운 관리자를 만듭니다.");
		adminService.insert(vo);
		log.info("새로운 관리자 생성에 성공했습니다.");
		rttr.addFlashAttribute("message", "새로운 관리자 생성에 성공했습니다. :" + vo.getId());
		
		return "redirect:/admin/adminList";
	}
	
	
	// API 테스트 페이지
	@GetMapping("/trainApi")
	public String trainApi() {
		
		return "admin/apitest/StationApi";
	}
	
	@GetMapping("weatherApi")
	public void weatherApi() {
		
	}
}
