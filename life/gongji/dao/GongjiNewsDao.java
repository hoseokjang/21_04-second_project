package kr.co.life.gongji.dao;

import java.util.ArrayList;

import kr.co.life.gongji.dto.GongjiNewsDto;

public interface GongjiNewsDao {
	public ArrayList<GongjiNewsDto> news_list(int index);
	public Integer get_pagecnt();
	public Integer get_num();
	public ArrayList<GongjiNewsDto> news_list2();
	
}
