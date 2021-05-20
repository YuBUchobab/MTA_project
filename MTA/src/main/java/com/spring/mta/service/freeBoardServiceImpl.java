package com.spring.mta.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mta.vo.freeBoardVO;
import com.spring.mta.dao.freeDao;


import lombok.Setter;


@Service
public class freeBoardServiceImpl implements freeBoardService {
	
	@Setter(onMethod_ =@Autowired )
	private freeDao fboardDao;

	@Override
	public List<freeBoardVO> freeboardList(freeBoardVO fvo) {
		// TODO Auto-generated method stub
				List<freeBoardVO> list = null;
				list = fboardDao.freeboardList(fvo);
				return list;
	}

	@Override
	public int boardListCnt(freeBoardVO fvo) {
		// TODO Auto-generated method stub
		return fboardDao.boardListCnt(fvo);
	}

}
