<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp" %>

<style type="text/css">
ul {
	list-style:none;
	border:1px solid purple;
	max-width:500px;
	}

li {
	
	text-align:left;}
span {
	border:1px solid green;
	}

</style>

<div align="center">
 <caption> <h3> 회원정보 조회하기 </h3> </caption>
   <form name="life" method="post" action="mypage_ok">
    <ul>
    	<li> <span> 아이디 : </span> <span> test  ${pdto.userid} </span> </li>
    	<li><span>비밀번호</span><span><input type="password" name="pwd" value="${pdto.pwd}"></span></li><p>  
    	<li>닉네임 <input type="text" name="nickname" value="${pdto.nickname}"> </li><p>  
    	<li>이메일 <input type="text" name="email" value="${pdto.email}"></li><p>
    	<li>성별:  <input type="radio" name="sex" value="0"> 남자,&nbsp
    	<input type="radio" name="sex" value="1">여자 </li><p>

    	<li>출생년도 <input type="text" name="year" value="${pdto.year}"></li><p>
   		<li>보유질환  <input type="text" name="disease" value="${pdto.disease}"></li><p>
   		<li>관심질환  <input type="text" name="concern" value="${pdto.concern}"></li><p>
    	<li>가입경로 <input type="text" name="route" value="${pdto.route}"></li><p>  
    	<li><input type="submit" value="저장하기"></li>
    </ul>
   </form>
</div>

 <%@ include file="../bottom.jsp" %>
