<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 수정하기</title>
<style>
	body {
	margin:0px;
	}
	#hc_review {
	margin:auto;
	text-align:center;
	}
	select {
	width:100px;
	padding:5px;
	}
	#hc_rating {
	font-size:16px;
	font-weight:550;
	position:relative;
	left:-140px;
	padding:20px 0px 20px 0px;
	}
	#submitbtt {
	font-size:15px;
	font-weight:550;
	position:relative;
	height:30px;
	color:white;
	border:0px;
	background:#57c006;
	cursor:pointer;
	}
	#canclebtt {
	font-size:15px;
	font-weight:550;
	position:relative;
	height:30px;
	color:#777777;
	background:white;
	border:1px solid #777777;
	cursor:pointer;
	}
	#counter {
	font-size:15px;
	position:relative;
	left:-180px;
	top:-10px;
	}
	#retitle {
	background:#57c006;
	font-size:20px;
	font-weight:550;
	height:40px;
	padding-top:10px;
	color:white;
	}
	#hc_review .starrating{
	background:none;
	border:0px;
	padding:0px;
	cursor:pointer;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
	$(document).ready(function() {
	    $('#retext').on('keyup', function() {
	        $('#counter').html("("+$(this).val().length+" / 300)");
	 
	        if($(this).val().length > 100) {
	            $(this).val($(this).val().substring(0, 300));
	            $('#counter').html("(300 / 300)");
	        }
	    });
	});
	
	function hupdate_close(form)
	{
		var check=document.hreview.content.value;
		if(check.length<10)
		{
			alert("리뷰는 최소 10자 이상 작성해주세요");
			document.hreview.content.focus;
		}
		else
		{
			form.submit();
			window.close();
		}
	}
	function starrating(star)
	{
		var star=star;
		if(star=="1")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star0.PNG"
			document.getElementById("rating3").src="resources/img/star0.PNG"
			document.getElementById("rating4").src="resources/img/star0.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreview.rating.value=1;
		}
		else if(star=="2")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star0.PNG"
			document.getElementById("rating4").src="resources/img/star0.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreview.rating.value=2;
		}
		else if(star=="3")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star0.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreview.rating.value=3;
		}
		else if(star=="4")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreview.rating.value=4;
		}
		else if(star=="5")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star.PNG"
			document.getElementById("rating5").src="resources/img/star.PNG"
			hreview.rating.value=5;
		}
	}
	window.onload=function starstart()
	{
		if(hreview.rating.value==1)
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star0.PNG"
			document.getElementById("rating3").src="resources/img/star0.PNG"
			document.getElementById("rating4").src="resources/img/star0.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreview.rating.value=1;
		}
		else if(hreview.rating.value==2)
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star0.PNG"
			document.getElementById("rating4").src="resources/img/star0.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreview.rating.value=2;
		}
		else if(hreview.rating.value==3)
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star0.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreview.rating.value=3;
		}
		else if(hreview.rating.value==4)
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreview.rating.value=4;
		}
		else if(hreview.rating.value==5)
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star.PNG"
			document.getElementById("rating5").src="resources/img/star.PNG"
			hreview.rating.value=5;
		}
	}
</script>
</head>
<body>
<c:set var="hrdto" value="${hrdto}"/>
<div id="hc_review" class="container">
		<div id="retitle">리뷰 수정</div>
		<form name="hreview" method="post" action="hupdate_ok?id=${hrdto.id}" target="hcontent">
			<input type="hidden" name="nickname" value="${hrdto.nickname}">
			<input type="hidden" name="pid" value="${hrdto.pid}">
			<input type="hidden" name="rating" value="${hrdto.rating}">
			<div id="hc_rating">
			<span>평점 :</span>
			<button class="starrating" type="button" onclick="starrating('1')">
				<img id="rating1" src="resources/img/star.PNG" width="20">
			</button>
			<button class="starrating" type="button" onclick="starrating('2')">
				<img id="rating2" src="resources/img/star0.PNG" width="20">
			</button>
			<button class="starrating" type="button" onclick="starrating('3')">
				<img id="rating3" src="resources/img/star0.PNG" width="20">
			</button>
			<button class="starrating" type="button" onclick="starrating('4')">
				<img id="rating4" src="resources/img/star0.PNG" width="20">
			</button>
			<button class="starrating" type="button" onclick="starrating('5')">
				<img id="rating5" src="resources/img/star0.PNG" width="20">
			</button> 
			</div>
			<textarea id="retext" name="content" rows="15" style="width:95%;">${hrdto.content}</textarea><p>
			<span style="color:#aaa;" id="counter">(0 / 300)</span><p>
			<input id="submitbtt" type="button" value="수정" onclick="hupdate_close(this.form)">
			<input id="canclebtt" type="button" value="취소" onclick="window.close()"> 
		</form>			
	</div>
</body>
</html>