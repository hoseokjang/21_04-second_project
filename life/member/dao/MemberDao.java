package kr.co.life.member.dao;

import java.util.ArrayList;

import kr.co.life.hfood.dto.HfoodDto;
import kr.co.life.member.dto.MemberDto;
import kr.co.life.recipe.dto.RecipeDto;

public interface MemberDao {
	public MemberDto login_ok(MemberDto mdto);
	public MemberDto pwd_search_ok(MemberDto mdto);
	public Integer userid_check(String userid); 
	public void member_ok(MemberDto mdto);
	public MemberDto mypage(String userid);
	public void myupdate_ok(MemberDto mdto);
	public ArrayList<MemberDto> member_list(); 
	public ArrayList<MemberDto> admin_list(); 
	public void mem_state(MemberDto mdto);
	public void adm_state(MemberDto mdto);
	public ArrayList<RecipeDto> r_like_list(String userid);
	public ArrayList<HfoodDto> h_like_list(String userid);
}