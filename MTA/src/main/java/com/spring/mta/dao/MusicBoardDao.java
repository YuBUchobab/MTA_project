package com.spring.mta.dao;

import java.util.List;

import com.spring.mta.vo.MusicBoardVO;

public interface MusicBoardDao {

	public List<MusicBoardVO> musicChart(MusicBoardVO mbvo);

	public List<MusicBoardVO> musicBoardList(MusicBoardVO mvo);

	public int musicBoardInsert(MusicBoardVO bvo);

	public MusicBoardVO boardDetail(MusicBoardVO mvo);

	public int recommend(MusicBoardVO mvo);


}
