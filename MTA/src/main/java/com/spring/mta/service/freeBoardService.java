package com.spring.mta.service;

import java.util.List;

import com.spring.mta.vo.freeBoardVO;



public interface freeBoardService {
	public List<freeBoardVO> freeboardList(freeBoardVO fvo);
	public int boardListCnt(freeBoardVO fvo);
}
