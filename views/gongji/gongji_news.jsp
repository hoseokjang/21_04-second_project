<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" href="resources/css/gongji.css" type="text/css">


<script>

</script>

</head>
<div align="center">
	<h3>건강뉴스</h3>
	<hr>
</div>
<div class="sub_bg" style="left:200px">
	<div class="contents_area">
		<c:forEach var="gndto" items="${news_list}">
			<div>
				<ul class="head">
					<li class="menu"><a href="${gndto.link}" style="color:black">${gndto.title}</a>
				</ul>
			</div>
			<br>
		</c:forEach>

		<div class="page_index">
			<!-- 이전 페이지 이동 -->
			<!-- 10페이지 이전 이동 -->
			<c:if test="${pstart!= 1}">
				<a href="gongji_news?page=${pstart-1}"> << </a>
			</c:if>
			<c:if test="${pstart==1}}">
			  <<
			 </c:if>
			<!-- 10페이지 이전 이동 끝-->
			<!-- 1페이지 이전 이동 (현재페이지에서 1페이지 이전)-->
			<c:if test="${page>1}">
				<a href="gongji_news?page=${page-1}"> < </a>
			</c:if>
			<c:if test="${page == 1}">
				 <
			</c:if>
			<!-- 1페이지 이전 이동 끝-->

			<!-- 이전 페이지 이동  끝-->
			<c:forEach begin="${pstart}" end="${pend}" var="i">
				<c:if test="${page==i}">
					<a href="gongji_news?page=${i}" style="color: red"> ${i} </a>
				</c:if>
				<c:if test="${page!=i}">
					<a href="gongji_news?page=${i}"> ${i} </a>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지 이동 -->
			<!-- 다음 1페이지 이동 -->
			<c:if test="${page != pagecnt}">
				<a href="gongji_news?page=${page+1}"> > </a>
			</c:if>
			<c:if test="${page == pagecnt}">
				 >
			</c:if>
			<!-- 다음 1페이지 이동 끝-->

			<!-- 다음 10페이지 이동 -->
			<c:if test="${pend != pagecnt }">
				<a href="gongji_news?page=${pend+1}"> >> </a>
			</c:if>
			<c:if test="${pend == pagecnt }">
			
			</c:if>
			<!-- 다음 10페이지 이동 끝-->
			<!-- 다음 페이지 이동 끝-->
		</div>
		<br>
	</div>
<!-- 	<div class="right_area">
		<img src="resources/img/life_wordcloud.png" width="250" height="300"> 
	</div> -->

</div>


<%@ include file="../bottom.jsp"%>