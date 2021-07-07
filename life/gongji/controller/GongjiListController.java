package kr.co.life.gongji.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.life.gongji.dao.GongjiListDao;
import kr.co.life.gongji.dto.GongjiListDto;

@Controller
public class GongjiListController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/gongji_list")
	public String gongji_list(Model model,HttpServletRequest request)
	{
		GongjiListDao gldao=sqlSession.getMapper(GongjiListDao.class);
		
		int index;
		int page;
		
		if(request.getParameter("page")==null)
		{
			page=1;
			index=0;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
			index=(page-1)*5;
		}
		
		int pstart=page/5;
		if(page%5==0)
			pstart=pstart-1;
		
		pstart=(pstart*5)+1;
		int pend=pstart+4;

		ArrayList<GongjiListDto> list=gldao.list(index);
		model.addAttribute("list",list);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		Integer pagecnt=gldao.get_pagecnt();
		model.addAttribute("pagecnt",pagecnt);
		if(pend > pagecnt)
			pend=pagecnt;
		model.addAttribute("pend",pend);
		return "gongji/gongji_list";
	}
	
	@RequestMapping("/gongji_update")
	public String gongji_update(Model model, HttpServletRequest request)
	{
		String id=request.getParameter("id");
		GongjiListDao gldao=sqlSession.getMapper(GongjiListDao.class);
		GongjiListDto gldto=gldao.gongji_update(id);
		model.addAttribute("gldto",gldto);
		return "gongji/gongji_update";
	}
	
	@RequestMapping("/gongji_update_ok")
	public String gongji_update_ok(GongjiListDto gldto)
	{
		GongjiListDao gldao=sqlSession.getMapper(GongjiListDao.class);
		gldao.gongji_update_ok(gldto);
		return "redirect:/gongji_list";
	}

	@RequestMapping("/gongji_delete")
	public String gongji_delete(HttpServletRequest request)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		GongjiListDao gldao=sqlSession.getMapper(GongjiListDao.class);
		gldao.gongji_delete(id);
		return "redirect:/gongji_list";
	}
}
