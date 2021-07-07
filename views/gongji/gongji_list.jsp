<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" href="resources/css/gongji.css" type="text/css">


<script>
	$(document).ready(function() {
		$(".menu>a").click(function() {
			var submenu = $(this).next("ul");
			$(".hide").slideUp();
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
	

	function gdelete(id)
	{
		var del_chk=window.confirm("삭제하시겠습니까?")
		if(del_chk==true)
		{
			location.href="gongji_delete?id="+id;
		}
	}
</script>

</head>
<div class="sub_bg">
	<div class="contents_area">
		<c:forEach var="gldto" items="${list}">
			<div>
				<ul class="head">
					<li class="menu"><a>${gldto.head}</a>
						<ul class="hide">
							<li>${gldto.body}
							<c:if test="${userid == 'admin'}">
									<div>
										<button onclick="location='gongji_update?id=${gldto.id}'">수정</button>
										<button onclick="javascript:gdelete(${gldto.id})">삭제</button>
									</div>
							</c:if>	
							</li>
						</ul></li>
				</ul>
			</div>
			<br>
		</c:forEach>

		<div class="page_index">
			<!-- 이전 페이지 이동 -->
			<!-- 10페이지 이전 이동 -->
			<c:if test="${pstart!= 1}">
				<a href="gongji_list?page=${pstart-1}"> << </a>
			</c:if>
			<c:if test="${pstart==1}}">
			  <<
			 </c:if>
			<!-- 10페이지 이전 이동 끝-->
			<!-- 1페이지 이전 이동 (현재페이지에서 1페이지 이전)-->
			<c:if test="${page>1}">
				<a href="gongji_list?page=${page-1}"> < </a>
			</c:if>
			<c:if test="${page == 1}">
				 <
			</c:if>
			<!-- 1페이지 이전 이동 끝-->

			<!-- 이전 페이지 이동  끝-->
			<c:forEach begin="${pstart}" end="${pend}" var="i">
				<c:if test="${page==i}">
					<a href="gongji_list?page=${i}" style="color: red"> ${i} </a>
				</c:if>
				<c:if test="${page!=i}">
					<a href="gongji_list?page=${i}"> ${i} </a>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지 이동 -->
			<!-- 다음 1페이지 이동 -->
			<c:if test="${page != pagecnt}">
				<a href="gongji_list?page=${page+1}"> > </a>
			</c:if>
			<c:if test="${page == pagecnt}">
				 >
			</c:if>
			<!-- 다음 1페이지 이동 끝-->

			<!-- 다음 10페이지 이동 -->
			<c:if test="${pend != pagecnt }">
				<a href="gongji_list?page=${pend+1}"> >> </a>
			</c:if>
			<c:if test="${pend == pagecnt }">

			</c:if>
			<!-- 다음 10페이지 이동 끝-->
			<!-- 다음 페이지 이동 끝-->
		</div>
		<br>
	</div>
	<div class="right_area">
		<ul class="head">
			<li class="menu"><a href="gongji_list" style="color:green">공지사항</a></li><br>
			<li class="menu"><a href="gongji_qna">도움말</a></li><br>
			<li class="menu">
             <c:if test="${userid != null && userid != 'admin'}">
                     <a href="gongji_client">1대1 문의</a>
             </c:if>
             <c:if test="${userid == null }">
             		<a href="javascript:gongjialert()">1대1 문의</a>
             </c:if>
             <c:if test="${userid == 'admin' }">
             		<a href="admin_client_list">1대1 문의</a>
             </c:if>
			</li>
		</ul>

	</div>
</div>


<%@ include file="../bottom.jsp"%>