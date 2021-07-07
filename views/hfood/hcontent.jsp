<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<style>
	#hfood_box {
	font-family: 'Noto Sans KR', sans-serif;
	width:1140px;
	margin:auto;
	text-align:center;
	}
	#hfood_box a {
	text-decoration:none;
	color:black;
	}
	#hfood_box a:hover {
	color:#57c006;
	}
	#hfood_box ul {
	list-style-type:none;
	padding-inline-start:0px;
	}
	#hfood_box ul li{
	display:inline-block;
	}
	#hfood_box #hc_review_list ul {
	width:1048px;
	height:50px;
	border:1px solid #ededed;
	text-align:left;
	background:#fafafa;
	padding-inline-start:20px;
	}
	#hfood_box #hc_review_list ul li {
	position:relative;
	padding:0px 10px 0+px 10px;
	top:12px;
	}
	#hfood_box #hc_review_list .rebutton{
	border:0px;
	background:none;
	font-size:18px;
	font-weight:600;
	letter-spacing:-0.04em;
	}
	#hfood_box #hc_img img {
	width:500px;
	height:500px;
	}
	#hfood_box #hc_img {
	position:relative;
	display:inline-block;
	left:-55px;
	}
	#hfood_box #hc_data {
	text-align:left;
	width:500px;
	position:relative;
	display:inline-block;
	top:20px;
	}
	#hfood_box #hc_data .hc_data_tit {
	font-size:30px;
	font-weight:500;
	display:inline-block;
	}
	#hfood_box #hc_data #tit_price {
	position:relative;
	top:20px;
	font-weight:550;
	}
	#hfood_box #hc_data .hc_data_con {
	font-size:20px;
	}
	#hfood_box #hc_data #det_price {
	font-size:15px;
	color:#666666;
	border-bottom:0.5px solid #e5e5e5;
	padding-bottom:10px;
	}
	#hfood_box #hc_data #tit_rating {
	position:relative;
	top:40px;
	}
	#hfood_box #hc_data #tit_link {
	text-align:center;
	position:relative;
	top:200px;
	}
	#hfood_box #hc_data #tit_link #linkadd {
	font-size:20px;
	font-weight:550;
	position:relative;
	width:490px;
	height:60px;
	color:white;
	border:0px;
	background:#57c006;
	}
	#hfood_box #hc_data .hlikediv {
	position:relative;
	top:80px;
	left:-160px;
	}
	
	#hc_review_list {
	padding-top:40px;
	margin:auto;
	}
	
	#hc_review_list .hc_review_content {
	width:1048px;
	font-size:15px;
	padding-top:8px;
	text-align:left;
	border-bottom:1px solid #e6e6e6;
	}
	
	#hc_review_list .hr_rating {
	font-size:16px;
	font-weight:550;
	}
	#hc_review_list .hr_detail {
	font-size:12px;
	color:#888888;
	}
	#hc_review_list .hr_content {
	position:relative;
	width:700px;
	left:190px;
	font-size:15px;
	font-weight: normal;
	color:#777777;
	top:-25px;
	display:inline-block;
	}
	#hc_review_list .hr_revise {
	position:relative;
	top:-20px;
	right:-278px;
	font-weight:550;
	text-align:right;
	display:inline-block;
	}
	#hc_review_list .hr_revise a {
	color:#777777;
	}
	#hfood_box #hc_review .reviewtit {
	display:inline-block;
	position:relative;
	font-size:24px;
	font-family:"Noto Sans KR", "Segoe UI", sans-serif;
	font-weight:400;
	margin-bottom:10px;
	}
	#hc_review {
	width:1048px;
	text-align:left;
	padding:40px 0px 40px 55px;
	}
	#hc_review #counter {
	position:relative;
	width:90px;
	display:inline-block;
	right:-560px;
	}
	#hc_review #hc_rating {
	font-size:16px;
	font-weight:550;
	display:inline-block;
	position:relative;
	padding-bottom:10px;
	}
	#hc_review #hc_rating2 {
	font-size:16px;
	font-weight:550;
	position:relative;
	padding-bottom:10px;
	}
	#hfood_box select {
	width:100px;
	padding:5px;
	}
	#hfood_box #submitbtt {
	font-size:15px;
	font-weight:550;
	position:relative;
	top:-26px;
	width:80px;
	height:60px;
	color:white;
	border:0px;
	background:#57c006;
	}
	#hfood_box #submitbtt2 {
	font-size:15px;
	font-weight:550;
	position:relative;
	top:-26px;
	width:80px;
	height:60px;
	color:white;
	border:0px;
	background:#57c006;
	}
	#reviewpage {
	margin-top:5px;
	font-size:18px;
	font-weight:550;
	}
	#reviewpage a {
	color:#777777;
	}
	#hc_review .starrating{
	background:none;
	border:0px;
	padding:0px;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
	$(document).ready(function() {
	    $('#recontent').on('keyup', function() {
	        $('#counter').html("("+$(this).val().length+" / 300)");
	 
	        if($(this).val().length > 100) {
	            $(this).val($(this).val().substring(0, 300));
	            $('#counter').html("(300 / 300)");
	        }
	    });
	});
		
	function hupdate(id)
	{
		//부모창
		window.name="hcontent";
		//자식창
		window.open("hupdate?id="+id,"hupdate","width=460,height=500,resizable=no");
	}
	
	function hdelete(id,pid)
	{
		var del_chk=window.confirm("정말 삭제하시겠습니까?")
		if(del_chk==true)
		{
			location.href="hdelete?id="+id+"&pid="+pid;
		}
	}
	
	function reviewdirect()
	{
		document.hreviewform.content.focus();	
	}
	
	function reviewcheck(form)
	{
		var check=document.hreviewform.content.value;
		if(check.length<10)
		{
			alert("리뷰는 최소 10자 이상 작성해주세요");
			document.hreviewform.content.focus();
		}
		else
		{
			form.submit();
		}
	}
	
	function hlike1(productid, userid)
	{
		var chk = new XMLHttpRequest();
		var productid = productid;
		var userid = userid;
	    	chk.open("get","hlike1?pid="+productid+"&userid="+userid);
		    chk.send();
		    chk.onreadystatechange = function()
		    {
		       if(chk.readyState === 4)
		       {
		          if(chk.responseText === "1")
		          {
		             location.reload();
		          }
		       }
		    }
	}
	function hlike2(productid, userid)
	{
		var chk2 = new XMLHttpRequest();
		var productid = productid;
		var userid = userid;
		    chk2.open("get","hlike2?pid="+productid+"&userid="+userid);
		    chk2.send();
		    chk2.onreadystatechange = function()
		    {
		       if(chk2.readyState == 4)
		       {
		          if(chk2.responseText == "1")
		          {
		             location.reload();
		          }
		       }
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
			hreviewform.rating.value=1;
		}
		else if(star=="2")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star0.PNG"
			document.getElementById("rating4").src="resources/img/star0.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreviewform.rating.value=2;
		}
		else if(star=="3")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star0.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreviewform.rating.value=3;
		}
		else if(star=="4")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star.PNG"
			document.getElementById("rating5").src="resources/img/star0.PNG"
			hreviewform.rating.value=4;
		}
		else if(star=="5")
		{
			document.getElementById("rating1").src="resources/img/star.PNG"
			document.getElementById("rating2").src="resources/img/star.PNG"
			document.getElementById("rating3").src="resources/img/star.PNG"
			document.getElementById("rating4").src="resources/img/star.PNG"
			document.getElementById("rating5").src="resources/img/star.PNG"
			hreviewform.rating.value=5;
		}
		
	}
