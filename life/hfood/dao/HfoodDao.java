package kr.co.life.hfood.dao;

import java.util.ArrayList;

import kr.co.life.hfood.dto.HfoodDto;
import kr.co.life.hfood.dto.HreviewDto;

public interface HfoodDao {
	
	public ArrayList<HfoodDto> hfoodmain();
	public ArrayList<HfoodDto> ctgname();
	public ArrayList<HfoodDto> material(String rctg);
	public ArrayList<HfoodDto> list(String rsctg);
	public void hreadnum(String id);
	public void ctgreadnum(String ctg);
	public HfoodDto hcontent(String id);
	public Double havg(String id);
	public void hreview_ok(HreviewDto hrdto);
	public HreviewDto hupdate(String id);
	public void hupdate_ok(HreviewDto hrdto);
	public void hdelete(String id);
	public Integer hreviewcnt(String id);
	public ArrayList<HfoodDto> hsearch(String search,String rsctg);
	public ArrayList<HfoodDto> hsearch2(String search);
	public Integer hlike(String id, String userid);
	public void hlike1(String pid, String userid);
	public void hlike2(String pid, String userid);
	public Integer likecnt(String id);
	public Integer page_count(String id);
	public ArrayList<HreviewDto> hrlist(String id,int index);
}
