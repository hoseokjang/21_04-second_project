<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<style>
	#recipe_detail {
	font-family: 'Noto Sans KR', sans-serif; margin:0 auto; align:center;
	width:1100px;
	}
	#materials ul{
	list-style-type:none;
	padding-inline-start:0px;
	}
	#materials ul li {
	display:inline-block;
	}
</style>
<script>
	function del(mr_id){
		var confirm = window.confirm("정말 삭제하시겠습니까?");
		if(confirm == true){
			alert("삭제가 완료되었습니다.");
			location.href="member_recipe_delete?mr_id="+mr_id;
		}
	}
	function setThumbnail() { 
	      for (var image of event.target.files) { 
	        var reader = new FileReader(); 
	        reader.onload = function(event)
	         { 
	            var img = document.createElement("img"); 
	            img.setAttribute("src", event.target.result); 
	            img.setAttribute("width","200");
	            document.getElementById("imgview").innerHTML ="";  // 이전이미지 삭제
	            document.getElementById("imgview").appendChild(img);  //새로 선택한 이미지  출력
	         }; 
	          reader.readAsDataURL(image); 
	    } 
	} 
	function mrreview_del(mr_id, id){
		var confirm = window.confirm("정말 삭제하시겠습니까?");
		if(confirm == true){
			alert("삭제가 완료되었습니다.");
			location.href="mrreview_delete?mr_id="+mr_id+"&id="+id;
		}
	}
	function mrreview_update(mr_id, id){
		var chk = new XMLHttpRequest();
	    var id = id;
	    chk.open("get","mrreview_update?mr_id="+mr_id+"&id="+id);
	    chk.send();
	    chk.onreadystatechange = function()
	    {
	       if(chk.readyState === 4)
	       {
	          if(chk.responseText === "1")
	          {
	             document.getElementById("mrreview_update").style.display="inline-block";
	          }
	       }
	    }
	}
