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
	border:2px solid purple;
}
.pwd_form {
	width:300px;
	height:30px;
	border:2px solid purple;	 
}
.submit_form {
	width:300px;
	height:35px;
	border:2px solid purple;
	background:green;
	color:white;	
}
</style>  

<div>
<div style="height:30px;"> </div>
<div id="containner">
<p>
 <form method="post" action="keywd_save">
  <table width="500" align="center" >
   <tr>
    <td colspan="2" align="center"> <input type="text" name="keywd" class="id_form" placeholder="식재료를 입력하세요" required><p> </td>
   </tr>

   <tr>
    <td colspan="2" align="center" >
     <p><p><input type="submit" class="submit_form" value="함께 언급되는 식재료 검색" >
    </td>
   </tr>
   <tr>
    <td align="center">
       <a href="member">&nbsp회원가입</a>
    </td>
   </tr>
  </table>
 </form>
 </div>
 </div>
 <%@ include file="../bottom.jsp" %>
 
 
 