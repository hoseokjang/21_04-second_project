<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<html>
<head>
	<title>Home</title>
	<style>
	  div {
	    width:800px;
	    height:50px;
	    margin:auto;
	  }
	</style>
</head>

<body>
   <div align="right">
    <c:if test="${userid == null}">
     <a href="login"> 로그인  </a> &nbsp &nbsp
     <a href="member"> 회원가입 </a>
    </c:if>
    
    <c:if test="${userid!=null && mstate == '0'}">
     "${nickname}"님 안녕하세요!!&nbsp <a href="logout">로그아웃</a><br>
     <a href="mypage">마이 페이지</a>
    </c:if>
    
    <c:if test="${userid!=null && mstate == '1'}">
     "${nickname}"님 탈퇴계정입니다 &nbsp <a href="logout">되돌아가기</a><br>
     
    </c:if>

    <c:if test="${userid!=null && mstate == '2'}">
     "${nickname}"님 사용할 수 없는 계정입니다 &nbsp <a href="logout">되돌아가기</a><br>
    
    </c:if>
    
    <c:if test="${userid!=null && mstate == '3'}">
     "${nickname}"로그인상태&nbsp <a href="logout">로그아웃</a><br>
     <a href="admin_page">관리자페이지</a>
    </c:if>

    <c:if test="${userid!=null && mstate == '4'}">
     "${nickname}"사용할수 없는 관리계정입니다&nbsp <a href="logout">로그아웃</a><br>
     <a href="admin_page">관리자페이지</a>
    </c:if>

   </div>
</body>
</html>