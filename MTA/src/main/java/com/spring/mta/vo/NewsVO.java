package com.spring.mta.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NewsVO {
	private int n_no = 0;			// 뉴스 글 번호
	private String n_title = ""; 	// 뉴스 제목
	private String n_note = "";		// 뉴스 부재목
	private String n_text = ""; 	// 뉴스 내용
	private String n_regdate;		// 뉴스등록 시간
	
	private String n_image = ""; 	// 뉴스 이미지
	private MultipartFile file;		// 파일
	
	
}
