<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp" %>

<style type="text/css">
#mypage ul {
	list-style:none;
	border-top:2px solid green;
	border-bottom:2px solid green;
	max-width:350px;
	}

#mypage li {	
	text-align:left;}
	
#mypage span {
		}
	
.myinfo{
	display:inline-block;
	width:75px;
	}
	
.myinput{
	display:inline-block;
	width:100px;
	}
	
</style>

<div align="center" id="mypage">
 <caption> <h3> 회원등록정보 </h3></caption>
    <ul><br>
    	<li> <span class="myinfo">아이디 : </span> <span class="myinput"> ${mdto.userid} </span> </li><p>
    	<li> <span class="myinfo">비밀번호:</span> <span> ${mdto.pwd} </span></li><p>  
    	<li><span class="myinfo">닉네임 :</span> ${mdto.nickname} </li> <p>  
    	<li><span class="myinfo">이메일 :</span> ${mdto.email} </li> <p> 
    	<li><span class="myinfo">성&nbsp&nbsp&nbsp&nbsp별: </span> <input type="radio" name="sex" value="0" <c:if test="${mdto.sex eq 0}"> checked </c:if>>남자 ,
    	<input type="radio" name="sex" <c:if test="${mdto.sex eq 1}"> checked </c:if>>여자 </li><p>
    	<li><span class="myinfo">출생년도 :</span> ${mdto.year}</li><p>
   		<%-- <li><span class="myinfo">보유질환 :</span> ${mdto.disease}</li><p> --%>
   		<li><span style="display:inline-block; width:100 px;">건강관심분야 :</span><br> ${mdto.concern}</li><p>
    	<li><span>가입경로 :</span><br> 
    	 <input type="radio" name="route" value="1" <c:if test="${mdto.route eq 1}"> checked </c:if>>인터넷, 
    	 <input type="radio" name="route" value="2" <c:if test="${mdto.route eq 2}"> checked </c:if>>SNS(카톡, 밴드 등),
    	 <input type="radio" name="route" value="3" <c:if test="${mdto.route eq 3}"> checked </c:if>>지인소개,
    	 <input type="radio" name="route" value="4" <c:if test="${mdto.route eq 4}"> checked </c:if>>문제메세지,
    	 <input type="radio" name="route" value="5" <c:if test="${mdto.route eq 5}"> checked </c:if>>TV,
    	인터넷  <input type="radio" name="route" value="6" <c:if test="${mdto.route eq 6}"> checked </c:if>>신문
    	</li><br> 
    	<li> <a href="mypage_like"> 내가 공감하는 레시피 </li> <p>
    	<li style="text-align:center;"><span> <a href="myupdate"> 나의 정보 수정하기</a></span>&nbsp&nbsp&nbsp
    	<span onclick="return confirm('정말 탈퇴하시겠습니까?')"> <a href="mem_out?id=${mdto.id}&mstate=1" > 회원탈퇴하기 </a></span> </li>        <br>
    </ul>

 </div>
 
 <%@ include file="../bottom.jsp" %>
