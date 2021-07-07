<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp" %>  

<style>
#result{
	display:inline-block;
	position:lelative;
	list-style:none;
	width:100%; 
	/* height:900px; */
	text-align:center;
	/* border: 2px solid red; */} 
	
#result_wrap{ 
	display:inline-block;
	/* width: 350px;  */
	/* max-height:900px; */
	/* padding-left:10px; */
	text-align:left; 
	position: lelative;
	/* left:10%; */
	/* transform:translate(-10%, 0%) */ ;  
  	 /* margin:0 -250px; */ 
	border-top: 3px solid green;}	
</style>
  
 
<div align="center" id="result">
<caption> <h3> 연관 식재료 검색결과 </h3> </caption>
<div id="result_wrap"> 

<br>
네이버 카페의 최근 게시글 1000개 중 "${keyword}"를(을) 언급한 게시글에 함께 언급된 식재료입니다<br> 
 <img src="resources/img/ingredients.png">
</div>
</div>
 <%@ include file="../bottom.jsp" %>