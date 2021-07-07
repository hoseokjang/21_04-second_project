package kr.co.life.gongji.dao;

import java.util.ArrayList;

import kr.co.life.gongji.dto.GongjiListDto;

public interface GongjiListDao {
	public ArrayList<GongjiListDto> list(int index);
	public Integer get_pagecnt();
	public Integer get_num();
	public GongjiListDto gongji_update(String id);
	public void gongji_update_ok(GongjiListDto gldto);
	public void gongji_delete(int id);
	public ArrayList<GongjiListDto> gongjimain();
}
