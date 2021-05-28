package com.spring.mta.service;

import java.util.List;

import com.spring.mta.vo.MusicBoardVO;

public interface MusicBoardService {

	public List<MusicBoardVO> musicChart(MusicBoardVO mbvo);
	
	public List<MusicBoardVO> musicBoardList(MusicBoardVO mvo);

	public int musicBoardInsert(MusicBoardVO bvo) throws Exception;

	public MusicBoardVO boardDetail(MusicBoardVO mvo);

	public int recommend(MusicBoardVO mvo);

	public int replyCnt(int m_no);

	

	

}
