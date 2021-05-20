package com.spring.mta.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mta.common.vo.PageDTO;
import com.spring.mta.service.freeBoardService;
import com.spring.mta.vo.freeBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class freeBoardController {
	private freeBoardService freeboardService;
	
	/*********************************************************
	 * 글목록 구현하기(페이징 처리 목록 조회)
	 *********************************************************/
	
	@RequestMapping(value="/freeboard", method = RequestMethod.GET)
	//GetMapping("/boardList")
	public String boardList(@ModelAttribute("data") freeBoardVO fvo, Model model ) {
		log.info("freeBoard 호출 성공");
		
	
		// 전체 레코드 조회 
		List<freeBoardVO> boardList = freeboardService.freeboardList(fvo);
		model.addAttribute("boardList", boardList);
		
		// 전체 레코드수 구현
		int total = freeboardService.boardListCnt(fvo);
		//페이징 처리
		model.addAttribute("pageMaker" , new PageDTO(fvo, total));
		
		
		return "board/freeboard";
	}
	
	
	/*********************************************************
	 * 글쓰기 폼 출력하기
	 *********************************************************/
	@RequestMapping("/freeWriteForm")
	public String writeForm(@ModelAttribute("data") freeBoardVO bvo) {
		log.info("freeWrtieForm 호출 성공");
		
		return "board/freeWriteForm";
	}
	
	
}
	


	
	
	
	

