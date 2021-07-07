<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" href="resources/css/gongji.css" type="text/css">
<style>
.client {
	padding: 20px 16px;
	display: block;
	border: 4px solid #e6e7e8;
	font-size: 20px;
	font-weight: bold;
}

.client p {
	font-size: 36px;
	text-align: center;
	height: 1000px;
}

.client input[type="text"], .client textarea {
	background-color: #f5f5f5;
	border: #ebebeb;
	font-weight: bold;
}

.client textarea {
	font-family: "Lucida Grande", Verdana;
}

.client_btn {
	background-color: #44b6b5;
	margin-left: 300px;
	text-decoration: none;
	font-size: 24px;
	color: white;
	padding: 10px 20px 10px 20px;
	display: inline-block;
	border-radius: 5px;
	transition: all 0.1s;
}

.client_btn:hover {
	background-color: #35918f;
	color: white;
}

.insert_btn {
	text-align: center;
	padding: 30px 0 50px;
}

.btn_lg {
	padding: 10px 30px;
	font-size: 18px;
	font-weight: bold;
	line-height: 1.3333333;
	border-radius: 3px;
	margin: 0 4px;
}

.btn_primary {
	color: #fff;
	background-color: #74b243;
	border: 1px solid #497725;
}

.btn_default {
	color: #333;
	background-color: #fff;
	border: 1px solid #ccc;
}

.write_pic2 {

	padding: 20px 16px;
}

.complete_pic {
	position: relative;
	width: 140px;
	height: 140px;
	display: inline-block;
	margin: 0 4px 8px;
	vertical-align: top;
}
</style>
<script>
	
	function check(my)
	{
		if(my.title.value=="")
		{
			alert("제목을 입력해주세요.");
			my.title.focus();
			return false;
		}
		if(my.content.value=="")
		{
			alert("내용을 입력해주세요.");
			return false;
		}
	}
	function setThumbnail()
 	{
 		for (var image of event.target.files) {
 			var reader=new FileReader();
 			
 			reader.onload = function(event)
 			{
 				var img = document.createElement("img");
 				
 				img.setAttribute("src",event.target.result);
 				img.setAttribute("width","100");
 				document.getElementById("imgview").innerHTML ="";  // 이전이미지 삭제
 	            document.getElementById("imgview").appendChild(img);  //새로 선택한 이미지  출력

 			};
 			reader.readAsDataURL(image); 
 		}
 	}
</script>

</head>
<form method="post" action="insert_ok" enctype="multipart/form-data" onsubmit="return check(this)">
	<input type="hidden" name="userid" value="${userid }">
	<div class="sub_bg">
		<div class="contents_area">
			<div class="client">
				<input type="text" name="title" placeholder="제목"
					style="height: 76px; width: 1000px;">
			</div>
			<br>
			<div class="client">
				<textarea name="content" placeholder="내용"
					style="height: 500px; width: 1000px"></textarea>
			</div>
			<br>
			<div class="client write_pic2">
				<input type="file" name="img" onchange="setThumbnail();">
						<span id="imgview"></span>

			</div>
			<br>
			<div class="insert_btn">
				<button type="submit" class="btn_lg btn_primary">등록</button>
				<button type="reset" class="btn_lg btn_default">취소</button>
			</div>
		</div>
		<div class="right_area">
			<ul class="head">
				<li class="menu"><a href="gongji_list">공지사항</a></li>
				<br>
				<li class="menu"><a href="gongji_qna">도움말</a></li>
				<br>
				<li class="menu"><a href="gongji_client" style="color: green">1대1 문의</a></li>
				<br>
			</ul>

		</div>
	</div>
</form>

<%@ include file="../bottom.jsp"%>