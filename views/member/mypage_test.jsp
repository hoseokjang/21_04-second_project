<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

</head>
<body>

<div align="center">
 <caption> <h3> 회원정보 </h3> </caption>
    <ul>
    	<li> <span>아이디 : </span> <span> ${mdto.userid} </span> </li>
    	<li> <span>비밀번호:</span><span> ${mdto.pwd} </span></li><p>  
    	<li>닉네임 : ${mdto.nickname} </li> <p>  
    	<li>이메일 : ${mdto.email} </li> <p>
    	<li>성별:  남자  <input type="radio" name="sex" value="0">
    	여자 <input type="radio" name="sex" value="1"></li><p>
    	<li>출생년도  ${mdto.year}</li><p>
   		<li>보유질환  ${mdto.disease}</li><p>
   		<li>관심질환  ${mdto.concern}</li><p>
    	<li>가입경로 ${mdto.route}</li> <p>  
    	<li> <a href="mypage_update"> 수정하기 </li>
    </ul>
 </div>
</body>
</html>