package kr.co.life.hfood.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.life.hfood.dao.HfoodDao;
import kr.co.life.hfood.dto.HfoodDto;
import kr.co.life.hfood.dto.HreviewDto;

@Controller
public class HfoodController {

	@Autowired
	private SqlSession sqlSession2;
	
	@RequestMapping("/hchart")
	public String chart()
	{
		return "statistics/hchart";
	}
	@RequestMapping("/hfood")
	public String hfood(HttpServletRequest request,Model model)
	{
		String rctg=request.getParameter("ctg");
		String rsctg=request.getParameter("sctg");
		String search=request.getParameter("searchbar");
		HfoodDao hdao=sqlSession2.getMapper(HfoodDao.class);
		ArrayList<HfoodDto> ctgname=hdao.ctgname();
		ArrayList<HfoodDto> material=hdao.material(rctg);
		ArrayList<HfoodDto> list=null;
		if(search==null)
		{
			list=hdao.list(rsctg);
		}
		else if(search!=null && rctg==null)
		{
			list=hdao.hsearch2(search);
		}
		else if(search!=null && rsctg==null)
		{
			list=hdao.hsearch2(search);
		}
		else if(search!=null && rsctg!=null)
		{
			list=hdao.hsearch(search, rsctg);
		}
		model.addAttribute("rctg",rctg);
		model.addAttribute("rsctg",rsctg);
		model.addAttribute("ctgname",ctgname);
		model.addAttribute("material",material);
		model.addAttribute("list",list);
		model.addAttribute("search",search);
		return "hfood/hfood";
	}

	@RequestMapping("/ctgreadnum")
	public String ctgreadnum(HttpServletRequest request)
	{
		String ctg=request.getParameter("ctg");
		HfoodDao hdao=sqlSession2.getMapper(HfoodDao.class);
		hdao.ctgreadnum(ctg);
		return "redirect:/hfood?ctg="+ctg;
	}
	
	@RequestMapping("/hreadnum")
	public String hreadnum(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		HfoodDao hdao=sqlSession2.getMapper(HfoodDao.class);
		hdao.hreadnum(id);
		return "redirect:/hcontent?id="+id;
	}
	
	
	@RequestMapping("/hcontent")
	public String hfood_content(HttpServletRequest request,Model model,HttpSession session)
	{
		String id=request.getParameter("id");
		HfoodDao hdao=sqlSession2.getMapper(HfoodDao.class);
		HfoodDto hdto=hdao.hcontent(id);
		Double havg=hdao.havg(id);
		Integer hreviewcnt=hdao.hreviewcnt(id);
		String userid=null;
		if(session.getAttribute("userid")!=null)
		{
			userid=session.getAttribute("userid").toString();
			Integer hlike=hdao.hlike(id, userid);
			model.addAttribute("hlike",hlike);
		}
		else
		{
			Integer hlike=null;
			model.addAttribute("hlike",hlike);
		}
		Integer likecnt=hdao.likecnt(id);
		int page_count=hdao.page_count(id);
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
		if(page%10==0)
		{
			pstart=pstart-1;
		}
		pstart=(pstart*10)+1;
		
		int pend=pstart+9;
		if(pend>page_count)
		{
			pend=page_count;
		}
		ArrayList<HreviewDto> hrlist=hdao.hrlist(id,index);
		model.addAttribute("hdto",hdto);
		model.addAttribute("hrlist",hrlist);
		model.addAttribute("havg",havg);
		model.addAttribute("hreviewcnt",hreviewcnt);
		model.addAttribute("likecnt",likecnt);
		model.addAttribute("page",page);
		model.addAttribute("page_count",page_count);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		return "hfood/hcontent";
	}
	
	@RequestMapping("/hreview_ok")
	public String hreview_ok(HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		String nickname=request.getParameter("nickname");
		String content=request.getParameter("content");
		int pid=Integer.parseInt(request.getParameter("pid"));
		int rating=Integer.parseInt(request.getParameter("rating"));
		HfoodDao hdao=sqlSession2.getMapper(HfoodDao.class);
		HreviewDto hrdto=new HreviewDto();
		hrdto.setUserid(userid);
		hrdto.setNickname(nickname);
		hrdto.setPid(pid);
		hrdto.setRating(rating);
		hrdto.setContent(content.replace("\r\n","<br>"));
		hdao.hreview_ok(hrdto);
		return "redirect:/hcontent?id="+pid;
	}
	
	@RequestMapping("/hupdate")
	public String hupdate(HttpServletRequest request,Model model)
	{
		String id=request.getParameter("id");
		HfoodDao hdao=sqlSession2.getMapper(HfoodDao.class);
		HreviewDto hrdto=hdao.hupdate(id);
		String content=hrdto.getContent();
		hrdto.setContent(content.replace("<br>","\r\n"));
		model.addAttribute("hrdto",hrdto);
		return "hfood/hupdate";
	}
	
	@RequestMapping("/hupdate_ok")
	public String hupdate_ok(HttpServletRequest request)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		String nickname=request.getParameter("nickname");
		String content=request.getParameter("content");
		int pid=Integer.parseInt(request.getParameter("pid"));
		int rating=Integer.parseInt(request.getParameter("rating"));
		HfoodDao hdao=sqlSession2.getMapper(HfoodDao.class);
		HreviewDto hrdto=new HreviewDto();
		hrdto.setNickname(nickname);
		hrdto.setPid(pid);
		hrdto.setRating(rating);
		hrdto.setContent(content.replace("\r\n","<br>"));
		hrdto.setId(id);
		hdao.hupdate_ok(hrdto);
		return "redirect:/hcontent?id="+pid;
	}
	
	@RequestMapping("/hdelete")
	public String hdelete(HttpServletRequest request)
	{
		String pid=request.getParameter("pid");
		String id=request.getParameter("id");
		HfoodDao hdao=sqlSession2.getMapper(HfoodDao.class);
		hdao.hdelete(id);
		return "redirect:/hcontent?id="+pid;
	}
	
	@RequestMapping("/hlike1")
	public void hlike1(HttpServletRequest request, PrintWriter out) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String pid = request.getParameter("pid");
		String userid = request.getParameter("userid");
		HfoodDao hdao = sqlSession2.getMapper(HfoodDao.class);
		hdao.hlike1(pid, userid);
		out.print("1");
	}
	   
	@RequestMapping("/hlike2")
	public void hlike2(HttpServletRequest request, PrintWriter out) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String pid = request.getParameter("pid");
		String userid = request.getParameter("userid");
		HfoodDao hdao = sqlSession2.getMapper(HfoodDao.class);
		hdao.hlike2(pid, userid);
		out.print("1");
	}

	
}
