package kr.co.life.recipe.dao;

import java.util.ArrayList;

import kr.co.life.recipe.dto.MaterialDto;
import kr.co.life.recipe.dto.RecipeDto;

public interface RecipeDao {
	public ArrayList<RecipeDto> recipemain();
	public ArrayList<RecipeDto> recipe_list(int index);
	public Integer get_pagecnt();
	public ArrayList<MaterialDto> effect_list();
	public ArrayList<MaterialDto> material_list(String rctg);
	public ArrayList<RecipeDto> recipe_list1(String rctg, int index1);
	public Integer get_pagecnt1(String rctg);
	public ArrayList<RecipeDto> recipe_list2(String rmtl, int index2);
	public Integer get_pagecnt2(String rmtl);
	public ArrayList<RecipeDto> recipe_lists(String keyword);
	public Integer get_pagecnts(String keyword);
	public RecipeDto recipe_detail(String rcode);
	public void readnum(String rcode);
	public void mreadnum(String rctg);
	public Integer recipe_like(String rcode, String userid);
	public void recipe_like1(String rcode, String userid);
	public void update_rlike(String rcode);
	public void recipe_like2(String rcode, String userid);
	public Integer likecnt(String rcode);
}