</script>
<div id="recipe_detail">
	<div id="recipe_info" align="center">
		<div id="recipe_image" class="picture">
			<img src="resources/img/mrecipe/${mrdto.fname0}" width="600" height="500">
		</div>
		<br>
		<div id="recipe_title">
			<h2>${mrdto.name}</h2>
		</div>
		<div id="recipe_ep" style="color:#AAAAAA">
			${mrdto.detail}
		</div>
		<br>
		<div id="recipe_detail_info">
			<c:if test="${mrdto.inbun!='X'}">
			<div id="inbun" style="display:inline-block; padding:50px;">
				<img src="resources/img/inbun.PNG" width=40>
				<div id="inbun" style="color:#BCB7B7">${mrdto.inbun}</div>
			</div>
			</c:if>
			<c:if test="${mrdto.time!='X'}">
			<div id="time" style="display:inline-block; padding:50px;">
				<img src="resources/img/time.PNG" width=35>
				<div id="time" style="color:#BCB7B7">${mrdto.time}</div>
			</div>
			</c:if>
			<c:if test="${mrdto.diff!='X'}">
			<div id="diff" style="display:inline-block; padding:50px;">
				<img src="resources/img/diff.PNG" width=50>
				<div id="diff" style="color:#BCB7B7">${mrdto.diff}</div>
			</div>
			</c:if>
		</div>
	</div>
	<hr size="3">
	<div id="materials">
		<div id="materials_top">
			<span style="display:inline-block"> <h4>재료</h4> </span> <span style="color:#CCCCCC"> Ingredients </span>
		</div>
		<p>
		<c:forEach begin="1" end="20" var="i">
			<c:set var="mname" value="ingrename_${i}"/>
			<c:set var="mquan" value="ingrequan_${i}"/>
			<c:if test="${mrdto[mname]!=''}">
				<ul style="padding-left:40px;">
					<li> <h5 style="display:inline-block">${mrdto[mname]}</h5> <h5 style="color:#999999; display:inline-block">${mrdto[mquan]}</h5> </li>
				</ul>
			</c:if>
		</c:forEach>
	</div>
	<hr>
	<div id="steps">
		<div id="steps_top">
			<span style="display:inline-block"> <h4>조리순서</h4> </span> <span style="color:#CCCCCC"> Steps </span>
		</div>
		<br>
		<c:forEach begin="1" end="20" var="j">
			<c:set var="ss" value="step_${j}"/>
			<c:set var="sss" value="fname${j}"/>
			<c:if test="${mrdto[ss]!=''}">
				<div id="step${j}" class="picture" style="display:inline-block; padding-right:10px;">
					<img src="resources/img/mrecipe/${mrdto[sss]}" width="300" height="300" style="display:inline-block">
				</div>
				<div style="display:inline-block; width:770px;">
					<span style="display:inline-block; width:45px;">
						<h4 style="background:#57c006;color:white;border-radius:100px;padding-top:8px;padding-bottom:8px;padding-left:14px;">${j}</h4>
					</span>
					<span style="display:inline-block"> ${mrdto[ss]} </span>
				</div>
				<hr>
			</c:if>
		</c:forEach>
	</div>
	<div id="tips">
		<div id="tips_top">
			<span style="display:inline-block"> <h4>팁/주의사항</h4> </span> <span style="color:#CCCCCC"> Tips </span>
		</div>
		<br>
		${mrdto.tip}
	</div>
	<hr>
	<div id="buttons" align="right">
		<span>
			<div style="display:inline-block; padding-top:8px;width:70px; height:40px; border:1px solid #57c006; background:#57c006">
				<a href="member_recipe_list" style="padding-right:18px; color:white;">목록</a>
			</div>
		</span>
		<c:if test="${userid == 'admin'}">
			<span>
				<div style="display:inline-block; padding-top:8px;width:70px; height:40px; border:1px solid #57c006; background:#57c006">
					<a href="javascript:del(${mrdto.mr_id})" style="padding-right:18px; color:white;">삭제</a>
				</div>
			</span>
		</c:if>
		<c:if test="${mrdto.nickname == nickname}">
			<span>
				<div style="display:inline-block; padding-top:8px;width:70px; height:40px; border:1px solid #57c006; background:#57c006">
					<a href="member_recipe_update?mr_id=${mrdto.mr_id}" style="padding-right:18px; color:white;">수정</a>
				</div>
			</span>
			<span>
				<div style="display:inline-block; padding-top:8px;width:70px; height:40px; border:1px solid #57c006; background:#57c006">
					<a href="javascript:del(${mrdto.mr_id})" style="padding-right:18px; color:white;">삭제</a>
				</div>
			</span>
		</c:if>
	</div>
	<hr size="10" color="#AAAAAA">
	<div id="mrreview">
		<div id="mrreview_top">
			<span style="display:inline-block"> <h4>요리 후기</h4> </span> <span style="color:#CCCCCC"> Reviews </span>
		</div>
		<br>
		<div id="mrreview_list">
			<c:set var="i" value="1"/>
			<ul style="list-style:none;">
			<c:forEach var="mrrdto" items="${review_list}">
				<li>
					<div id="mrreview_list_nickname" style="width:150px; display:inline-block; valign:middle" align="center">
						<h5>${mrrdto.nickname}</h5>
					</div>
					<div id="mrreview_list_content" style="width:600px; display:inline-block">
						${mrrdto.content}
					</div>
					<div id="mrreview_list_rating" style="width:150px; display:inline-block" align="center">
						<c:if test="${mrrdto.rating == 1}">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
						</c:if>
						<c:if test="${mrrdto.rating == 2}">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
						</c:if>
						<c:if test="${mrrdto.rating == 3}">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
						</c:if>
						<c:if test="${mrrdto.rating == 4}">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star0.PNG" width="20">
						</c:if>
						<c:if test="${mrrdto.rating == 5}">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
							<img src="resources/img/star.PNG" width="20">
						</c:if>
					</div>
					<div id="mrreview_list_writeday" style="width:160px; display:inline-block" align="center">
						${mrrdto.writeday}
					</div>
					<c:if test="${mrrdto.fname!=null}">
						<div id="mrreview_list_image" style="padding-top:10px; padding-left:30px;">
							<img src="resources/img/mrreview/${mrrdto.fname}" width=200>
						</div>
					</c:if>
					<c:if test="${userid == 'admin'}">
						<div id="mrreview_change" align="right">
							<span>
								<div style="display:inline-block">
									<a href="javascript:mrreview_del(${mrdto.mr_id}, ${mrrdto.id})">삭제</a>
								</div>
							</span>
						</div>
					</c:if>
					<c:if test="${mrrdto.nickname == nickname}">
						<div id="mrreview_change" align="right">
							<span>
								<div style="display:inline-block">
									<a href="javascript:mrreview_update(${mrdto.mr_id}, ${mrrdto.id})">수정</a>
								</div>
							</span> |
							<span>
								<div style="display:inline-block">
									<a href="javascript:mrreview_del(${mrdto.mr_id}, ${mrrdto.id})">삭제</a>
								</div>
							</span>
						</div>
					</c:if>
					<div id="mrreview_update" style="display:none" align="center">
					<hr>
						<form method="post" action="mrreview_update_ok" enctype="multipart/form-data">
							<input type="hidden" name="review_id" value="${mrrdto.id}">
							<input type="hidden" name="mr_id" value="${mrdto.mr_id}">
							<div id="mrreview_content_update" style="display:inline-block">
								<div id="mrreview_text_update" style="padding-bottom:5px;">
								<input type="text" name="mrreview_write_update" size="100" value="${mrrdto.content}">
							</div>
							<div id="mrreview_rating_update">
								<c:if test="${mrrdto.rating ==1}">
									<input type="radio" name="rating_update" value="1" checked/> <img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="2"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="3"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="4"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="5"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
								</c:if>
								<c:if test="${mrrdto.rating ==2}">
									<input type="radio" name="rating_update" value="1"> <img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="2" checked/> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="3"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="4"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="5"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
								</c:if>
								<c:if test="${mrrdto.rating ==3}">
									<input type="radio" name="rating_update" value="1"> <img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="2"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="3" checked/> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="4"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="5"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
								</c:if>
								<c:if test="${mrrdto.rating ==4}">
									<input type="radio" name="rating_update" value="1"> <img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="2"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="3"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="4" checked/> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="5"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
								</c:if>
								<c:if test="${mrrdto.rating ==5}">
									<input type="radio" name="rating_update" value="1"> <img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="2"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="3"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="4"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
									<input type="radio" name="rating_update" value="5" checked/> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
								</c:if>
							</div>
							<div id="mrreview_file_update" align="left">
								<input type="file" name="fname_update" onchange="setThumbnail();">
								<span id="imgview"></span>
							</div>
							</div>
							<div id="mrreview_submit_update" style="display:inline-block; margin-top:-2px;">
								<input type="submit" value="리뷰 수정" style="padding-top:6px;width:90px; height:80px; border:1px solid #57c006; color:white; background:#57c006">
							</div>
						</form>
					</div>
					<hr>
				</li>
			</c:forEach>
			</ul>
		</div>
		<hr>
		<div id="mrreview_write_top">
			<span style="display:inline-block"> <h4>리뷰 작성</h4> </span> <span style="color:#CCCCCC"></span>
		</div>
		<c:if test="${userid != null}">
			<div id="mrreview_write" align="center">
				<form method="post" action="mrreview_write" enctype="multipart/form-data">
					<input type="hidden" name="mr_id" value="${mrdto.mr_id}">
					<input type="hidden" name="nickname" value="${nickname}">
					<div id="mrreview_content" style="display:inline-block">
						<div id="mrreview_text" style="padding-bottom:5px;">
							<input type="text" name="mrreview_write" size="100">
						</div>
						<div id="mrreview_rating">
							<input type="radio" name="rating" value="1"> <img src="resources/img/star.PNG" width="20">
							<input type="radio" name="rating" value="2"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
							<input type="radio" name="rating" value="3"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
							<input type="radio" name="rating" value="4"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
							<input type="radio" name="rating" value="5"> <img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20"><img src="resources/img/star.PNG" width="20">
						</div>
						<div id="mrreview_file" align="left">
							<input type="file" name="fname" onchange="setThumbnail();">
							<span id="imgview"></span>
						</div>
					</div>
					<div id="mrreview_submit" style="display:inline-block; margin-top:-2px;">
						<input type="submit" value="리뷰 등록" style="padding-top:6px;width:90px; height:80px; border:1px solid #57c006; color:white; background:#57c006">
					</div>
				</form>
			</div>
		</c:if>
		<c:if test="${userid == null}">
			<div id="mrreview_write" align="center">
				<span> 로그인 하시면 레시피 리뷰를 작성하실 수 있습니다 </span>
			</div>
		</c:if>
	</div>
	<hr>
</div>
<br>
<br>
<br>
<br>
<br>
<c:import url="../bottom.jsp"/>