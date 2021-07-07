package kr.co.life.recipe.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.life.recipe.dao.RecipeDao;
import kr.co.life.recipe.dto.MaterialDto;
import kr.co.life.recipe.dto.RecipeDto;


@Controller
public class RecipeController {
	@Autowired
	private SqlSession sqlSession5;
	
	@RequestMapping("/recipe_list")
	public String write(Model model, HttpServletRequest request, HttpServletRequest request1, HttpServletRequest request2, HttpServletRequest requests){
		RecipeDao rdao = sqlSession5.getMapper(RecipeDao.class);
		// 전체 레시피 페이징 처리
		Integer pagecnt = rdao.get_pagecnt();
		int index;
		int page;
		if(request.getParameter("page")==null) {
			page = 1;
			index = 0;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
			index = (page-1)*10;
		}
		int pstart = page/10;
		if(page%10 == 0)
			pstart = pstart-1;
		pstart = pstart*10+1;
		int pend = pstart+9;
		model.addAttribute("pstart", pstart);
		if(pend > pagecnt)
			pend = pagecnt;
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		model.addAttribute("pagecnt", pagecnt);
		
		ArrayList<RecipeDto> rlist = rdao.recipe_list(index);
		model.addAttribute("rlist", rlist);
		ArrayList<MaterialDto> elist = rdao.effect_list();
		model.addAttribute("elist", elist);
		
		// 사용자에게 건강 카테고리와 재료 카테고리 받아오기
		String rctg = request.getParameter("ctg");
		model.addAttribute("rctg", rctg);
		ArrayList<MaterialDto> mlist = rdao.material_list(rctg);
		model.addAttribute("mlist", mlist);
		String rmtl = request.getParameter("mtl");
		model.addAttribute("rmtl", rmtl);
		
		// 건강 카테고리 선택 시 페이징 처리
		Integer pagecnt1 = rdao.get_pagecnt1(rctg);
		int index1;
		int page1;
		if(request1.getParameter("page1")==null) {
			page1 = 1;
			index1 = 0;
		} else {
			page1 = Integer.parseInt(request1.getParameter("page1"));
			index1 = (page1-1)*10;
		}
		int pstart1 = page1/10;
		if(page1%10 == 0)
			pstart1 = pstart1-1;
		pstart1 = pstart1*10+1;
		int pend1 = pstart1+9;
		model.addAttribute("pstart1", pstart1);
		if(pend1 > pagecnt1)
			pend1 = pagecnt1;
		model.addAttribute("pend1", pend1);
		model.addAttribute("page1", page1);
		model.addAttribute("pagecnt1", pagecnt1);
		ArrayList<RecipeDto> rlist1 = rdao.recipe_list1(rctg, index1);
		model.addAttribute("rlist1", rlist1);
		//System.out.println(rlist1.size()); 
		
		// 재료 카테고리까지 선택 시 페이징 처리
		Integer pagecnt2 = rdao.get_pagecnt2(rmtl);
		int index2;
		int page2;
		if(request2.getParameter("page")==null) {
			page2 = 1;
			index2 = 0;
		} else {
			page2 = Integer.parseInt(request2.getParameter("page"));
			index2 = (page2-1)*10;
		}
		int pstart2 = page2/10;
		if(page2%10 == 0)
			pstart2 = pstart2-1;
		pstart2 = pstart2*10+1;
		int pend2 = pstart2+9;
		model.addAttribute("pstart2", pstart2);
		if(pend2 > pagecnt2)
			pend2 = pagecnt2;
		model.addAttribute("pend2", pend2);
		model.addAttribute("page2", page2);
		model.addAttribute("pagecnt2", pagecnt2);
		
		ArrayList<RecipeDto> rlist2 = rdao.recipe_list2(rmtl, index2);
		model.addAttribute("rlist2", rlist2);
		 
		// 검색 시 키워드 받아오기
		String keyword = request.getParameter("searchbar");
		model.addAttribute("search", keyword);
		
		// 검색 시 페이징 처리
		Integer pagecnts = rdao.get_pagecnts(keyword);
		int indexs;
		int pages;
		if(requests.getParameter("page")==null) {
			pages = 1;
			indexs = 0;
		} else {
			pages = Integer.parseInt(requests.getParameter("page"));
			indexs = (pages-1)*10;
		}
		int pstarts = pages/10;
		if(pages%10 == 0)
			pstarts = pstarts-1;
		pstarts = pstarts*10+1;
		int pends = pstarts+9;
		model.addAttribute("pstarts", pstarts);
		if(pends > pagecnts)
			pends = pagecnts;
		model.addAttribute("pends", pends);
		model.addAttribute("pages", pages);
		model.addAttribute("pagecnts", pagecnts);
		
		ArrayList<RecipeDto> rlists = rdao.recipe_lists(keyword);
		model.addAttribute("rlists", rlists);
		
		return "recipe/recipe_list";
	}
	
	@RequestMapping("/recipe_detail")
	public String detail(Model model, HttpServletRequest request, HttpSession session){
		RecipeDao rdao = sqlSession5.getMapper(RecipeDao.class);
		String rcode = request.getParameter("recipe_code");
		String userid = null;
		if(session.getAttribute("userid")!=null) {
			userid = session.getAttribute("userid").toString();
			Integer rlike = rdao.recipe_like(rcode, userid);
			model.addAttribute("rlike", rlike);
		} else {
			Integer rlike = null;
			model.addAttribute("rlike", rlike);
		}
		
		RecipeDto rdetail = rdao.recipe_detail(rcode);
		Integer likecnt = rdao.likecnt(rcode);
		model.addAttribute("rdetail", rdetail);
		model.addAttribute("likecnt", likecnt);
		return "recipe/recipe_detail";
	}
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest request) {
		String rcode = request.getParameter("recipe_code");
		RecipeDao rdao = sqlSession5.getMapper(RecipeDao.class);
		rdao.readnum(rcode);
		return "redirect:/recipe_detail?recipe_code="+rcode;
	}
	
	@RequestMapping("/mreadnum")
	public String mreadnum(HttpServletRequest request) {
		String rctg = request.getParameter("ctg");
		RecipeDao rdao = sqlSession5.getMapper(RecipeDao.class); 
		rdao.mreadnum(rctg);
		return "redirect:/recipe_list?ctg="+rctg;
	}
	
	@RequestMapping("/recipe_like1")
	public void recipe_like1(HttpServletRequest request, PrintWriter out) throws Exception{
		request.setCharacterEncoding("utf-8");
		String rcode = request.getParameter("recipe_code");
		String userid = request.getParameter("userid");
		RecipeDao rdao = sqlSession5.getMapper(RecipeDao.class);
		rdao.recipe_like1(rcode, userid);
		rdao.update_rlike(rcode);
		out.print("1");
	}
	
	@RequestMapping("/recipe_like2")
	public void recipe_like2(HttpServletRequest request, PrintWriter out) throws Exception{
		request.setCharacterEncoding("utf-8");
		String rcode = request.getParameter("recipe_code");
		String userid = request.getParameter("userid");
		RecipeDao rdao = sqlSession5.getMapper(RecipeDao.class);
		rdao.recipe_like2(rcode, userid);
		rdao.update_rlike(rcode);
		out.print("1");
	}
}
