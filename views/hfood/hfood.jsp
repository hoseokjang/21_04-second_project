<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<style>
	#hfood_box {
	font-family: 'Noto Sans KR', sans-serif;
	text-align:center;width:1140px;margin:auto;
	}
	#hfood_box ul {
	list-style-type:none;
	padding-inline-start:0px;
	}
	#hfood_box ul li {
	display:inline-block;
	}
	#hfood_box .hcategory {
	width:1090px;
	border:1px solid #e5e5e5;
	text-align:left;
	position:relative;
	left:0px;
	}
	#hfood_box .hcategory ul{
	display:inline-block;
	position:relative;
	padding-left:5px;
	left:30px;
	border-left:1px solid #e5e5e5;
	}
	#hfood_box .hcategory ul li{
	border-right:2px dotted #e5e5e5;
	margin:10px 0px 10px 0px;
	padding:4px 8px 4px 7px;
	}
	#hfood_box .hcategory a {
	text-decoration:none;
    color: #666;
    font-size: 15px;
    line-height: 1;
    font-weight: 300;
    }
	#hfood_box a:hover {
	color:#57c006;
	}
	#hfood_box #hfood_cnt {
	display:inline-block;
	left:-400px;
	}
	#hfood_box .inner {
	display:inline-block;
	position:relative;
	}
	#hfood_box #hfood_cnt span{
	font-size:25px;
	color:#57c006;
	}
	#hfood_box #hfood_order {
	right:-400px;
	}
	#hfood_box #sub_category {
	position:relative;
	border-top:0px;
	top:-18px;
	padding-top:16px;
	}
	#hfood_box #hfood_list ul {
	width:1100px;
	}
	#hfood_box #hfood_list ul li{
	height:440px;
	position:relative;
	padding:7px 12px 7px 12px;
	}
	
	#hfood_box #hfood_list .prodbox{
	text-align:left;
	width:245px;
	display:inline-block;
	position:absolute;
	left:12px;
	}
	#hfood_box #hfood_list a{
	text-decoration:none;
	color:black;
	}
	#hfood_box .prodname {
	font-size:14px;
	}
	#hfood_box .prodprice {
	font-size:20px;
	font-weight:550;
	}
	#hfood_box .ctg_tit {
	position:relative;
	display:inline-block;
	left:18px;
	color:#57c006;
	font-weight: 550;
	}
	#hfood_box #h_ctg_tit {
	top:-174px;
	}
	#hfood_box #rctgnone {
    color: #666;
    font-size: 15px;
    line-height: 1;
    font-weight: 300;
	}
	#hfood_box #hfood_list {
	text-align:left;
	padding-left:11px;
	margin-bottom:20px;
	}
	#hfood_box .hempty {
	height:420px;
	}
	#searchbox {
	margin:0px;
	width:250px;
	height:40px;
	border-top:2px solid #57c006;
	border-left:2px solid #57c006;
	border-right:1px solid #57c006;
	border-bottom:2px solid #57c006;
	}
	#searchbar {
	padding-left:5px;
	border:0px;
	height:94%;
	width:215px;
	}
	#searchbutton {
	right:10px;
	border:0px;
	background:white;
	height:90%;	
	padding:0px 0px 0px 0px;
	cursor:pointer;
	}
	#resets {
	position:relative;
	top:-32px;
	left:920px;
	}
	#resets a {
	color:black;
	font-size:14px;
	font-weight:550;
	}
	.emptytit {
	font-size:22px;
	font-weight:600;
	color:#666666;
	position:relative;
	top:130px;
	}
	.emptysub {
	text-align:left;
	font-size:14px;
	font-weight:550;
	color:#666666;
	position:relative;
	top:200px;
	}
	.emptyimg {
	position:relative;
	top:100px;
	}
