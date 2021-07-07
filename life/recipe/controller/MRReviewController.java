package kr.co.life.recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.life.recipe.dao.MRReviewDao;
import kr.co.life.recipe.dto.MRReviewDto;

@Controller
public class MRReviewController {
	@Autowired
	private SqlSession sqlSession5;
	
	@RequestMapping("/mrreview_write")
	public String mrreview_write_ok(HttpServletRequest request, HttpSession session) throws IOException {
		String path = request.getRealPath("resources/img/mrreview");
		System.out.println(path);
		int max = 1024*1024*10;
		MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());
		String nickname = multi.getParameter("nickname");
		String fname = multi.getFilesystemName("fname");
		String content = multi.getParameter("mrreview_write");
		int rating = Integer.parseInt(multi.getParameter("rating"));
		int mr_id = Integer.parseInt(multi.getParameter("mr_id"));
		MRReviewDto mrrdto = new MRReviewDto();
		mrrdto.setNickname(nickname);
		mrrdto.setContent(content);
		mrrdto.setFname(fname);
		mrrdto.setRating(rating);
		mrrdto.setMr_id(mr_id);
		MRReviewDao mrrdao = sqlSession5.getMapper(MRReviewDao.class);
		mrrdao.write_ok(mrrdto);
		mrrdao.setRating(mr_id);
		return "redirect:/member_recipe_detail?mr_id="+mr_id;
	}
	
	@RequestMapping("/mrreview_delete")
	public String mrreview_delete(HttpServletRequest request) {
		MRReviewDao mrrdao = sqlSession5.getMapper(MRReviewDao.class);
		int mr_id = Integer.parseInt(request.getParameter("mr_id"));
		int id = Integer.parseInt(request.getParameter("id"));
		mrrdao.delete(id);
		mrrdao.setRating(mr_id);
		return "redirect:/member_recipe_detail?mr_id="+mr_id;
	}
	
	@RequestMapping("/mrreview_update")
	public void mrreview_update(HttpServletRequest request, Model model, PrintWriter out) {
		MRReviewDao mrrdao = sqlSession5.getMapper(MRReviewDao.class);
		int id = Integer.parseInt(request.getParameter("id"));
		MRReviewDto mrrdto = mrrdao.update(id);
		model.addAttribute("mrrdto", mrrdto);
		out.print("1");
	}
	
	@RequestMapping("/mrreview_update_ok")
	public String mrreview_update_ok(HttpServletRequest request, HttpSession session) throws IOException {
		String path = request.getRealPath("resources/img/mrreview");
		System.out.println(path);
		int max = 1024*1024*10;
		MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());
		int mr_id = Integer.parseInt(multi.getParameter("mr_id"));
		int id = Integer.parseInt(multi.getParameter("review_id"));
		String fname = multi.getFilesystemName("fname_update");
		String content = multi.getParameter("mrreview_write_update");
		int rating = Integer.parseInt(multi.getParameter("rating_update"));
		MRReviewDto mrrdto = new MRReviewDto();
		mrrdto.setId(id);
		mrrdto.setContent(content);
		mrrdto.setFname(fname);
		mrrdto.setRating(rating);
		MRReviewDao mrrdao = sqlSession5.getMapper(MRReviewDao.class);
		mrrdao.update_ok(mrrdto);
		mrrdao.setRating(mr_id);
		return "redirect:/member_recipe_detail?mr_id="+mr_id;
	}
}
