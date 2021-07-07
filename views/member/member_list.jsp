<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#member_list caption{
		text-align:center;
	}
</style>
</head>
<body>

<%@ include file="../top.jsp" %>
 <table width="800" align="center" id="member_list">
    <caption> <h3> 회원관리 페이지 </h3> </caption>
    <tr align="center">
      <td> 회원 아이디 </td>
      <td> 닉네임 </td>
      <td> 출생년도 </td>
      <td> 이메일 </td>
      <td> 가입일 </td>
      <td> 회원상태 </td>
      <td colspan="2"> 회원관리(탈퇴/복원) </td>
    </tr>
   <c:forEach var="mdto" items="${mlist}">
    <tr align="center">
      <td> ${mdto.userid} </td>
      <td> ${mdto.nickname} </td>
      <td> ${mdto.year} </td>
      <td> ${mdto.email} </td>
      <td> ${mdto.regdate} </td>
      
      <c:if test="${mdto.mstate == 0}">
      <td> 정상회원 </td>
      </c:if>
      
      <c:if test="${mdto.mstate == 1}">
      <td> 탈퇴회원 </td>
      </c:if>
      
      <c:if test="${mdto.mstate == 2}">
      <td> 강퇴회원 </td>
      </c:if>
      
      <c:if test="${mdto.mstate == 3}">
      <td> 관리자계정(정상) </td>
      </c:if>
      
      <c:if test="${mdto.mstate == 4}">
      <td> 관리자계정(정지) </td>
      </c:if>

     <c:if test="${mdto.mstate == 0}">
      <td> <a href="mem_state?id=${mdto.id}&mstate=1"> 탈퇴처리  </a> </td>
      <td> <a href="mem_state?id=${mdto.id}&mstate=2"> 강퇴처리  </a> </td>
     </c:if>
     <c:if test="${mdto.mstate == 1 or mdto.mstate == 2}">
      <td colspan="2"> <a href="mem_state?id=${mdto.id}&mstate=0"> 회원복원  </a> </td>
     </c:if>
     <c:if test="${mdto.mstate == 3}">
      <td colspan="2"> <a href="mem_state?id=${mdto.id}&mstate=4"> 관리자 정지 </a></td>     </c:if>
     
     <c:if test="${mdto.mstate == 4}">
      <td colspan="2"> <a href="mem_state?id=${mdto.id}&mstate=3"> 관리자 복원  </a> </td>
     </c:if>
    </tr>
   </c:forEach> 
  </table>

 <%@ include file="../bottom.jsp" %>
</body>
</html>