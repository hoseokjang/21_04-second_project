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
 
 function userid_check()
 {    
	   var chk=new XMLHttpRequest();
	   var userid=document.life.userid.value;
	   if(userid==""){
		   /* alert("공백은 사용 아이디 될 수 없습니다");  */
		   document.life.userid.focus();
		   document.getElementById("id_msg").innerHTML = "아이디를 입력해 주세요";
	   }
	   else 
		{		   
	   chk.open("get","userid_check?userid="+userid);
	   chk.send();
	   
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState==4)
		   {
			   if(chk.responseText=="1")
			   {
				   /* alert("계속 진행하시기 바랍니다"); */
				   /* document.life.userid.focus(); */
				   /* document.getElementById("id_msg").innerHTML = "계속 진행하시기 바랍니다"; */	
				   return true;
			   }
			   else if(chk.responseText=="0")
			   {
				   alert("존재하지 않는 아이디입니다");
				   document.getElementById("id_msg").innerHTML = "존재하지 않는 아이디입니다";
				   return false;
			   }
			   else
			{
				return true;
			}	   

		   }
	   }
	 }
 }

 </script>


<div style="display:inline-block; position:lelative; list-style:none; width:100%; text-align:center;">
<caption> <h3> 비밀번호찾기 </h3></caption>

<div id="containner"><p>
 <form name="life" method="post" action="pwd_search_ok">
  <table width="300" align="center" >
   <tr>
    <td colspan="2" align="center"> <input type="text" name="userid" class="id_form" placeholder="아이디" required onblur="userid_check()"> </td>
   </tr>
   <tr>
   	<td colspan="2" align="left" id="id_msg"><p>  </td> 
   </tr>
   <tr> 
    <td colspan="2" align="center"> <input type="text" name="nickname" class="pwd_form" placeholder="닉네임" required><p> </td>
   </tr>
   <tr>    
   <td colspan="2" align="center"><input type="text" name="email" class="pwd_form"  placeholder="이메일주소" required> </td>
   </tr>
     <c:if test="${chk == 1}">
     <tr>
     <td colspan="2" align="left">
      <span style="color:red; font-size:14px; text-align:left;"> 아이디,닉네임,이메일주소가 <br>맞는지 확인바랍니다 </span>
     </td>
     </tr>
     </c:if> 
   <tr>
    <td colspan="2" align="center" ><p>
     <p> <input type="submit" class="submit_form" value="비밀번호 찾기" > 
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
