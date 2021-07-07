package kr.co.life.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.life.recipe.dao.MemberRecipeDao;
import kr.co.life.recipe.dto.MRReviewDto;
import kr.co.life.recipe.dto.MemberRecipeDto;

@Controller
public class MemberRecipeController {
	@Autowired
	private SqlSession sqlSession5;
	
	@RequestMapping("/member_recipe")
	public String mrecipe_list() {
		return "/member_recipe/member_recipe_list";
	}
	
	@RequestMapping("/member_recipe_write")
	public String mrecipe_write() {
		return "/member_recipe/member_recipe_write";
	}
	
	@RequestMapping("/member_recipe_write_ok")
	public String write_ok(HttpServletRequest request) throws IOException {
		String path = request.getRealPath("resources/img/mrecipe");
		System.out.println(path);
		int max = 1024*1024*10;
		MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());
		String name = multi.getParameter("rname");
		String nickname = multi.getParameter("nickname");
		String detail = multi.getParameter("rdetail");
		String inbun = multi.getParameter("inbun");
		String time = multi.getParameter("time");
		String diff = multi.getParameter("diff");
		String ingrename_1 = multi.getParameter("ingrename_1"); String ingrequan_1 = multi.getParameter("ingrequan_1");
		String ingrename_2 = multi.getParameter("ingrename_2"); String ingrequan_2 = multi.getParameter("ingrequan_2");
		String ingrename_3 = multi.getParameter("ingrename_3"); String ingrequan_3 = multi.getParameter("ingrequan_3");
		String ingrename_4 = multi.getParameter("ingrename_4"); String ingrequan_4 = multi.getParameter("ingrequan_4");
		String ingrename_5 = multi.getParameter("ingrename_5"); String ingrequan_5 = multi.getParameter("ingrequan_5");
		String ingrename_6 = multi.getParameter("ingrename_6"); String ingrequan_6 = multi.getParameter("ingrequan_6");
		String ingrename_7 = multi.getParameter("ingrename_7"); String ingrequan_7 = multi.getParameter("ingrequan_7");
		String ingrename_8 = multi.getParameter("ingrename_8"); String ingrequan_8 = multi.getParameter("ingrequan_8");
		String ingrename_9 = multi.getParameter("ingrename_9"); String ingrequan_9 = multi.getParameter("ingrequan_9");
		String ingrename_10 = multi.getParameter("ingrename_10"); String ingrequan_10 = multi.getParameter("ingrequan_10");
		String ingrename_11 = multi.getParameter("ingrename_11"); String ingrequan_11 = multi.getParameter("ingrequan_11");
		String ingrename_12 = multi.getParameter("ingrename_12"); String ingrequan_12 = multi.getParameter("ingrequan_12");
		String ingrename_13 = multi.getParameter("ingrename_13"); String ingrequan_13 = multi.getParameter("ingrequan_13");
		String ingrename_14 = multi.getParameter("ingrename_14"); String ingrequan_14 = multi.getParameter("ingrequan_14");
		String ingrename_15 = multi.getParameter("ingrename_15"); String ingrequan_15 = multi.getParameter("ingrequan_15");
		String ingrename_16 = multi.getParameter("ingrename_16"); String ingrequan_16 = multi.getParameter("ingrequan_16");
		String ingrename_17 = multi.getParameter("ingrename_17"); String ingrequan_17 = multi.getParameter("ingrequan_17");
		String ingrename_18 = multi.getParameter("ingrename_18"); String ingrequan_18 = multi.getParameter("ingrequan_18");
		String ingrename_19 = multi.getParameter("ingrename_19"); String ingrequan_19 = multi.getParameter("ingrequan_19");
		String ingrename_20 = multi.getParameter("ingrename_20"); String ingrequan_20 = multi.getParameter("ingrequan_20");
		String step_1 = multi.getParameter("step_1"); String step_2 = multi.getParameter("step_2");
		String step_3 = multi.getParameter("step_3"); String step_4 = multi.getParameter("step_4");
		String step_5 = multi.getParameter("step_5"); String step_6 = multi.getParameter("step_6");
		String step_7 = multi.getParameter("step_7"); String step_8 = multi.getParameter("step_8");
		String step_9 = multi.getParameter("step_9"); String step_10 = multi.getParameter("step_10");
		String step_11 = multi.getParameter("step_11"); String step_12 = multi.getParameter("step_12");
		String step_13 = multi.getParameter("step_13"); String step_14 = multi.getParameter("step_14");
		String step_15 = multi.getParameter("step_15"); String step_16 = multi.getParameter("step_16");
		String step_17 = multi.getParameter("step_17"); String step_18 = multi.getParameter("step_18");
		String step_19 = multi.getParameter("step_19"); String step_20 = multi.getParameter("step_20");
		String tip = multi.getParameter("tip");
		String fname0 = multi.getFilesystemName("fname0"); String fname1 = multi.getFilesystemName("fname1");
		String fname2 = multi.getFilesystemName("fname2"); String fname3 = multi.getFilesystemName("fname3");
		String fname4 = multi.getFilesystemName("fname4"); String fname5 = multi.getFilesystemName("fname5");
		String fname6 = multi.getFilesystemName("fname6"); String fname7 = multi.getFilesystemName("fname7");
		String fname8 = multi.getFilesystemName("fname8"); String fname9 = multi.getFilesystemName("fname9");
		String fname10 = multi.getFilesystemName("fname10"); String fname11 = multi.getFilesystemName("fname11");
		String fname12 = multi.getFilesystemName("fname12"); String fname13 = multi.getFilesystemName("fname13");
		String fname14 = multi.getFilesystemName("fname14"); String fname15 = multi.getFilesystemName("fname15");
		String fname16 = multi.getFilesystemName("fname16"); String fname17 = multi.getFilesystemName("fname17");
		String fname18 = multi.getFilesystemName("fname18"); String fname19 = multi.getFilesystemName("fname19");
		String fname20 = multi.getFilesystemName("fname20");
		MemberRecipeDto mrdto = new MemberRecipeDto();
		mrdto.setName(name);
		mrdto.setNickname(nickname);
		mrdto.setDetail(detail);
		mrdto.setInbun(inbun);
		mrdto.setTime(time);
		mrdto.setDiff(diff);
		mrdto.setIngrename_1(ingrename_1); mrdto.setIngrequan_1(ingrequan_1);
		mrdto.setIngrename_2(ingrename_2); mrdto.setIngrequan_2(ingrequan_2);
		mrdto.setIngrename_3(ingrename_3); mrdto.setIngrequan_3(ingrequan_3);
		mrdto.setIngrename_4(ingrename_4); mrdto.setIngrequan_4(ingrequan_4);
		mrdto.setIngrename_5(ingrename_5); mrdto.setIngrequan_5(ingrequan_5);
		mrdto.setIngrename_6(ingrename_6); mrdto.setIngrequan_6(ingrequan_6);
		mrdto.setIngrename_7(ingrename_7); mrdto.setIngrequan_7(ingrequan_7);
		mrdto.setIngrename_8(ingrename_8); mrdto.setIngrequan_8(ingrequan_8);
		mrdto.setIngrename_9(ingrename_9); mrdto.setIngrequan_9(ingrequan_9);
		mrdto.setIngrename_10(ingrename_10); mrdto.setIngrequan_10(ingrequan_10);
		mrdto.setIngrename_11(ingrename_11); mrdto.setIngrequan_11(ingrequan_11);
		mrdto.setIngrename_12(ingrename_12); mrdto.setIngrequan_12(ingrequan_12);
		mrdto.setIngrename_13(ingrename_13); mrdto.setIngrequan_13(ingrequan_13);
		mrdto.setIngrename_14(ingrename_14); mrdto.setIngrequan_14(ingrequan_14);
		mrdto.setIngrename_15(ingrename_15); mrdto.setIngrequan_15(ingrequan_15);
		mrdto.setIngrename_16(ingrename_16); mrdto.setIngrequan_16(ingrequan_16);
		mrdto.setIngrename_17(ingrename_17); mrdto.setIngrequan_17(ingrequan_17);
		mrdto.setIngrename_18(ingrename_18); mrdto.setIngrequan_18(ingrequan_18);
		mrdto.setIngrename_19(ingrename_19); mrdto.setIngrequan_19(ingrequan_19);
		mrdto.setIngrename_20(ingrename_20); mrdto.setIngrequan_20(ingrequan_20);
		mrdto.setStep_1(step_1); mrdto.setStep_2(step_2); mrdto.setStep_3(step_3); mrdto.setStep_4(step_4); mrdto.setStep_5(step_5);
		mrdto.setStep_6(step_6); mrdto.setStep_7(step_7); mrdto.setStep_8(step_8); mrdto.setStep_9(step_9); mrdto.setStep_10(step_10);
		mrdto.setStep_11(step_11); mrdto.setStep_12(step_12); mrdto.setStep_13(step_13); mrdto.setStep_14(step_14); mrdto.setStep_15(step_15);
		mrdto.setStep_16(step_16); mrdto.setStep_17(step_17); mrdto.setStep_18(step_18); mrdto.setStep_19(step_19); mrdto.setStep_20(step_20);
		mrdto.setTip(tip);
		mrdto.setFname0(fname0); mrdto.setFname1(fname1); mrdto.setFname2(fname2); mrdto.setFname3(fname3); mrdto.setFname4(fname4);
		mrdto.setFname5(fname5); mrdto.setFname6(fname6); mrdto.setFname7(fname7); mrdto.setFname8(fname8); mrdto.setFname9(fname9);
		mrdto.setFname10(fname10); mrdto.setFname11(fname11); mrdto.setFname12(fname12); mrdto.setFname13(fname13);
		mrdto.setFname14(fname14); mrdto.setFname15(fname15); mrdto.setFname16(fname16); mrdto.setFname17(fname17);
		mrdto.setFname18(fname18); mrdto.setFname19(fname19); mrdto.setFname20(fname20);
		MemberRecipeDao mrdao = sqlSession5.getMapper(MemberRecipeDao.class);
		mrdao.write_ok(mrdto);
		return "redirect:/member_recipe_list";
	}
	
	@RequestMapping("/member_readnum")
	public String mreadnum(HttpServletRequest request) {
		String mr_id = request.getParameter("mr_id");
		MemberRecipeDao mrdao = sqlSession5.getMapper(MemberRecipeDao.class);
		mrdao.mreadnum(mr_id);
		return "redirect:/member_recipe_detail?mr_id="+mr_id;
	}
	
	@RequestMapping("/member_recipe_detail")
	public String detail(Model model, HttpServletRequest request) {
		String mr_id = request.getParameter("mr_id");
		MemberRecipeDao mrdao = sqlSession5.getMapper(MemberRecipeDao.class);
		MemberRecipeDto mrdto = mrdao.detail(mr_id);
		model.addAttribute("mrdto", mrdto);
		ArrayList<MRReviewDto> review_list = mrdao.review_list(mr_id);
		model.addAttribute("review_list", review_list);
		return "/member_recipe/member_recipe_detail";
	}
	
	@RequestMapping("/member_recipe_list")
	public String list(Model model, HttpServletRequest request) {
		MemberRecipeDao mrdao = sqlSession5.getMapper(MemberRecipeDao.class);
		Integer pagecnt = mrdao.get_pagecnt();
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

		ArrayList<MemberRecipeDto> mrlist = mrdao.list(index);
		model.addAttribute("mrlist", mrlist);
		return "/member_recipe/member_recipe_list";
	}
	
	@RequestMapping("/member_recipe_delete")
	public String delete(HttpServletRequest request) {
		MemberRecipeDao mrdao = sqlSession5.getMapper(MemberRecipeDao.class);
		int mr_id = Integer.parseInt(request.getParameter("mr_id"));
		mrdao.delete(mr_id);
		return "redirect:/member_recipe_list";
	}
	
	@RequestMapping("/member_recipe_update")
	public String update(HttpServletRequest request, Model model) {
		String mr_id = request.getParameter("mr_id");
		MemberRecipeDao mrdao = sqlSession5.getMapper(MemberRecipeDao.class);
		MemberRecipeDto mrdto = mrdao.detail(mr_id);
		model.addAttribute("mrdto", mrdto);
		return "/member_recipe/member_recipe_update";
	}
	
	@RequestMapping("/member_recipe_update_ok")
	public String update_ok(HttpServletRequest request) throws IOException {
		String path = request.getRealPath("resources/img/mrecipe");
		System.out.println(path);
		int max = 1024*1024*10;
		MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());
		int mr_id = Integer.parseInt(multi.getParameter("mr_id"));
		String name = multi.getParameter("rname");
		String detail = multi.getParameter("rdetail");
		String inbun = multi.getParameter("inbun");
		String time = multi.getParameter("time");
		String diff = multi.getParameter("diff");
		String ingrename_1 = multi.getParameter("ingrename_1"); String ingrequan_1 = multi.getParameter("ingrequan_1");
		String ingrename_2 = multi.getParameter("ingrename_2"); String ingrequan_2 = multi.getParameter("ingrequan_2");
		String ingrename_3 = multi.getParameter("ingrename_3"); String ingrequan_3 = multi.getParameter("ingrequan_3");
		String ingrename_4 = multi.getParameter("ingrename_4"); String ingrequan_4 = multi.getParameter("ingrequan_4");
		String ingrename_5 = multi.getParameter("ingrename_5"); String ingrequan_5 = multi.getParameter("ingrequan_5");
		String ingrename_6 = multi.getParameter("ingrename_6"); String ingrequan_6 = multi.getParameter("ingrequan_6");
		String ingrename_7 = multi.getParameter("ingrename_7"); String ingrequan_7 = multi.getParameter("ingrequan_7");
		String ingrename_8 = multi.getParameter("ingrename_8"); String ingrequan_8 = multi.getParameter("ingrequan_8");
		String ingrename_9 = multi.getParameter("ingrename_9"); String ingrequan_9 = multi.getParameter("ingrequan_9");
		String ingrename_10 = multi.getParameter("ingrename_10"); String ingrequan_10 = multi.getParameter("ingrequan_10");
		String ingrename_11 = multi.getParameter("ingrename_11"); String ingrequan_11 = multi.getParameter("ingrequan_11");
		String ingrename_12 = multi.getParameter("ingrename_12"); String ingrequan_12 = multi.getParameter("ingrequan_12");
		String ingrename_13 = multi.getParameter("ingrename_13"); String ingrequan_13 = multi.getParameter("ingrequan_13");
		String ingrename_14 = multi.getParameter("ingrename_14"); String ingrequan_14 = multi.getParameter("ingrequan_14");
		String ingrename_15 = multi.getParameter("ingrename_15"); String ingrequan_15 = multi.getParameter("ingrequan_15");
		String ingrename_16 = multi.getParameter("ingrename_16"); String ingrequan_16 = multi.getParameter("ingrequan_16");
		String ingrename_17 = multi.getParameter("ingrename_17"); String ingrequan_17 = multi.getParameter("ingrequan_17");
		String ingrename_18 = multi.getParameter("ingrename_18"); String ingrequan_18 = multi.getParameter("ingrequan_18");
		String ingrename_19 = multi.getParameter("ingrename_19"); String ingrequan_19 = multi.getParameter("ingrequan_19");
		String ingrename_20 = multi.getParameter("ingrename_20"); String ingrequan_20 = multi.getParameter("ingrequan_20");
		String step_1 = multi.getParameter("step_1"); String step_2 = multi.getParameter("step_2");
		String step_3 = multi.getParameter("step_3"); String step_4 = multi.getParameter("step_4");
		String step_5 = multi.getParameter("step_5"); String step_6 = multi.getParameter("step_6");
		String step_7 = multi.getParameter("step_7"); String step_8 = multi.getParameter("step_8");
		String step_9 = multi.getParameter("step_9"); String step_10 = multi.getParameter("step_10");
		String step_11 = multi.getParameter("step_11"); String step_12 = multi.getParameter("step_12");
		String step_13 = multi.getParameter("step_13"); String step_14 = multi.getParameter("step_14");
		String step_15 = multi.getParameter("step_15"); String step_16 = multi.getParameter("step_16");
		String step_17 = multi.getParameter("step_17"); String step_18 = multi.getParameter("step_18");
		String step_19 = multi.getParameter("step_19"); String step_20 = multi.getParameter("step_20");
		String tip = multi.getParameter("tip");
		String fname0 = multi.getFilesystemName("fname0"); String fname1 = multi.getFilesystemName("fname1");
		String fname2 = multi.getFilesystemName("fname2"); String fname3 = multi.getFilesystemName("fname3");
		String fname4 = multi.getFilesystemName("fname4"); String fname5 = multi.getFilesystemName("fname5");
		String fname6 = multi.getFilesystemName("fname6"); String fname7 = multi.getFilesystemName("fname7");
		String fname8 = multi.getFilesystemName("fname8"); String fname9 = multi.getFilesystemName("fname9");
		String fname10 = multi.getFilesystemName("fname10"); String fname11 = multi.getFilesystemName("fname11");
		String fname12 = multi.getFilesystemName("fname12"); String fname13 = multi.getFilesystemName("fname13");
		String fname14 = multi.getFilesystemName("fname14"); String fname15 = multi.getFilesystemName("fname15");
		String fname16 = multi.getFilesystemName("fname16"); String fname17 = multi.getFilesystemName("fname17");
		String fname18 = multi.getFilesystemName("fname18"); String fname19 = multi.getFilesystemName("fname19");
		String fname20 = multi.getFilesystemName("fname20");
		MemberRecipeDto mrdto = new MemberRecipeDto();
		mrdto.setMr_id(mr_id);
		mrdto.setName(name);
		mrdto.setDetail(detail);
		mrdto.setInbun(inbun);
		mrdto.setTime(time);
		mrdto.setDiff(diff);
		mrdto.setIngrename_1(ingrename_1); mrdto.setIngrequan_1(ingrequan_1);
		mrdto.setIngrename_2(ingrename_2); mrdto.setIngrequan_2(ingrequan_2);
		mrdto.setIngrename_3(ingrename_3); mrdto.setIngrequan_3(ingrequan_3);
		mrdto.setIngrename_4(ingrename_4); mrdto.setIngrequan_4(ingrequan_4);
		mrdto.setIngrename_5(ingrename_5); mrdto.setIngrequan_5(ingrequan_5);
		mrdto.setIngrename_6(ingrename_6); mrdto.setIngrequan_6(ingrequan_6);
		mrdto.setIngrename_7(ingrename_7); mrdto.setIngrequan_7(ingrequan_7);
		mrdto.setIngrename_8(ingrename_8); mrdto.setIngrequan_8(ingrequan_8);
		mrdto.setIngrename_9(ingrename_9); mrdto.setIngrequan_9(ingrequan_9);
		mrdto.setIngrename_10(ingrename_10); mrdto.setIngrequan_10(ingrequan_10);
		mrdto.setIngrename_11(ingrename_11); mrdto.setIngrequan_11(ingrequan_11);
		mrdto.setIngrename_12(ingrename_12); mrdto.setIngrequan_12(ingrequan_12);
		mrdto.setIngrename_13(ingrename_13); mrdto.setIngrequan_13(ingrequan_13);
		mrdto.setIngrename_14(ingrename_14); mrdto.setIngrequan_14(ingrequan_14);
		mrdto.setIngrename_15(ingrename_15); mrdto.setIngrequan_15(ingrequan_15);
		mrdto.setIngrename_16(ingrename_16); mrdto.setIngrequan_16(ingrequan_16);
		mrdto.setIngrename_17(ingrename_17); mrdto.setIngrequan_17(ingrequan_17);
		mrdto.setIngrename_18(ingrename_18); mrdto.setIngrequan_18(ingrequan_18);
		mrdto.setIngrename_19(ingrename_19); mrdto.setIngrequan_19(ingrequan_19);
		mrdto.setIngrename_20(ingrename_20); mrdto.setIngrequan_20(ingrequan_20);
		mrdto.setStep_1(step_1); mrdto.setStep_2(step_2); mrdto.setStep_3(step_3); mrdto.setStep_4(step_4); mrdto.setStep_5(step_5);
		mrdto.setStep_6(step_6); mrdto.setStep_7(step_7); mrdto.setStep_8(step_8); mrdto.setStep_9(step_9); mrdto.setStep_10(step_10);
		mrdto.setStep_11(step_11); mrdto.setStep_12(step_12); mrdto.setStep_13(step_13); mrdto.setStep_14(step_14); mrdto.setStep_15(step_15);
		mrdto.setStep_16(step_16); mrdto.setStep_17(step_17); mrdto.setStep_18(step_18); mrdto.setStep_19(step_19); mrdto.setStep_20(step_20);
		mrdto.setTip(tip);
		mrdto.setFname0(fname0); mrdto.setFname1(fname1); mrdto.setFname2(fname2); mrdto.setFname3(fname3); mrdto.setFname4(fname4);
		mrdto.setFname5(fname5); mrdto.setFname6(fname6); mrdto.setFname7(fname7); mrdto.setFname8(fname8); mrdto.setFname9(fname9);
		mrdto.setFname10(fname10); mrdto.setFname11(fname11); mrdto.setFname12(fname12); mrdto.setFname13(fname13);
		mrdto.setFname14(fname14); mrdto.setFname15(fname15); mrdto.setFname16(fname16); mrdto.setFname17(fname17);
		mrdto.setFname18(fname18); mrdto.setFname19(fname19); mrdto.setFname20(fname20);
		MemberRecipeDao mrdao = sqlSession5.getMapper(MemberRecipeDao.class);
		/*String pwd = mrdao.get_pwd(mrdto.getMr_id());
		if(mrdto.getPwd().equals(pwd)) {
			mrdao.update(mrdto);
			return "redirect:/content?mr_id="+mrdto.getMr_id();
		}
		else
			return "redirect:/update?chk=1&mr_id="+mrdto.getMr_id();*/
		mrdao.update_ok(mrdto);
		return "redirect:/member_recipe_detail?mr_id="+mr_id;
	}
}
