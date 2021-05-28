package com.spring.mta.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NewsVO {
	private int n_no = 0;			// ���� �� ��ȣ
	private String n_title = ""; 	// ���� ����
	private String n_note = "";		// ���� �����
	private String n_text = ""; 	// ���� ����
	private String n_regdate;		// ������� �ð�
	
	private String n_image = ""; 	// ���� �̹���
	private MultipartFile file;		// ����
	
	
}
