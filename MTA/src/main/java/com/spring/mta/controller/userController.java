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
	 * �α��� �����ϱ�
	 *********************************************************/
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	//GetMapping("/boardList")
	public String loginList(@ModelAttribute("data") UserVO uvo , HttpSession session, Model model) {
		log.info("loginList ȣ�� ����");
		
		// ��ü ���ڵ� ��ȸ 
		UserVO userInfo  = userservice.login(uvo);
		
		if (userInfo != null) {
			session.setAttribute("userInfo", userInfo);
		}else {
			model.addAttribute("errMsg", "�α��������� �ùٸ����ʽ��ϴ�.");
		}
		
		return "/intro";
	}
	
	/*********************************************************
	 * �α׾ƿ� �����ϱ�
	 *********************************************************/
	/*
	 @RequestMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate();
	     
	        
	     return "/intro";
	}

*/
	
	
	/********************************************************
	 * ������������ �̵�
	 * ******************************************************/
	 @GetMapping("/userDetailForm")
	 public String userDetailForm() {
		 return "user/userDetailForm";
	 }
	 
	 /********************************************************
	  * ���� ���������� �̵�
	 * ******************************************************/
		 @GetMapping("/userUpdateForm")
		 public String userUpdateForm() {
			 return "user/userUpdateForm";
	}
		 
		 /********************************************************
		  * ���� ���� ����
		 * ******************************************************/
		@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
		public String freeboardUpdate(@ModelAttribute("data") UserVO uvo, HttpSession session ) throws Exception{
			log.info("userUpdate ȣ�� ����");
			
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

