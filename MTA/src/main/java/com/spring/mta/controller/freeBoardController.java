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
	 * �۸�� �����ϱ�(����¡ ó�� ��� ��ȸ)
	 *********************************************************/
	
	@RequestMapping(value="/freeboard", method = RequestMethod.GET)
	//GetMapping("/boardList")
	public String boardList(@ModelAttribute("data") freeBoardVO fvo, Model model ) {
		log.info("freeBoard ȣ�� ����");
		
	
		// ��ü ���ڵ� ��ȸ 
		List<freeBoardVO> boardList = freeboardService.freeboardList(fvo);
		model.addAttribute("boardList", boardList);
		
		// ��ü ���ڵ�� ����
		int total = freeboardService.boardListCnt(fvo);
		//����¡ ó��
		model.addAttribute("pageMaker" , new PageDTO(fvo, total));
		
		
		return "board/freeboard";
	}
	
	
	/*********************************************************
	 * �۾��� �� ����ϱ�
	 *********************************************************/
	@RequestMapping("/freeWriteForm")
	public String writeForm(@ModelAttribute("data") freeBoardVO bvo) {
		log.info("freeWrtieForm ȣ�� ����");
		
		return "board/freeWriteForm";
	}
	
	
}
	


	
	
	
	

