package com.spring.mta.dao;

import java.util.List;

import com.spring.mta.vo.freeBoardVO;

public interface freeDao {

	List<freeBoardVO> freeboardList(freeBoardVO fvo);
	int boardListCnt(freeBoardVO fvo);

}
