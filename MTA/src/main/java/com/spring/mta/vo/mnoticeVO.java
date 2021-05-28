package com.spring.mta.vo;

import lombok.Data;

@Data
public class mnoticeVO {
	private int mn_no=0;	// 음악 공지 번호
	private String mn_title=""; // 음악 공지 제목
	private String mn_text="";	// 음악 공지 내용
	private String mn_regdate;	// 음악 공지 등록일
}
