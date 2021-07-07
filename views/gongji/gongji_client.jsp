<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" href="resources/css/gongji.css" type="text/css">
<style>
.client {
	display: block;
	border: 4px solid #e6e7e8;
	padding: 20px;
	font-size: 20px;
	font-weight: bold;
}

.client p {
	font-size: 36px;
	text-align: center;
	height: 800px;
	
}

.client_btn {
	background-color: #44b6b5;
	margin-left: 230px;
	text-decoration: none;
	font-size: 24px;
	color: white;
	padding: 10px 20px 10px 20px;
	display: inline-block;
	border-radius: 5px;
	transition: all 0.1s;
}

.client_btn:hover {
	background-color: #35918f;
	color: white;
}
ul,li{
	list-style:none;
	
}

ul li {
	list-style:none; 
}
.fl {
	float:left; 
}
.tc {
	text-align:center; 
}

/* 게시판 목록 */
.board {
	width: 1000px; 
	height: 60px;
	}
.w70 {width:70px; }
.w750 {width:600px; }
.w120 {width:150px; }
.w100 {width:100px; }

.list {
	height: 40px;
	line-height: 40px;
}
</style>
<script>

</script>

</head>
<form method="post" action="insert_ok">
	<div class="sub_bg">
		<div class="contents_area">
			<div class="client">
				궁금하신 점이나 제안하고 싶은 점이 있으시면 언제든지 글을 남겨주세요.
				<a href="gongji_insert" class="client_btn">등록</a>
			</div>
			<br>
			<div class="client">
				  <ul class="board">
				  	<li class="fl tc w100 list">작성자</li>
				  	<li class="fl tc w750 list">제목</li>
				  	<li class="fl tc w120 list">작성일자</li>
				  	<li class="fl tc w120 list">답변상황</li>
				  </ul>
				  <br><br>
			<c:forEach items="${list}" var="gdto">

				<c:if test="${gdto.userid==userid}">	
				  <ul class="board">
				  	<li class="fl tc w100 list">${gdto.userid }</li>
				  	<li class="fl tc w750 list"><a href="gongji_client_content?id=${gdto.id}">${gdto.title }</a></li>
				  	<li class="fl tc w120 list">${gdto.writeday }</li>
				  	<li class="fl tc w120 list">${gdto.reply }</li>
				  </ul>
				</c:if>
			</c:forEach>
			</div>
			<br>
			<br>
		</div>
		<div class="right_area">
			<ul class="head">
				<li class="menu"><a href="gongji_list">공지사항</a></li><br>
				<li class="menu"><a href="gongji_qna">도움말</a></li><br>
				<li class="menu"><a href="gongji_client" style="color:green">1대1 문의</a></li><br>
			</ul>

		</div>
	</div>
</form>

<%@ include file="../bottom.jsp"%>