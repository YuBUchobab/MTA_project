package com.spring.mta.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mta.service.MusicBoardService;
import com.spring.mta.service.mainpageService;
import com.spring.mta.vo.MusicBoardVO;
import com.spring.mta.vo.UserVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mainpage/*")
@AllArgsConstructor
public class mainpageController {
		
	private mainpageService mpService;
	private MusicBoardService musicBoardService;
	
	/********************************************************
	 * 메인페이지로 이동
	 * ******************************************************/
	@GetMapping("/mainpage")
	 public String goMain(MusicBoardVO mbvo, Model model, HttpSession session){
		 	log.info("mainpage 호출 완료");
			log.info("musicChart 호출 완료");
			
			List<MusicBoardVO> mchart_list = musicBoardService.musicChart(mbvo);
			model.addAttribute("mchart_list",mchart_list);
	
			
		 return "mainpage/mainpage";
	 }
	 
	 /********************************************************
		 * 소개페이지로 이동
		 * ******************************************************/
		 @GetMapping("/eventintro")
		 public String goIntroduce() {
			 return "mainpage/eventintro";
		 }
		 
	/*********************************************************
	 * 뉴스차트
	 * ******************************************************/
		/*
	@RequestMapping(value = "/newchart", method = RequestMethod.POST)
	public List<NewsVO> newsChart(@ModelAttribute("news_data") NewsVO, Model model){
		
	}
	 */
		 
	/*********************************************************
	* 개인정보 처리방침
	* ******************************************************/
	@GetMapping("/personal")
	public String goPersonal_infomation() {
			return "/etc/personal_information";
	}
	
	/*********************************************************
	* 이용약관
	* ******************************************************/
	@GetMapping("/terms")
	public String goTerms_and_conditions() {
			return "/etc/terms_and_conditions";
	}
	
	/*********************************************************
	* 저작권
	* ******************************************************/
	@GetMapping("/copyright")
	public String goCopyright() {
			return "/etc/copyright";
	}
	
}
