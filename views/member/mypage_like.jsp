<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<style>
#mypage_like {
	font-family: 'Noto Sans KR', sans-serif;
	
	margin:auto;
	width:1200px;
	}
#mypage_like ul {
	list-style-type:none;
	padding-inline-start:0px;
	}
#mypage_like ul li {
	display:inline-block;
	width:390px;
	height:280px;
	}
#mypage_rlike {text-align:center;width:100%;height:350px;padding-top:10px;}
#mypage_hlike {text-align:center;width:100%;height:350px;padding-top:10px;}
</style>
<script>

</script>
<div id="mypage_like">
<h3 style="display:inline-block">좋아요</h3> <img src="resources/img/heart2.PNG" style="display:inline-block" width="30px">
<p>
<div id="mypage_rlike">
	<div id="rlike_top">
		<span style="display:inline-block"> <h4>레시피</h4> </span> <span style="color:#CCCCCC"></span>
	</div>
	<br>
	<div id="rlike_list">
		<ul>
			<c:forEach var="r_like" items="${r_like_list}">
			<li>
				<a href="recipe_detail?recipe_code=${r_like.recipecode}">
					<img src="resources/img/recipe/${r_like.recipecode}.jpg" width="50%" height="140px">
					<p>${r_like.name}</p>
				</a>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
<br>
<hr>
<br>
<div id="mypage_hlike">
	<div id="hlike_top">
		<span style="display:inline-block"> <h4>건강기능식품</h4> </span> <span style="color:#CCCCCC"></span>
	</div>
	<div id="hlike_list">
		<ul>
			<c:forEach var="h_like" items="${h_like_list}">
			<li>
				<a href="hcontent?id=${h_like.id}" style="display:inline-block;">
					<img src="resources/img/hfood/${h_like.productid}.jpg" width="200px">
					<p>${h_like.name}</p>
				</a>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
</div>
<br><br><br>
<c:import url="../bottom.jsp"/>