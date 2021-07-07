package kr.co.life.member.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.life.hfood.dto.HfoodDto;
import kr.co.life.member.dao.MemberDao;
import kr.co.life.member.dto.MemberDto;
import kr.co.life.recipe.dto.RecipeDto;

@Controller
public class MemberController {
   @Autowired
   private SqlSession sqlSession4;
   
   @RequestMapping("login")
   public String login(HttpServletRequest request, Model model)
   {
	   model.addAttribute("chk",request.getParameter("chk"));
	   return "/member/login";
   }
   
   @RequestMapping("/login_ok")
   public String login_ok(MemberDto mdto,HttpSession session)
   {
	   MemberDao mdao=sqlSession4.getMapper(MemberDao.class);
	   MemberDto mdto2=mdao.login_ok(mdto);
	   
	   if(mdto2 == null) // 
	   {
		   
		   return "redirect:/login?chk=1";
	   }
	   else // 
	   {
		   session.setAttribute("userid", mdto2.getUserid());
		   session.setAttribute("nickname", mdto2.getNickname());
		   session.setAttribute("mstate", mdto2.getMstate());
		   
		   return "redirect:/";
	   }
   }
   
   @RequestMapping("pwd_search")
   public String pwd_search(HttpServletRequest request, Model model)
   {
	   model.addAttribute("chk",request.getParameter("chk"));
	   return "/member/pwd_search";
   }   
   
   @RequestMapping("pwd_search_ok")
   public String pwd_search_ok(Model model, HttpServletRequest request, MemberDto mdto)
   {
	   MemberDao mdao=sqlSession4.getMapper(MemberDao.class);
	   MemberDto mdto2=mdao.pwd_search_ok(mdto);
	   model.addAttribute("mdto", mdto2);
	   
	   if(mdto2 == null) // 
	   {
		   return "redirect:/pwd_search?chk=1";
	   }
	   else
	   {
		   return "member/pwd_search_ok";
	   }   
   }   
   
   @RequestMapping("/pwd_sendmail")
	public String email_send(HttpServletRequest request) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String email=request.getParameter("email");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		MailSend ms=MailSend.getInstance();
		ms.setEmail(email, title, content);
		
