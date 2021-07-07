<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp" />
<style>
#recipe_detail {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0 auto;
	align: center;
	width: 1100px;
}

#materials ul {
	list-style-type: none;
	padding-inline-start: 0px;
}

#materials ul li {
	display: inline-block;
}
</style>
<script type="text/javascript">
	function recipelike1(recipe_code, userid) {
		var chk = new XMLHttpRequest();
		var recipe_code = recipe_code;
		var userid = userid;
		chk.open("get", "recipe_like1?recipe_code=" + recipe_code + "&userid="
				+ userid);
		chk.send();
		chk.onreadystatechange = function() {
			if (chk.readyState === 4) {
				if (chk.responseText === "1") {
					location.reload();
				}
			}
		}
	}
	function recipelike2(recipe_code, userid) {
		var chk2 = new XMLHttpRequest();
		var recipe_code = recipe_code;
		var userid = userid;
		chk2.open("get", "recipe_like2?recipe_code=" + recipe_code + "&userid="
				+ userid);
		chk2.send();
		chk2.onreadystatechange = function() {
			if (chk2.readyState == 4) {
				if (chk2.responseText == "1") {
					location.reload();
				}
			}
		}
	}
</script>
<div id="recipe_detail">
	<div id="recipe_info" align="center">
		<div id="recipe_image" class="picture">
			<img src="resources/img/recipe/${rdetail.recipecode}.jpg" width="600"
				height="500">
		</div>
		<br>
		<div id="recipe_title">
			<h2 style="display: inline-block">${rdetail.name}</h2>
			&nbsp;
			<c:if test="${rlike!=null}">
				<c:if test="${rlike == 0}">
					<div style="display: inline-block">
						<span id="unlike"
							onclick="recipelike1('${rdetail.recipecode}', '${userid}')"
							style="cursor: pointer; display: inline-block; width: 90px; height: 25px; background: #F7F7F7">
							좋아요 <span style="display: inline-block;"><img
								src="resources/img/heart1.PNG" width=17px;></span> <span
							style="display: inline-block; color: #D23B01; background: #F7F7F7">${likecnt}</span>
						</span> <span id="like"
							onclick="recipelike2('${rdetail.recipecode}', '${userid}')"
							style="cursor: pointer; display: none; width: 30px; height: 40px; background: #F7F7F7">
							좋아요 <img src="resources/img/heart2.PNG" width=17px;>
						</span>
					</div>
				</c:if>
				<c:if test="${rlike == 1}">
					<div style="display: inline-block;">
						<span id="unlike"
							onclick="recipelike1('${rdetail.recipecode}', '${userid}')"
							style="cursor: pointer; display: none; width: 30px; height: 40px; background: #F7F7F7">
							좋아요 <img src="resources/img/heart1.PNG" width=17px;>
						</span> <span id="like"
							onclick="recipelike2('${rdetail.recipecode}', '${userid}')"
							style="cursor: pointer; display: inline-block; width: 90px; height: 25px; background: #F7F7F7">
							좋아요 <span style="display: inline-block;"><img
								src="resources/img/heart2.PNG" width=17px;
								style="display: inline-block;"></span> <span
							style="display: inline-block; color: #D23B01; background: #F7F7F7">${likecnt}</span>
						</span>
					</div>
				</c:if>
			</c:if>
			<c:if test="${rlike==null}">
				<div style="display: inline-block">
					<span id="unlike"
						style="cursor: pointer; display: inline-block; width: 90px; height: 25px; background: #F7F7F7">
						좋아요 <span style="display: inline-block;"><img
							src="resources/img/heart1.PNG" width=17px;></span> <span
						style="display: inline-block; color: #D23B01; background: #F7F7F7">${likecnt}</span>
					</span>
				</div>
			</c:if>
		</div>
		<div id="recipe_ep" style="color: #AAAAAA">${rdetail.detail}</div>
		<br>
		<div id="recipe_detail_info">
			<c:if test="${rdetail.inbun!=' '}">
				<div id="inbun" style="display: inline-block; padding: 50px;">
					<img src="resources/img/inbun.PNG" width=40>
					<div id="inbun" style="color: #BCB7B7">${rdetail.inbun}</div>
				</div>
			</c:if>
			<c:if test="${rdetail.time!=' '}">
				<div id="time" style="display: inline-block; padding: 50px;">
					<img src="resources/img/time.PNG" width=35>
					<div id="time" style="color: #BCB7B7">${rdetail.time}</div>
				</div>
			</c:if>
			<c:if test="${rdetail.diff!=' '}">
				<div id="diff" style="display: inline-block; padding: 50px;">
					<img src="resources/img/diff.PNG" width=50>
					<div id="diff" style="color: #BCB7B7">${rdetail.diff}</div>
				</div>
			</c:if>
		</div>
	</div>
	<hr size="3">
	<div id="materials">
		<div id="materials_top">
			<span style="display: inline-block">
				<h4>재료</h4>
			</span> <span style="color: #CCCCCC"> Ingredients </span>
		</div>
		<p>
			<c:forEach begin="1" end="24" var="i">
				<c:set var="mname" value="ingrename_${i}" />
				<c:set var="mquan" value="ingrequan_${i}" />
				<c:if test="${rdetail[mname]!=' '}">
					<ul style="padding-left: 40px;">
						<li>
							<h5 style="display: inline-block">${rdetail[mname]}</h5>
							<h5 style="color: #999999; display: inline-block">${rdetail[mquan]}</h5>
						</li>
					</ul>
				</c:if>
			</c:forEach>
	</div>
	<hr>
	<div id="steps">
		<div id="steps_top">
			<span style="display: inline-block">
				<h4>조리순서</h4>
			</span> <span style="color: #CCCCCC"> Steps </span>
		</div>
		<br>
		<c:forEach begin="1" end="21" var="j">
			<c:set var="ss" value="step_${j}" />
			<c:if test="${rdetail[ss]!=' '}">
				<div id="step${j}" class="picture"
					style="display: inline-block; padding-right: 10px;">
					<img src="resources/img/step/${rdetail.recipecode}_step${j}.jpg"
						width="300" height="300" style="display: inline-block">
				</div>
				<div style="display: inline-block; width: 770px;">
					<span style="display: inline-block; width: 45px;">
						<h4
							style="background: #57c006; color: white; border-radius: 100px; padding-top: 8px; padding-bottom: 8px; padding-left: 14px;">${j}</h4>
					</span> <span style="display: inline-block;"> ${rdetail[ss]} </span>
				</div>
				<hr>
			</c:if>
		</c:forEach>
	</div>
	<div id="tips">
		<div id="tips_top">
			<span style="display: inline-block">
				<h4>팁/주의사항</h4>
			</span> <span style="color: #CCCCCC"> Tips </span>
		</div>
		<br> ${rdetail.tip}
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<c:import url="../bottom.jsp" />