</style>
<script>
	
	function searchtest(form) 
	{
		var pattern=/\s/g;
		
		var chk=document.searchform.searchbar.value;
		chk.trim();
		if(chk.length<1)
		{
			alert("검색어는 최소 한글자 이상 입력해주세요");
			document.searchform.searchbar.focus();
		}
		else if(chk.match(pattern))
		{
			alert("공백,띄어쓰기 없이 입력해주세요");
			document.searchform.searchbar.focus();
		}
		else
		{
			form.submit();
		}
	} 
</script>
<c:set var="style1" value="background:#57c006;color:white;border-radius:20px;padding:5px;"/>
<div id="hfood_box">
<div id="hfood1" class="hcontainer">
	<c:if test="${rsctg==null}">
	<form method="post" name="searchform" action="hfood">
	</c:if>
	<c:if test="${rsctg!=null}">
	<form method="post" name="searchform" action="hfood?ctg=${rctg}&sctg=${rsctg}">
	</c:if>
		<div id="searchbox">
			<c:if test="${search==null}">
				<input type="text" id="searchbar" name="searchbar" placeholder="검색어를 입력하세요"
				onfocus="this.placeholder=''" onblur="this.placeholder='검색어를 입력하세요'"
				onkeypress="if(event.keyCode=='13'){event.preventDefault();searchtest(this.form);}">
			</c:if>
			<c:if test="${search!=null}">
				<input type="text" id="searchbar" name="searchbar" placeholder="${search} 검색결과"
				onfocus="this.placeholder=''" onblur="this.placeholder='${search} 검색결과'"
				onkeypress="if(event.keyCode=='13'){event.preventDefault();searchtest(this.form);}">
			</c:if>
			<button type="button" onclick="searchtest(this.form)" id="searchbutton"><img src="resources/img/search.png" width="20" height="20"></button>
			<span id="resets"><a href="hfood">검색 초기화 ↺</a></span>		
		</div>
	</form>
	<div id="hfood_category" class="hcategory">
	<div id="h_ctg_tit" class="ctg_tit">건강별</div>
		<ul>
		<c:forEach items="${ctgname}" var="ctg" begin="0" end="7">
			<c:if test="${ctg.ctg == rctg}">
				<li><a href="ctgreadnum?ctg=${ctg.ctg}" style="${style1}">${ctg.ctgname}</a></li>
			</c:if>
			<c:if test="${ctg.ctg != rctg}">
				<li><a href="ctgreadnum?ctg=${ctg.ctg}">${ctg.ctgname}</a></li>
			</c:if>
		</c:forEach>
		<p>
		<c:forEach items="${ctgname}" var="ctg"  begin="8" end="16">
			<c:if test="${ctg.ctg == rctg}">
				<li><a href="ctgreadnumctg=${ctg.ctg}" style="${style1}">${ctg.ctgname}</a></li>
			</c:if>
			<c:if test="${ctg.ctg != rctg}">
				<li><a href="ctgreadnum?ctg=${ctg.ctg}">${ctg.ctgname}</a></li>
			</c:if>
		</c:forEach>
		<p>
		<c:forEach items="${ctgname}" var="ctg"  begin="17" end="25">
			<c:if test="${ctg.ctg == rctg}">
				<li><a href="ctgreadnum?ctg=${ctg.ctg}" style="${style1}">${ctg.ctgname}</a></li>
			</c:if>
			<c:if test="${ctg.ctg != rctg}">
				<li><a href="ctgreadnum?ctg=${ctg.ctg}">${ctg.ctgname}</a></li>
			</c:if>
		</c:forEach>
		<p>
		<c:forEach items="${ctgname}" var="ctg"  begin="26" end="32">
			<c:if test="${ctg.ctg == rctg}">
				<li><a href="ctgreadnum?ctg=${ctg.ctg}" style="${style1}">${ctg.ctgname}</a></li>
			</c:if>
			<c:if test="${ctg.ctg != rctg}">
				<li><a href="ctgreadnum?ctg=${ctg.ctg}">${ctg.ctgname}</a></li>
			</c:if>
		</c:forEach>
		</ul>
	</div>
	<c:if test="${rctg!=null}">
	<div id="sub_category" class="hcategory">
	<div id="sub_ctg_tit" class="ctg_tit">원료별</div>
		<ul>
		<c:forEach items="${material}" var="mtl">
			<c:if test="${mtl.material == rsctg }">
				<li><a href="hfood?ctg=${mtl.ctg}&sctg=${mtl.material}" style="${style1};">${mtl.material}</a></li>
			</c:if>
			<c:if test="${mtl.material != rsctg }">
				<li><a href="hfood?ctg=${mtl.ctg}&sctg=${mtl.material}">${mtl.material}</a></li>
			</c:if>
		</c:forEach>
		</ul>
	</div>
	</c:if>
	<!-- 건강식품 페이지 처음접속시 아무것도 없을때 본문내용 -->
	<c:if test="${rctg==null}">
	<div id="sub_category" class="hcategory">
	<div id="sub_ctg_tit" class="ctg_tit">원료별</div>
		<ul>
			<li id="rctgnone">건강 카테고리를 먼저 선택해주세요</li>
		</ul>
	</div>
	</c:if>
	<c:if test="${rctg==null && list.size()==0 && search==null}">
	<div class="hempty">
		<div class="emptyimg"><img src="resources/img/hfoodalert.png" height="80" width="80"></div>
		<div class="emptytit">건강별,원료별 카테고리에서 <br>원하시는 항목을 선택하시면 해당 상품 리스트를 보실 수 있습니다.</div>
		<div class="emptysub">건강식품 상품정보는 식품안전나라에서 명시한 기능성인정원료를 기준으로 네이버 오픈 API 쇼핑검색결과를 이용하였습니다.</div>
		<div class="emptysub"><참조 : 식품안전나라 건강기능식품 기능별 정보><p>
			<a href="https://www.foodsafetykorea.go.kr/portal/healthyfoodlife/functionality.do?menu_grp=MENU_NEW01&menu_no=2657">
			https://www.foodsafetykorea.go.kr/portal/healthyfoodlife/functionality.do?menu_grp=MENU_NEW01&menu_no=2657
			</a>
		</div>
	</div>
	</c:if>
	<!-- 건강 카테고리만 선택했을때 본문내용 -->
	<c:if test="${rctg!=null&&search==null&&list.size()==0}">
		<div class="hempty">
			<div class="emptyimg"><img src="resources/img/hfoodalert.png" height="80" width="80"></div>		
			<div class="emptytit">원료를 선택해주세요</div>
		</div>
	</c:if>
	<c:if test="${rctg!=null&&search!=null&&list.size()==0}">
		<div class="hempty">
			<div class="emptyimg"><img src="resources/img/hfoodalert.png" height="80" width="80"></div>		
			<div class="emptytit">검색 결과가 없습니다</div>
		</div>
	</c:if>
	<c:if test="${rctg==null && list.size()==0 && search!=null}">
		<div class="hempty">
			<div class="emptyimg"><img src="resources/img/hfoodalert.png" height="80" width="80"></div>		
			<div class="emptytit">검색 결과가 없습니다</div>
		</div>
	</c:if>
	<c:if test="${list.size()!=0}">
	<div id="hfood_list" style="text-align:left;">
		<ul>
		<c:forEach items="${list}" var="hdto">
			<li>
				<a href="hreadnum?id=${hdto.id}">	
					<img src="resources/img/hfood/${hdto.productid}.jpg" width="240" height="240"><p>
					<div class="prodbox">
						<span class="prodname">${hdto.name}</span><p>
						<span class="prodprice"><fmt:formatNumber value="${hdto.lprice}"></fmt:formatNumber></span>원<br>
						<span class="prodrating">평점 : ${hdto.jumsu}/5.0</span><br>
					</div>
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	</c:if>
</div>
</div>
<c:import url="../bottom.jsp"/>