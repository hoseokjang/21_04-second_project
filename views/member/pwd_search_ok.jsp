<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp" %>    

<style>
#containner {
	position:lelative;
	display:inline-block;
	text-align:center; 
	width:350px;
	height:500px; 
	border-top:2px solid green;
	/* border-bottom:2px solid green; */}

/* 폼태그 관련 스타일 */
.id_form {
	width:300px;
	height:30px;
	border:1px solid black;
}
.pwd_form {
	width:300px;
	height:30px;
	border:1px solid black;	 
}
.submit_form {
	width:300px;
	height:35px;
	border:1px solid gray;
	background:green;
	color:black;	
}

#id_msg{
	color:red;}
	
</style>

<script>
 
 
 </script>


<div style="display:inline-block; position:lelative; list-style:none; width:100%; text-align:center;">
<caption> <h3> 비밀번호찾기  </h3></caption> 

<div id="containner"><p>
 <form name="life" method="post" action="pwd_sendmail">
 <input type="hidden" name="content" value="아이디:${mdto.userid}, 비밀번호: ${mdto.pwd}">
 <input type="hidden" name="title" value="회원 비밀번호 찾기">
 <input type="hidden" name="email" value="${mdto.email}">
 
  <table width="300" align="center" >
   <tr>
     <td align="left">아이디:</td> <td align="left" style="color:purple;">  ${mdto.userid} <p> </td>
   </tr>

   <tr> 
    <td align="left">닉네임:</td> <td align="left" style="color:purple;"> ${mdto.nickname}<p> </td>
   </tr>
   <tr>    
   <td align="left">이메일주소:</td> <td align="left" style="color:purple;"> ${mdto.email} </td>
   </tr>
  
     <tr>
     <td colspan="2" align="left">
      <span style="color:red; font-size:14px; text-align:left;"> 비밀번호를 가입시 등록한 이메일로 보냅니다 </span>
     </td>
     </tr>

   <tr>
    <td colspan="2" align="center" ><p>
     <p> <input type="submit" class="submit_form" value="비밀번호를 이메일로 받기" >
    </td>
   </tr>
   <tr>
    <td align="center" width="150px">
       <a href="login">로그인</a>
    </td>
    <td align="center">
       <a href="member">회원가입</a>
    </td>
   </tr>
  </table>
 </form>
 </div>
 </div>
 <%@ include file="../bottom.jsp" %>
