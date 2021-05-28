package com.spring.mta.vo;

import lombok.Data;

@Data
public class fnoticeVO {
	private int fn_no=0;			// 자게_공지글 번호
	private String fn_title="";		// 자게_공지글 제목
	private String fn_text="";		// 자게_공지글 내용
	private String fn_regdate=""; 	// 자게_공지글 등록시간
	
}
