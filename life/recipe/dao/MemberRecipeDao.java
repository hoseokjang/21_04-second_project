package kr.co.life.recipe.dao;

import java.util.ArrayList;

import kr.co.life.recipe.dto.MRReviewDto;
import kr.co.life.recipe.dto.MemberRecipeDto;

public interface MemberRecipeDao {
	public ArrayList<MemberRecipeDto> mrmain();
	public void write_ok(MemberRecipeDto mrdto);
	public MemberRecipeDto detail(String mr_id);
	public ArrayList<MemberRecipeDto> list(int index);
	public Integer get_pagecnt();
	public void mreadnum(String mr_id);
	public void delete(int mr_id);
	public String get_pwd(int mr_id);
	public Integer pwd_check(MemberRecipeDto mrdto);
	public void update_ok(MemberRecipeDto mrdto);
	public ArrayList<MRReviewDto> review_list(String mr_id);
}
