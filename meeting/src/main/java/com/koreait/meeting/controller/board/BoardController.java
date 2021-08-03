package com.koreait.meeting.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.meeting.domain.Board;
import com.koreait.meeting.domain.ProFile;
import com.koreait.meeting.model.board.service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService; //DI로 주입을 요청
	
	
	//모든 게시판 가져오기 
	@GetMapping("/list")
	public String getList(Model model) {
		//3단계: 일시키기
		List boardList = boardService.selectAll();
		
		//4단계:저장
		model.addAttribute("boardList", boardList);
		
		return "board/list";
	}
	
	//게시판 등록폼 요청처리 
	@RequestMapping(value="/registform", method = {RequestMethod.GET, RequestMethod.POST})
	public String registForm(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		ProFile proFile = (ProFile)session.getAttribute("proFile");
		System.out.println("게시판 form  이동시  Profile_id "+proFile.getProfile_id());		
		model.addAttribute("proFile", proFile);
		
		return "board/regist";
	}
	
	//게시판 등록 요청
	@RequestMapping(value="/regist", method = {RequestMethod.GET, RequestMethod.POST})
	public String regist(Board board, HttpServletRequest request) {
		
		boardService.insert(board);
		HttpSession session = request.getSession();
		ProFile proFile = (ProFile)session.getAttribute("proFile");
		System.out.println("게시판 등록 직전의 Profile_id "+proFile.getProfile_id());
		
		board.setProfile_id(proFile.getProfile_id());
		
		return "redirect:/board/list"; //게시판 목록페이지를 재요청
	}

	//게시판 상세보기 요청 
	@GetMapping("/detail")
	public String getDetail(int board_id, Model model) {
		//3단계:
		Board board= boardService.select(board_id);
		List boardList=boardService.selectAll();
		
		//4단계: 
		model.addAttribute("board", board);
		model.addAttribute("boardList", boardList);
		
		return "board/detail";
	}
	
	
	@PostMapping("/edit")
	public String edit(Board board, HttpServletRequest request) {
		
		boardService.update(board);
		
		return "redirect:/board/list";
	}

	
	//게시판 삭제요청 처리 
	@PostMapping("/del")
	public String delete(int board_id, HttpServletRequest request){
		//3단계
		boardService.delete(board_id);
		
		return "redirect:/board/list"; //리스트에 재요청
	}

}









