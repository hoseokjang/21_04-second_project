<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../top.jsp" %>    

<style>
#containner {
   width:1100px;
   height:500px;	
/*    background:red;	 */ 
   margin:auto;	 
}

/* 폼태그 관련 스타일 */
.id_form {
	width:300px;
	height:30px;
	border:2px solid green;
}
.pwd_form {
	width:300px;
	height:30px;
	border:2px solid green;	 
}
.submit_form {
	width:300px;
	height:35px;
	border:2px solid geen;
	background:green;
	color:white;	
}
</style>  

<div>
<div id="containner">
 <form method="post" action="login_ok">
  <table width="500" align="center" >
   <tr>
    
    <td colspan="2" align="center"> <input type="text" name="userid" class="id_form" placeholder="아이디" required><p> </td>
   </tr>
   <tr>
    <td colspan="2" align="center"> <input type="password" class="pwd_form" name="pwd" placeholder="비밀번호"> </td>
   </tr>
     <c:if test="${chk == 1}">
     <tr>
     <td colspan="2" align="center">
      <span style="color:red;"> 아이디 또는 비밀번호를 확인바랍니다 </span>
      </td>
     </tr>
     </c:if>
     <c:if test="${chk == 2}">
     <tr>
     <td colspan="2" align="center">
      <span style="color:red;">비밀번호를 이메일로 보내드렸습니다</span>
      </td>
     </tr>
     </c:if>
 <!--    </td>
   </tr> -->
   <tr>
    <td colspan="2" align="center" >
     <p><p><input type="submit" class="submit_form" value="로그인" >
    </td>
   </tr>
   <tr>
    <td align="center">
       <a href="member">&nbsp&nbsp&nbsp&nbsp회원가입</a>
    </td>
    <td align="center">
       <a href="pwd_search">비밀번호찾기</a>
    </td>
   </tr>
  </table>
 </form>
 </div>
 </div>
 <%@ include file="../bottom.jsp" %>
