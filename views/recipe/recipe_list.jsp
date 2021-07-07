<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<style>
	#recipe {
	font-family: 'Noto Sans KR', sans-serif;
	}
	#recipe ul {
	list-style-type:none;
	padding-inline-start:0px;
	}
	#recipe ul li {
	display:inline-block;
	}
	#recipe .rcontainer {
	text-align:center;width:1140px;margin:auto;
	}
	#recipe .rcategory {
	width:1090px;
	border:1px solid #e5e5e5;
	text-align:left;
	valign:middle;
	position:relative;
	left:0px;
	}
	#recipe .rcategory ul{
	display:inline-block;
	width:1000px;
	position:relative;
	padding-left:5px;
	left:30px;
	border-left:1px solid #e5e5e5;
	}
	#recipe .rcategory ul li{
	border-right:2px dotted #e5e5e5;
	margin:10px 0px 10px 0px;
	padding:4px 8px 4px 7px;
	}
	#recipe .rcategory a {
	text-decoration:none;
    color: #666;
    font-size: 15px;
    line-height: 1;
    font-weight: 300;
    }
	#recipe .rcategory a:hover {
	color:#57c006;
	}
	#recipe .inner {
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
	#recipe #recipe_list ul {
	width:1100px;
	}
	#recipe #recipe_list ul li{
	height:400px;
	position:relative;
	padding:50px 12px 7px 12px;
	}
	#recipe #recipe_list .recipebox{
	text-align:center;
	width:245px;
	display:inline-block;
	position:absolute;
	left:12px;
	}
	#recipe #recipe_list a{
	text-decoration:none;
	color:black;
	}
	#recipe #recipe_list a:hover {
	text-decoration:underline; 
	}
	#recipe .recipename {
	font-size:14px;
	}
	#recipe .ctg_tit {
	position:relative;
	display:inline-block;
	left:18px;
	color:#57c006;
	font-weight: 550;
	}
	#recipe #r_ctg_tit {
	top:-43px;
	}
	#recipe #rctgnone {
    color: #666;
    font-size: 15px;
    line-height: 1;
    font-weight: 300;
	}
	#recipe #sub_ctg_tit{
	position:relative;
	top:0px;
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
   z-index:1;
   right:10px;
   border:0px;
   background:white;
   height:100%;   
   padding:1px 0px 0px 0px;
   cursor:pointer;
   }
</style>
<c:set var="style1" value="background:#57c006;color:white;border-radius:20px;padding:5px;"/>
<div id="recipe">
<!-- 카테고리 시작 -->
<div id="recipe1" class="rcontainer" align="center">
	<form method="post" action="recipe_list">
		<div id="searchbox">
	    	<c:if test="${search==null}">
	      		<input type="text" id="searchbar" name="searchbar" placeholder="검색어를 입력하세요">
	    	</c:if>
	    	<c:if test="${search!=null}">
	      		<input type="text" id="searchbar" name="searchbar" placeholder="${search} 검색결과"
	      		onfocus="this.placeholder=''" onblur="this.placeholder='${search} 검색결과'">
	    	</c:if>
	      	<button type="submit" id="searchbutton"><img src="resources/img/search.png" width="20" height="20"></button>      
	   	</div>
   	</form>
	<div id="recipe_category" class="rcategory">
	<div id="r_ctg_tit" class="ctg_tit">건강별</div>
		<ul>
		<c:forEach items="${elist}" var="elist">
			<c:if test="${elist.ctg == rctg}">
				<li><a href="mreadnum?ctg=${elist.ctg}" style="${style1}">${elist.effect}</a></li>
			</c:if>
			<c:if test="${elist.ctg != rctg}">
				<li><a href="mreadnum?ctg=${elist.ctg}">${elist.effect}</a></li>
			</c:if>
		</c:forEach>
		</ul>
	</div>
	<c:if test="${rctg != null}">
	<div id="sub_category" class="rcategory">
	<div id="sub_ctg_tit" class="ctg_tit">재료별</div>
		<ul>
		<c:forEach items="${mlist}" var="mlist">
			<c:if test="${mlist.material == rmtl}">
				<li><a href="recipe_list?ctg=${mlist.ctg}&mtl=${mlist.material}" style="${style1}">${mlist.material}</a></li>
			</c:if>
			<c:if test="${mlist.material != rmtl}">
				<li><a href="recipe_list?ctg=${mlist.ctg}&mtl=${mlist.material}">${mlist.material}</a></li>
			</c:if>
		</c:forEach>
		</ul>
	</div>
	</c:if>
	<c:if test="${rctg == null}">
	<div id="sub_category" class="rcategory">
	<div id="sub_ctg_tit" class="ctg_tit">재료별</div>
		<ul>
			<li id="rctgnone">건강 카테고리를 먼저 선택해주세요</li>
		</ul>
	</div>
	<div>
		&nbsp;
	</div>
	</c:if>
	<!-- 카테고리 끝 -->
