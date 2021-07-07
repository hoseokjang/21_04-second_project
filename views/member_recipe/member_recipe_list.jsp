<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<style>
	#recipe {
	font-family: 'Noto Sans KR', sans-serif;
	}
	#recipe ul {
	list-style-type:none;
	padding-inline-start:0px;
	}
	#recipe ul li {
	display:inline-block;
	}
	#recipe .rcontainer {
	text-align:center;width:1140px;margin:auto;
	}
	#recipe .inner {
	display:inline-block;
	position:relative;
	}
	#hfood_box #hfood_cnt span{
	font-size:25px;
	color:#57c006;
	}
	#hfood_box #hfood_order {
	right:-400px;
	}
	#recipe #recipe_list ul {
	width:1100px;
	}
	#recipe #recipe_list ul li{
	height:400px;
	position:relative;
	padding:7px 12px 7px 12px;
	}
	#recipe #recipe_list .recipebox{
	text-align:center;
	width:245px;
	display:inline-block;
	position:absolute;
	left:12px;
	}
	#recipe #recipe_list a{
	text-decoration:none;
	color:black;
	}
	#recipe #recipe_list a:hover {
	text-decoration:underline; 
	}
	#recipe .recipename {
	font-size:14px;
	}
	a:hover {
		text-decoration:none;
	}
</style>
<div id="recipe">
<div id="recipe1" class="rcontainer" align="center">
	<div id="recipe_list_top">
		<div style="display:inline-block;"> <h3 style="color:#57c006">공유 레시피 게시판</h3> </div>
		<div style="color:#AAAAAA"> 회원님들만의 레시피와 노하우를 공유해보세요! </div>
	</div>
	<hr>
	<br>
	<div id="recipe_list">
	<c:set var="i" value="1"/>
		<ul>
		<c:forEach var="mrdto" items="${mrlist}">
			<li>
				<a href="member_readnum?mr_id=${mrdto.mr_id}">
					<img src="resources/img/mrecipe/${mrdto.fname0}" width="240" height="240"> <p>
					<div class="recipebox">
						<span class="recipename"><h5>${mrdto.name}</h5></span><p>
						<div>
							<span class="nickname">${mrdto.nickname}</span>
							<span style="color:#999999"> 조회수 ${mrdto.readnum}</span>
						</div>
						<img src="resources/img/star.PNG" width="20">
						<span> <span style="color:red">${mrdto.avg_rating}</span><span style="color:#666666"> / 5</span></span>
					</div>
				</a>
			</li>
		</c:forEach>
		</ul>
		<br>
			<div align="right">
				<span>
					<c:if test="${userid != null}">
						<a style="padding:5px; border:1px solid #57c006" href="member_recipe_write"> 레시피 작성 </a>
					</c:if>
				</span>
			</div>
		<br>
		<div id="page">
			<c:if test="${page>10}">
				<a href="member_recipe_list?page=${page-10}"> ≪ </a>
			</c:if>
			<c:if test="${page<=10}">
				<a href="member_recipe_list?page=1"> ≪ </a>
			</c:if>
			<c:if test="${page==1}">
				<a href="member_recipe_list?page=1"> ＜ </a>
			</c:if>
			<c:if test="${page!=1}">
				<a href="member_recipe_list?page=${page-1}"> ＜ </a>
			</c:if>
			<c:forEach begin="${pstart}" end="${pend}" var="p">
			<c:if test="${page==p}">
				<a href="member_recipe_list?page=${p}" style="color:#57c006;"> ${p}</a>
			</c:if>
			<c:if test="${page!=p}">
				<a href="member_recipe_list?page=${p}"> ${p}</a>
			</c:if>
			</c:forEach>
			<c:if test="${page!=pagecnt}">
				<a href="member_recipe_list?page=${page+1}"> ＞  </a>
			</c:if>
			<c:if test="${page==pagecnt}">
				<a href="member_recipe_list?page=${pagecnt}"> ＞  </a>
			</c:if>
			<c:if test="${page<=pagecnt-10}">
				<a href="member_recipe_list?page=${page+10}"> ≫  </a>
			</c:if>
			<c:if test="${page>pagecnt-10}">
				<a href="member_recipe_list?page=${pagecnt}"> ≫  </a>
			</c:if>
		</div>
	</div>
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<c:import url="../bottom.jsp"/>