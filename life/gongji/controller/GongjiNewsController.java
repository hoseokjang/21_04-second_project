package kr.co.life.gongji.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.life.gongji.dao.GongjiNewsDao;
import kr.co.life.gongji.dto.GongjiNewsDto;

@Controller
public class GongjiNewsController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/gongji_news")
	public String gongji_news(Model model, HttpServletRequest request)
	{
		GongjiNewsDao gndao=sqlSession.getMapper(GongjiNewsDao.class);
		
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
			index=(page-1)*10;
		}
		
		int pstart=page/10;
		if(page%10 ==0)
			pstart=pstart-1;
		
		pstart=(pstart*10)+1;
		int pend=pstart+9;
		
		ArrayList<GongjiNewsDto> list=gndao.news_list(index);
		model.addAttribute("news_list",list);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		Integer pagecnt=gndao.get_pagecnt();
		model.addAttribute("pagecnt",pagecnt);
		if(pend > pagecnt)
			pend=pagecnt;
		model.addAttribute("pend",pend);
		return "gongji/gongji_news";
	}
}
