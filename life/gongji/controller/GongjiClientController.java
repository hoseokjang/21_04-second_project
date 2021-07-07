package kr.co.life.gongji.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.life.gongji.dao.GongjiClientDao;
import kr.co.life.gongji.dto.GongjiClientDto;

@Controller
public class GongjiClientController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/gongji_client")
	public String gongji_client(Model model,HttpServletRequest request)
	{
		GongjiClientDao gdao=sqlSession.getMapper(GongjiClientDao.class);
		ArrayList<GongjiClientDto> list=gdao.list();
		model.addAttribute("list",list);
		return "gongji/gongji_client";
	}
	
	@RequestMapping("/gongji_insert")
	public String insert()
	{
		return "gongji/gongji_insert";
	}
	
	@RequestMapping("/insert_ok")
	public String insert_ok(HttpServletRequest request) throws IOException
	{
		String path=request.getRealPath("resources/img");
		System.out.println(path);
		int max=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
		//  제목,내용,사진이름
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		String img=multi.getFilesystemName("img");
		String userid=multi.getParameter("userid");
		
		GongjiClientDto gcdto=new GongjiClientDto();
		gcdto.setTitle(title);
		gcdto.setContent(content);
		gcdto.setImg(img);
		gcdto.setUserid(userid);
		
		GongjiClientDao gcdao=sqlSession.getMapper(GongjiClientDao.class);
		gcdao.insert_ok(gcdto);
		
		return "redirect:/gongji_client";
	}
	
	@RequestMapping("/gongji_client_content")
	public String gongji_client_content(Model model, HttpServletRequest request)
	{
		String id=request.getParameter("id");
		GongjiClientDao gcdao=sqlSession.getMapper(GongjiClientDao.class);
		GongjiClientDto gcdto=gcdao.gongji_client_content(id);
		model.addAttribute("gcdto",gcdto);
		return "gongji/gongji_client_content";
		
	}
	
	@RequestMapping("/admin_client_list")
	public String admin_client(Model model, HttpServletRequest request)
	{
		GongjiClientDao gcdao=sqlSession.getMapper(GongjiClientDao.class);
		ArrayList<GongjiClientDto> list=gcdao.admin_client_list();
		model.addAttribute("admin_client_list",list);
		return "gongji/admin_client_list";
	}
	
	@RequestMapping("/gongji_client_content_update")
	public String gongji_client_content_update(Model model, HttpServletRequest request)
	{
		String id=request.getParameter("id");
		GongjiClientDao gcdao=sqlSession.getMapper(GongjiClientDao.class);
		GongjiClientDto gcdto=gcdao.gongji_client_content_update(id);
		model.addAttribute("gcdto",gcdto);
		return "gongji/gongji_client_content_update";
	}
	
	@RequestMapping("/gongji_client_content_update_ok")
	public String gongji_client_content_update_ok(HttpServletRequest request, HttpSession session) throws IOException
	{
		String userid = session.getAttribute("userid").toString();
		if(!userid.equals("admin")) {
			String path=request.getRealPath("resources/img");
			int max=1024*1024*10;
			MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
			int id=Integer.parseInt(multi.getParameter("id"));
			String title=multi.getParameter("title");
			String content=multi.getParameter("content");
			String img=multi.getFilesystemName("img");
			String reply=multi.getParameter("reply");
			String reply_text=multi.getParameter("reply_text");
			
			GongjiClientDto gcdto=new GongjiClientDto();
			gcdto.setId(id);
			gcdto.setTitle(title);
			gcdto.setContent(content);
			gcdto.setImg(img);
			gcdto.setReply(reply);
			gcdto.setReply_text(reply_text);
			GongjiClientDao gcdao=sqlSession.getMapper(GongjiClientDao.class);
			gcdao.gongji_client_content_update_ok(gcdto);
			return "redirect:/gongji_client_content?id="+id;
		} else {
			String path=request.getRealPath("resources/img");
			int max=1024*1024*10;
			MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
			String reply=multi.getParameter("reply");
			String reply_text=multi.getParameter("reply_text");
			int id=Integer.parseInt(multi.getParameter("id"));
			GongjiClientDao gcdao=sqlSession.getMapper(GongjiClientDao.class);
			gcdao.gongji_client_content_update_ok_admin(reply, reply_text, id);
			return "redirect:/gongji_client_content?id="+id;
		}
	}
	
	@RequestMapping("/gongji_client_content_delete")
	public String gongji_client_content_delete(HttpServletRequest request)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		GongjiClientDao gcdao=sqlSession.getMapper(GongjiClientDao.class);
		gcdao.gongji_client_content_delete(id);
		return "redirect:/gongji_client";
	}
}