</div>
<div id="recipe2" class="rcontainer" align="center">
	<!-- 레시피 리스트 시작 -->
	<div id="recipe_list">
	<c:if test="${search != null}">
	<c:set var="i" value="1"/>
		<ul>
		<c:forEach var="rdto" items="${rlists}">
			<li>
				<a href="readnum?recipe_code=${rdto.recipecode}">
					<img src="resources/img/recipe/${rdto.recipecode}.jpg" width="240" height="240"> <p>
					<div class="recipebox">
						<span class="recipename">${rdto.name}</span><p>
						<span style="color:#999999"> 조회수 ${rdto.readnum}</span>
						<span id="unlike" style="display:inline-block; width:90px; height:25px;background:#F7F7F7"> 좋아요 
							<span style="display:inline-block;"><img src="resources/img/heart1.PNG" width=17px;></span>
							<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${rdto.r_like}</span>
						</span>
					</div>
				</a>
			</li>
		</c:forEach>
		</ul>
		<div id="page">
			<c:if test="${pages>10}">
				<a href="recipe_list?page=${pages-10}"> ≪ </a>
			</c:if>
			<c:if test="${pages<=10}">
				<a href="recipe_list?page=1"> ≪ </a>
			</c:if>
			<c:if test="${pages==1}">
				<a href="recipe_list?page=1"> ＜ </a>
			</c:if>
			<c:if test="${pages!=1}">
				<a href="recipe_list?page=${pages-1}"> ＜ </a>
			</c:if>
			<c:forEach begin="${pstarts}" end="${pends}" var="ps">
			<c:if test="${pages==ps}">
				<a href="recipe_list?page=${ps}" style="color:#57c006;"> ${ps}</a>
			</c:if>
			<c:if test="${pages!=ps}">
				<a href="recipe_list?page=${ps}"> ${ps}</a>
			</c:if>
			</c:forEach>
			<c:if test="${pages!=pagecnts}">
				<a href="recipe_list?page=${pages+1}"> ＞  </a>
			</c:if>
			<c:if test="${pages==pagecnts}">
				<a href="recipe_list?page=${pagecnts}"> ＞  </a>
			</c:if>
			<c:if test="${pages<=pagecnts-10}">
				<a href="recipe_list?page=${pages+10}"> ≫  </a>
			</c:if>
			<c:if test="${pages>pagecnts-10}">
				<a href="recipe_list?page=${pagecnts}"> ≫  </a>
			</c:if>
		</div>
	</c:if>
	<c:if test="${rctg == null && search == null}">
	<c:set var="i" value="1"/>
		<ul>
		<c:forEach var="rdto" items="${rlist}">
			<li>
				<a href="readnum?recipe_code=${rdto.recipecode}">
					<img src="resources/img/recipe/${rdto.recipecode}.jpg" width="240" height="240"> <p>
					<div class="recipebox">
						<span class="recipename">${rdto.name}</span><p>
						<span style="color:#999999"> 조회수 ${rdto.readnum}</span>
						<span id="unlike" style="display:inline-block; width:90px; height:25px;background:#F7F7F7"> 좋아요 
							<span style="display:inline-block;"><img src="resources/img/heart1.PNG" width=17px;></span>
							<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${rdto.r_like}</span>
						</span>
					</div>
				</a>
			</li>
		</c:forEach>
		</ul>
		<div id="page">
			<c:if test="${page>10}">
				<a href="recipe_list?page=${page-10}"> ≪ </a>
			</c:if>
			<c:if test="${page<=10}">
				<a href="recipe_list?page=1"> ≪ </a>
			</c:if>
			<c:if test="${page==1}">
				<a href="recipe_list?page=1"> ＜ </a>
			</c:if>
			<c:if test="${page!=1}">
				<a href="recipe_list?page=${page-1}"> ＜ </a>
			</c:if>
			<c:forEach begin="${pstart}" end="${pend}" var="p">
			<c:if test="${page==p}">
				<a href="recipe_list?page=${p}" style="color:#57c006;"> ${p}</a>
			</c:if>
			<c:if test="${page!=p}">
				<a href="recipe_list?page=${p}"> ${p}</a>
			</c:if>
			</c:forEach>
			<c:if test="${page!=pagecnt}">
				<a href="recipe_list?page=${page+1}"> ＞  </a>
			</c:if>
			<c:if test="${page==pagecnt}">
				<a href="recipe_list?page=${pagecnt}"> ＞  </a>
			</c:if>
			<c:if test="${page<=pagecnt-10}">
				<a href="recipe_list?page=${page+10}"> ≫  </a>
			</c:if>
			<c:if test="${page>pagecnt-10}">
				<a href="recipe_list?page=${pagecnt}"> ≫  </a>
			</c:if>
		</div>
	</c:if>
	<c:if test="${rctg!=null && rmtl==null && search == null}">
	<c:set var="i" value="1"/>
		<ul>
		<c:forEach var="rdto1" items="${rlist1}">
			<li>
				<a href="readnum?recipe_code=${rdto1.recipecode}">
					<img src="resources/img/recipe/${rdto1.recipecode}.jpg" width="240" height="240"> <p>
					<div class="recipebox">
						<span class="recipename">${rdto1.name}</span><p>
						<span style="color:#999999"> 조회수 ${rdto1.readnum}</span>
						<span id="unlike" style="display:inline-block; width:90px; height:25px;background:#F7F7F7"> 좋아요 
							<span style="display:inline-block;"><img src="resources/img/heart1.PNG" width=17px;></span>
							<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${rdto1.r_like}</span>
						</span>
					</div>
				</a>
			</li>
		</c:forEach>
		</ul>
		<div id="page1">
			<c:if test="${page1>10}">
				<a href="recipe_list?ctg=${rctg}&page1=${page1-10}"> ≪ </a>
			</c:if>
			<c:if test="${page1<=10}">
				<a href="recipe_list?ctg=${rctg}&page1=1"> ≪ </a>
			</c:if>
			<c:if test="${page1==1}">
				<a href="recipe_list?ctg=${rctg}&page1=1"> ＜ </a>
			</c:if>
			<c:if test="${page1!=1}">
				<a href="recipe_list?ctg=${rctg}&page1=${page1-1}"> ＜ </a>
			</c:if>
			<c:forEach begin="${pstart1}" end="${pend1}" var="p1">
			<c:if test="${page1==p1}">
				<a href="recipe_list?ctg=${rctg}&page1=${p1}" style="color:#57c006;"> ${p1}</a>
			</c:if>
			<c:if test="${page1!=p1}">
				<a href="recipe_list?ctg=${rctg}&page1=${p1}"> ${p1}</a>
			</c:if>
			</c:forEach>
			<c:if test="${page1!=pagecnt1}">
				<a href="recipe_list?ctg=${rctg}&page1=${page1+1}"> ＞  </a>
			</c:if>
			<c:if test="${page1==pagecnt1}">
				<a href="recipe_list?ctg=${rctg}&page1=${pagecnt1}"> ＞  </a>
			</c:if>
			<c:if test="${page1<=pagecnt1-10}">
				<a href="recipe_list?ctg=${rctg}&page1=${page1+10}"> ≫  </a>
			</c:if>
			<c:if test="${page1>pagecnt1-10}">
				<a href="recipe_list?ctg=${rctg}&page1=${pagecnt1}"> ≫  </a>
			</c:if>
		</div>
	</c:if>
	<c:if test="${rctg!=null && rmtl!=null && search == null}">
	<c:set var="i" value="1"/>
		<ul>
		<c:forEach var="rdto2" items="${rlist2}">
			<li>
				<a href="readnum?recipe_code=${rdto2.recipecode}">
					<img src="resources/img/recipe/${rdto2.recipecode}.jpg" width="240" height="240"> <p>
					<div class="recipebox">
						<span class="recipename">${rdto2.name}</span><p>
						<span style="color:#999999"> 조회수 ${rdto2.readnum}</span>
						<span id="unlike" style="display:inline-block; width:90px; height:25px;background:#F7F7F7"> 좋아요 
							<span style="display:inline-block;"><img src="resources/img/heart1.PNG" width=17px;></span>
							<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${rdto2.r_like}</span>
						</span>
					</div>
				</a>
			</li>
		</c:forEach>
		</ul>
		<div id="page2">
			<c:if test="${page2>10}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=${page2-10}"> ≪ </a>
			</c:if>
			<c:if test="${page2<=10}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=1"> ≪ </a>
			</c:if>
			<c:if test="${page2==1}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=1"> ＜ </a>
			</c:if>
			<c:if test="${page2!=1}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=${page2-1}"> ＜ </a>
			</c:if>
			<c:forEach begin="${pstart2}" end="${pend2}" var="p2">
			<c:if test="${page2==p2}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=${p2}" style="color:#57c006;"> ${p2}</a>
			</c:if>
			<c:if test="${page2!=p2}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=${p2}"> ${p2}</a>
			</c:if>
			</c:forEach>
			<c:if test="${page2!=pagecnt2}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=${page2+1}"> ＞  </a>
			</c:if>
			<c:if test="${page2==pagecnt2}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=${pagecnt2}"> ＞  </a>
			</c:if>
			<c:if test="${page2<=pagecnt2-10}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=${page2+10}"> ≫  </a>
			</c:if>
			<c:if test="${page2>pagecnt2-10}">
				<a href="recipe_list?ctg=${rctg}&mtl=${rmtl}&page=${pagecnt2}"> ≫  </a>
			</c:if>
		</div>
	</c:if>
	</div>
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<c:import url="../bottom.jsp"/>