/*	function reviewpage(pid,page)
	{
		var chk3 = new XMLHttpRequest(); 
		var pid=pid;
		var page=page;
			chk3.open("get","hcontent?id="+pid+"&page"+page);
			chk3.send();
			chk3.onreadystatechange=function()
			{
				if(chk3.readyState==4)
				{
					if(chk3.responseText=="1")
					{
						location.reload();
					}
				}
			}
	}*/
</script>
<div id="hfood_box">
	<!-- 상품상세정보 -->
	<div id="hc_first" class="container">
		<div id="hc_img"><img src="resources/img/hfood/${hdto.productid}.jpg"></div>
		<div id="hc_data">
			<ul>
				<li><div id="tit_name" class="hc_data_tit">${hdto.name}</div></li>
				<li>
					<div id="tit_price" class="hc_data_tit"><fmt:formatNumber value="${hdto.lprice}"></fmt:formatNumber><span class="hc_data_con">원</span><br>
					<span id="det_price">네이버 쇼핑 검색기준 최저가로 현재 판매되는 가격과 다를 수 있습니다.</span>
					</div>
				</li>
				<c:if test="${havg==null }">
				<li><div id="tit_rating" class="hc_data_tit">평점 : 0.0<span class="hc_data_con">/5.0</span></div></li>
				</c:if>
				<c:if test="${havg!=null }">
				<li><div id="tit_rating" class="hc_data_tit">평점 : ${havg}<span class="hc_data_con">/5.0</span></div></li>
				</c:if>
				<c:if test="${hlike!=null }">
				<li>
					<c:if test="${hlike==0}">
	            	<div class="hlikediv" style="display:inline-block;">
	            		<span id="unlike" onclick="hlike1('${hdto.id}', '${userid}')" style="cursor:pointer; display:inline-block; width:90px; height:25px;background:#F7F7F7"> 좋아요 
	               		<span style="display:inline-block;"><img src="resources/img/heart1.PNG" width="17" height="17"></span>
	               		<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${likecnt}</span>
	            		</span>
	          		  	<span id="like" onclick="hlike2('${hdto.id}', '${userid}')" style="cursor:pointer; display:none; width:30px; height:40px;background:#F7F7F7"> 좋아요 
	               		<img src="resources/img/heart2.PNG" width="17" height="17">
	            		</span>
	            	</div>
	         		</c:if>
	         		<c:if test="${hlike == 1}">
	            	<div class="hlikediv" style="display:inline-block;">
	            		<span id="unlike" onclick="hlike1('${hdto.id}', '${userid}')" style="cursor:pointer; display:none; width:30px; height:40px;background:#F7F7F7"> 좋아요 
	               		<img src="resources/img/heart2.PNG" width="17" height="17">
	            		</span>
	            		<span id="like" onclick="hlike2('${hdto.id}', '${userid}')" style="cursor:pointer; display:inline-block; width:90px; height:25px;background:#F7F7F7"> 좋아요 
	               		<span style="display:inline-block;"><img src="resources/img/heart2.PNG" width="17" height="17" style="display:inline-block;"></span>
	               		<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${likecnt}</span>
	            		</span>
	            	</div>
	         		</c:if>
	         	</li>
         		</c:if>
         		<c:if test="${hlike==null }">
         			<div class="hlikediv" style="display:inline-block;">
	            		<span id="unlike" style="display:inline-block; width:90px; height:25px;background:#F7F7F7"> 좋아요 
	               		<span style="display:inline-block;"><img src="resources/img/heart2.PNG" width="17" height="17"></span>
	               		<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${likecnt}</span>
	            		</span>
	            	</div>
         		</c:if>
				<li><div id="tit_link" class="hc_data_tit"><input id="linkadd"type="button" onclick="location='${hdto.link}'" value="판매처가기"></div></li>
			</ul>
		</div>	
	</div>
	<!-- 리뷰출력 -->
	<div id="hc_review_list" class="container">
		<div id="hc_review_top">
			<ul>
				<li><input class="rebutton" type="button" value="리뷰 : ${hreviewcnt}"></li>
				<c:if test="${userid!=null}">
					<li><input class="rebutton" type="button" value="리뷰작성" onclick="reviewdirect()"></li>
				</c:if>	
			</ul>
		</div>
		<c:forEach items="${hrlist}" var="hrlist">
			<div class="hc_review_content">
				<div class="hr_rating"> 
				<c:forEach var="rating" begin="1" end="${hrlist.rating}"><img src="resources/img/star.PNG" width="20"></c:forEach>
				</div>
				<div class="hr_detail">${hrlist.nickname}&nbsp; ${hrlist.writeday}</div>
				<div class="hr_content">${hrlist.content}</div>
				<c:if test="${userid==hrlist.userid }">
				<div class="hr_revise">
					<a href="javascript:hupdate(${hrlist.id})">수정</a>
				</div>
				<div class="hr_revise">
					<a href="javascript:hdelete(${hrlist.id},${hdto.id})">삭제</a>
				</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
	<!-- 페이지출력 -->
	<div id="reviewpage">
		<c:forEach begin="${pstart}" end="${pend}" var="i">
			<c:if test="${page==i}">
				<a href="hcontent?id=${hdto.id}&page=${i}" style="color:#57c006;">${i}</a>
			</c:if>
			<c:if test="${page!=i}">
				<a href="hcontent?id=${hdto.id}&page=${i}">${i}</a>
			</c:if>
		</c:forEach>
	</div>
	<!-- 리뷰작성 -->
	<div id="hc_review" class="container">
		<div class="reviewtit">리뷰작성</div>
		<form name="hreviewform" method="post" action="hreview_ok">
			<input type="hidden" name="userid" value="${userid}">
			<input type="hidden" name="nickname" value="${nickname}">
			<input type="hidden" name="pid" value="${hdto.id}">
			<input type="hidden" name="rating" value="1">
			<c:if test="${userid!=null}">
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
				<div style="color:#aaa;" id="counter">(0 / 300)</div>
				<textarea id="recontent" name="content" placeholder="리뷰는 최소 10자 이상,최대 300자 까지 작성 가능합니다" rows="3" style="width:80%;"></textarea>
				<input id="submitbtt" type="button" onclick="reviewcheck(this.form)" value="등록">
			</c:if>
			<c:if test="${userid==null}">
				<div id="hc_rating2">
				<span>평점 :</span>
				<select disabled="disabled" name="rating">
					<c:forEach var="i" begin="1" end="5">
						<option name="rating" value="${6-i}">${6-i}</option>
					</c:forEach>
				</select>
				</div>
				<textarea name="content" placeholder="리뷰는 회원만 작성 가능합니다" rows="3" disabled="disabled" style="width:80%;"></textarea>
				<input id="submitbtt2" type="button" onclick="location='login'" value="로그인">
			</c:if>
		</form>			
	</div>
</div>
<c:import url="../bottom.jsp"/>