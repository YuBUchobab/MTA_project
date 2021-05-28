package com.spring.mta.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mta.service.userService;
import com.spring.mta.vo.UserVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class userController {
	
	private userService userservice;
	
	/*********************************************************
	 * 로그인 구현하기
	 *********************************************************/
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	//GetMapping("/boardList")
	public String loginList(@ModelAttribute("data") UserVO uvo , HttpSession session, Model model) {
		log.info("loginList 호출 성공");
		
		// 전체 레코드 조회 
		UserVO userInfo  = userservice.login(uvo);
		
		if (userInfo != null) {
			session.setAttribute("userInfo", userInfo);
		}else {
			model.addAttribute("errMsg", "로그인정보가 올바르지않습니다.");
		}
		
		return "/intro";
	}
	
	/*********************************************************
	 * 로그아웃 구현하기
	 *********************************************************/
	/*
	 @RequestMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate();
	     
	        
	     return "/intro";
	}

*/
	
	
	/********************************************************
	 * 마이페이지로 이동
	 * ******************************************************/
	 @GetMapping("/userDetailForm")
	 public String userDetailForm() {
		 return "user/userDetailForm";
	 }
	 
	 /********************************************************
	  * 유저 수정폼으로 이동
	 * ******************************************************/
		 @GetMapping("/userUpdateForm")
		 public String userUpdateForm() {
			 return "user/userUpdateForm";
	}
		 
		 /********************************************************
		  * 유저 정보 수정
		 * ******************************************************/
		@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
		public String freeboardUpdate(@ModelAttribute("data") UserVO uvo, HttpSession session ) throws Exception{
			log.info("userUpdate 호출 성공");
			
			UserVO another = (UserVO)session.getAttribute("userInfo");
			uvo.setUser_id(another.getUser_id());
			
			UserVO userInfo = userservice.login(uvo);
				if(userInfo != null) {
					session.setAttribute("userInfo", userInfo);
			}
			
			int result = 0;
			String url = "";
			result = userservice.userUpdate(uvo);
			if (result == 1) {
				  	session.invalidate();
					url = "/intro";
			}else {
					url = "user/userUpdateForm";
			}	
			
			return url;
		}
					 
}

