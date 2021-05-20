package com.spring.mta.vo;

import com.spring.mta.vo.freeBoardVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class freeBoardVO extends commonVO{
	private int		f_no		=0; //�۹�ȣ
	private String	f_title		="";//������
	private String 	f_text		="";//�۳���
	private	String	f_image 	="";//���̹���
	private String	f_video;		//�ۿ���
	private int	f_recoment   	=0;//�۴�ۼ�
	private String f_regdate;		//�۵����
	private int f_views = 0;		//����ȸ��
	private String user_id = "";	//�������̵�
}