		return "redirect:/login?chk=2";
	}
   
   
   @RequestMapping("logout")
   public String logout(HttpSession session)
   {
	   session.invalidate();
	   return "redirect:/";
   }
   
   @RequestMapping("/admin_page")
   public String admin_page(HttpSession session)
   {
	   if(session.getAttribute("mstate").equals(3))
//	   if(session.getAttribute("userid").equals("admin"))
	   {
		   return "/member/admin_page";
	   }
	   else
	   {
		   return "/member/login";
	   }   

   }

   @RequestMapping("/member_list")
   public String member_list(Model model,HttpSession session)
   {	
	   if(session.getAttribute("mstate").equals(3))
//	   if(session.getAttribute("userid").equals("admin"))
	   {
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   ArrayList<MemberDto> mlist = mdao.member_list();
		   model.addAttribute("mlist", mlist);
		   		   
		   return "/member/member_list";
	   }
	   else
	   {   
		   return "/member/login";
	   }   
   }
   
   @RequestMapping("/admin_list")
   public String admin_list(Model model,HttpSession session)
   {	
	   if(session.getAttribute("mstate").equals(3))
//	   if(session.getAttribute("userid").equals("admin"))
	   {
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   ArrayList<MemberDto> mlist = mdao.admin_list();
		   model.addAttribute("mlist", mlist);
		   
		   return "/member/admin_list";
	   }
	   else
	   {   
		   return "/member/login";
	   }   
   }
   @RequestMapping("/mem_state") //회원정지, 회원강퇴
   public String mem_state(HttpSession session, MemberDto mdto)
   {	
	   if(session.getAttribute("mstate").equals(3))
	   {	
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   mdao.mem_state(mdto);
		   return "redirect:/member_list";
	   }
	   else
	   {   
		   return "/member/login";
	   }   
   }

   @RequestMapping("/adm_state") //관리자 정지, 관리자복원
   public String adm_state(HttpSession session, MemberDto mdto)
   {	
	   if(session.getAttribute("mstate").equals(3))
	   {	
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   mdao.mem_state(mdto);
		   return "redirect:/admin_list";
	   }
	   else
	   {   
		   return "/member/login";
	   }   
   }

   @RequestMapping("/mem_out")  //회원탈퇴
   public String mem_out(HttpSession session, MemberDto mdto)
   {	
	   if(session.getAttribute("mstate").equals(0))
	   {	
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   mdao.mem_state(mdto);
		   session.invalidate();
		   return "redirect:/";
	   }
	   else
	   {   
		   return "/member/login";
	   }   
   }
   
   @RequestMapping("/member_only")
   public String member_only(HttpSession session)
   {
	   if(session.getAttribute("userid") == null)
	   {
		   return "redirect:/login?chk=2"; 
	   }
	   else
	   {
		   return "/member/member_only";
	   }
	   
   }
   
   @RequestMapping("/mypage")
   public String mypage( Model model, HttpSession session, HttpServletRequest request )
   {
	   if(session.getAttribute("userid") != null)
	   {
		   String userid = (String)session.getAttribute("userid");
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   MemberDto mdto = mdao.mypage(userid);
		   model.addAttribute("mdto", mdto);
		   return "/member/mypage";
	   }
	   else
	   {
	
		   return "/member/index" ;
	   }
   }
   
   @RequestMapping("/myupdate")
   public String myupdate( Model model, HttpSession session, HttpServletRequest request )
   {
	   if(session.getAttribute("userid") != null)
	   {
		   String userid = (String)session.getAttribute("userid");
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   MemberDto mdto = mdao.mypage(userid);
		   model.addAttribute("mdto", mdto);
		   return "/member/myupdate";
	   }
	   else
	   {
	
		   return "/member/mypage" ;
	   }
   }
   
   
   @RequestMapping("/myupdate_ok")
   public String myupdate_ok( MemberDto mdto, HttpSession session)
   {
	   if(session.getAttribute("userid") != null)
	   {
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   mdao.myupdate_ok(mdto);

		   return "redirect:/mypage";
	   }
	   else
	   {   
		   return "/member/myupdate"; 
	   }
   }
    
   @RequestMapping("/mypage_test")
   public String mypage_test(Model model)
   {
		   String userid = "super";
		   MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		   MemberDto mdto = mdao.mypage(userid);
		   model.addAttribute("mdto", mdto);
		   return "/member/mypage_test";
   }
   
   
   @RequestMapping("/mypage_ok")
   public String content_ok()
   {
	   
	   return "/member/mypage";
   }
   
   @RequestMapping("/member")
   public String member()
   {
	   return "/member/member";
   }
   
	@RequestMapping("/member_ok")
	public void member_ok(MemberDto mdto,HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws Exception 
	{
		out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String userid = request.getParameter("userid");
		MemberDao mdao= sqlSession4.getMapper(MemberDao.class);
		Integer c = mdao.userid_check(userid);
		if(c==1)
		{
			out.println("<script charset='utf-8'>alert('이미 사용중인 아이디 입니다.'); history.back();</script>");
		}
		else
		{
			mdao.member_ok(mdto);
			out.println("<script>location.href='/life/main;' </script>");
		}
	}
   
   @RequestMapping("/userid_check") //아작스에서 userid 가 존재하는지 확인할 때 호출
   public void userid_check(HttpServletRequest request,PrintWriter out)
   {
	   String userid=request.getParameter("userid");
	   MemberDao mdao=sqlSession4.getMapper(MemberDao.class);
	   Integer chk=mdao.userid_check(userid);
	   out.print(chk);  
   }
   
   @RequestMapping("/mypage_like")
	public String mrecipe_list(HttpSession session, Model model) {
		MemberDao mdao = sqlSession4.getMapper(MemberDao.class);
		String userid = session.getAttribute("userid").toString();
		ArrayList<RecipeDto> r_like_list = mdao.r_like_list(userid);
		ArrayList<HfoodDto> h_like_list = mdao.h_like_list(userid);
		model.addAttribute("r_like_list", r_like_list);
		model.addAttribute("h_like_list", h_like_list);
		return "/member/mypage_like";
	}
}
