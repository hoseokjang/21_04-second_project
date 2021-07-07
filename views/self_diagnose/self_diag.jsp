<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<style>
#self_diagnose {
	font-family: 'Noto Sans KR', sans-serif;
	}
#self_diagnose ul {
	list-style-type:none;
	padding-inline-start:0px;
}
#self_diag_top {
	width:1140px;margin:auto;
}
#self_diag_option div{
	display:inline-block;
}
#self_diag_option a{
	background:white; border:1px solid #57c006; border-radius:30px; font-size:20px;
	padding-left:60px; padding-right:60px; width:300px; color:black;
}
</style>
<script>
function changeElement(n){
	if(n==1){
		document.getElementById("a1").style.background = "#57c006";
		document.getElementById("a1").style.color = "white";
		document.getElementById("body_img").src = "resources/img/body/간장위신장.png";
		document.getElementById("body_img").style.width = "200px;"
	} else if(n==2){
		document.getElementById("a2").style.background = "#57c006";
		document.getElementById("a2").style.color = "white";
		document.getElementById("body_img").src = "resources/img/body/혈행혈압혈당심장병.PNG";
		document.getElementById("body_img").style.width = "200px;"
	} else if(n==3){
		document.getElementById("a3").style.background = "#57c006";
		document.getElementById("a3").style.color = "white";
		document.getElementById("body_img").src = "resources/img/body/뇌정신건강.PNG";
		document.getElementById("body_img").style.width = "200px;"
	} else if(n==4){
		document.getElementById("a4").style.background = "#57c006";
		document.getElementById("a4").style.color = "white";
		document.getElementById("body_img").src = "resources/img/body/뼈.PNG";
		document.getElementById("body_img").style.width = "200px;"
	} else{
		document.getElementById("a5").style.background = "#57c006";
		document.getElementById("a5").style.color = "white";
		document.getElementById("body_img").src = "resources/img/body/피부.PNG";
		document.getElementById("body_img").style.width = "200px;"
	}
}
function resetElement(m){
	if(m==1){
		document.getElementById("a1").style.background = "white";
		document.getElementById("a1").style.color = "black";
	} else if(m==2){
		document.getElementById("a2").style.background = "white";
		document.getElementById("a2").style.color = "black";
	} else if(m==3){
		document.getElementById("a3").style.background = "white";
		document.getElementById("a3").style.color = "black";
	} else if(m==4){
		document.getElementById("a4").style.background = "white";
		document.getElementById("a4").style.color = "black";
	} else{
		document.getElementById("a5").style.background = "white";
		document.getElementById("a5").style.color = "black";
	}
}
</script>
<div id="self_diagnose">
	<div id="self_diag_top">
		<span style="display:inline-block"> <h4>자가진단</h4> </span>
		<span style="color:#CCCCCC">Self Diagnose</span>
		<br><br>
		<div style="display:inline-block;"> <h4><b style="color:#57c006">Step1</b></h4></div>
		<div style="display:inline-block">진단하고 싶은 카테고리를 선택해주세요</span>
	</div>
	<br><br><br><br><br>
	<div id="self_diag_option" align="center">
		<img id="body_img" src="resources/img/body/간장위신장.png" width="200px" height="500px">
		<p>
		<div id="self_diag_option1">
			<a id="a1" href="self_diag_select?category=1" onmouseover="changeElement(1)" onmouseout="resetElement(1)"> 간/장/위/신장 </a>
		</div>
		<div id="self_diag_option2">
			<a id="a2" href="self_diag_select?category=2" onmouseover="changeElement(2)" onmouseout="resetElement(2)">혈행/혈압/혈당/심장병</a>
		</div>
		<div id="selg_diag_option3">
			<a id="a3" href="self_diag_select?category=3" onmouseover="changeElement(3)" onmouseout="resetElement(3)">뇌/정신건강</a>
		</div>
		<div id="self_diag_option4">
			<a id="a4" href="self_diag_select?category=4" onmouseover="changeElement(4)" onmouseout="resetElement(4)">뼈</a>
		</div>
		<div id="self_diag_option5">
			<a id="a5" href="self_diag_select?category=5" onmouseover="changeElement(5)" onmouseout="resetElement(5)">피부</a>
		</div>
	</div>
</div>
<br><br><br><br>
<c:import url="../bottom.jsp"/>