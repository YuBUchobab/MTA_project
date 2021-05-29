package com.spring.mta.vo;

import lombok.Data;

@Data
public class m_cartVO {
	private int cart_no=0; // 장바구니 번호
	private String user_id =""; // 유저 아이디
	private int m_no=0;			// 음악 글 번호
}
