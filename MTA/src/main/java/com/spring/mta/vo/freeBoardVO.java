package com.spring.mta.vo;

import com.spring.mta.vo.freeBoardVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class freeBoardVO extends commonVO{
	private int		f_no		=0; //글번호
	private String	f_title		="";//글제목
	private String 	f_text		="";//글내용
	private	String	f_image 	="";//글이미지
	private String	f_video;		//글영상
	private int	f_recoment   	=0;//글댓글수
	private String f_regdate;		//글등록일
	private int f_views = 0;		//글조회수
	private String user_id = "";	//유저아이디
}
