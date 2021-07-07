package kr.co.life.gongji.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.life.gongji.dao.GongjiListDao;
import kr.co.life.gongji.dao.GongjiQnADao;
import kr.co.life.gongji.dto.GongjiQnADto;

@Controller
public class GongjiQnAController {
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/gongji_qna")
	public String gongji_qna(Model model, HttpServletRequest request)
	{
		GongjiQnADao gqdao=sqlSession.getMapper(GongjiQnADao.class);
		ArrayList<GongjiQnADto> list=gqdao.list();
		model.addAttribute("list",list);
		return "gongji/gongji_qna";
	}

	@RequestMapping("/qna_update")
	public String qna_update(Model model,HttpServletRequest request)
	{
		String id=request.getParameter("id");
		GongjiQnADao gqdao=sqlSession.getMapper(GongjiQnADao.class);
		GongjiQnADto gqdto=gqdao.qna_update(id);
		model.addAttribute("gqdto",gqdto);
		return "gongji/qna_update";
	}
	
	@RequestMapping("/qna_update_ok")
	public String qna_update_ok(GongjiQnADto gqdto)
	{
		GongjiQnADao gqdao=sqlSession.getMapper(GongjiQnADao.class);
		gqdao.qna_update_ok(gqdto);
		return "redirect:/gongji_qna";
	}
	
	@RequestMapping("/qna_delete")
	public String gongji_delete(HttpServletRequest request)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		GongjiQnADao gqdao=sqlSession.getMapper(GongjiQnADao.class);
		gqdao.qna_delete(id);
		return "redirect:/gongji_qna";
	}
}
