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
	
	function qdelete(id)
	{
		var del_chk=window.confirm("삭제하시겠습니까?")
		if(del_chk==true)
		{
			location.href="qna_delete?id="+id;
		}
	}

</script>

</head>
<div class="sub_bg">
	<div class="contents_area">
		<c:forEach var="gqdto" items="${list}">
			<div>
				<ul class="head">
					<li class="menu"><a>${gqdto.head}</a>
						<ul class="hide">
							<li>${gqdto.body}
							<c:if test="${userid == 'admin'}">
									<div>
										<button onclick="location='qna_update?id=${gqdto.id}'">수정</button>
										<button onclick="javascript:qdelete(${gqdto.id})">삭제</button>
									</div>
							</c:if>	
							</li>
						</ul></li>
				</ul>
			</div>
			<br>
		</c:forEach>

	</div>
	<div class="right_area">
		<ul class="head">
			<li class="menu"><a href="gongji_list">공지사항</a></li><br>
			<li class="menu"><a href="gongji_qna" style="color:green">도움말</a></li><br>
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