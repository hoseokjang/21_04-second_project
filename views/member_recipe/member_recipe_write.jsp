<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<script>
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
function addMaterials(){
	document.getElementById("materials_list2").style.display = "inline-block";
	document.getElementById("addmaterial").style.display = "none";
}
function addSteps(){
	document.getElementById("steplist2").style.display = "inline-block";
	document.getElementById("addstep").style.display = "none";
}
function cancelWrite(){
	location.href="member_recipe_list";
}
</script>
<style>
	#mrecipe {
	font-family: 'Noto Sans KR', sans-serif; margin:0 auto; align:center;
	width:1100px;
	}
	#materials_list1 li{
	padding-bottom:10px;
	}
	#materials_list2 li{
	padding-bottom:10px;
	}
	#steps li{
	padding-bottom:10px;
	}
</style>
<div id="mrecipe">
	<div align="center"> <h3>레시피 등록</h3> </div>
	<br>
	<hr>
	<form method="post" action="member_recipe_write_ok" enctype="multipart/form-data">
		<input type="hidden" name="nickname" value="${nickname}">
		<div id="recipeinfo">
			<div id="recipeinfo_top">
				<span style="display:inline-block"> <h4>기본정보</h4> </span> <span style="color:#CCCCCC"> RecipeInfo </span>
			</div>
			<br>
			<div id="recipeimg" style="padding-bottom:15px;">
				<span style="padding-right:50px;">음식 사진</span>
				<input type="file" name="fname0" onchange="setThumbnail();">
				<span id="imgview"></span><p>
			</div>
			<div id="mrecipe_name" style="padding-bottom:15px;">
				<span style="padding-right:39px;">레시피이름</span>
				<input type="text" name="rname"> <br>
			</div>
			<div id="mrecipe_detail" style="padding-bottom:15px;">
				<span style="padding-right:55px;">상세설명</span> 
				<input type="text" name="rdetail" size="100"> <br>
			</div>
			<div id="mrecipe_inbun" style="padding-bottom:15px;">
				<span style="padding-right:87px;"> 인분 </span>
				<select id="select_inbun" name="inbun" style="width:400px; height:30px;">
	       			<option value="X"> 몇 인분인지 선택해주세요 </option>
	       			<option value="1인분"> 1인분 </option>
	       			<option value="2인분"> 2인분 </option>
	       			<option value="3인분 이상"> 3인분 이상 </option>
	       		</select> <br>
       		</div>
       		<div id="mrecipe_time" style="padding-bottom:15px;">
				<span style="padding-right:55px;"> 조리시간 </span>
				<select id="select_time" name="time" style="width:400px; height:30px;">
	       			<option value="X"> 조리시간을 선택해주세요 </option>
	       			<option value="30분이내"> 30분이내 </option>
	       			<option value="60분이내"> 60분이내 </option>
	       			<option value="2시간이내"> 2시간이내 </option>
	       			<option value="2시간이상"> 2시간이상 </option>
	       		</select> <br>
       		</div>
       		<div id="mrecipe_diff" style="padding-bottom:15px;">
				<span style="padding-right:71px;"> 난이도 </span>
				<select id="select_diff" name="diff" style="width:400px; height:30px;">
	       			<option value="X"> 난이도를 선택해주세요 </option>
	       			<option value="초급"> 초급 </option>
	       			<option value="중급"> 중급 </option>
	       			<option value="고급"> 고급 </option>
	       		</select> <br>
       		</div>
		</div>
		<hr>
		<div id="materials">
			<div id="materials_top">
				<span style="display:inline-block"> <h4>재료</h4> </span> <span style="color:#CCCCCC"> Ingredients </span>
			</div>
			<br>
			<div id="materials_list1">
				<ul style="list-style:none; padding-left:125px;">
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_1" size="20" placeholder="예)돼지고기">
							<input type="text" name="ingrequan_1" size="10" placeholder="예)반 근">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_2" size="20" placeholder="예)물">
							<input type="text" name="ingrequan_2" size="10" placeholder="예)3컵">
						</div>
					</li>
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_3" size="20" placeholder="예)소금">
							<input type="text" name="ingrequan_3" size="10" placeholder="예)한 꼬집">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_4" size="20" placeholder="예)참기름">
							<input type="text" name="ingrequan_4" size="10" placeholder="예)1T">
						</div>
					</li>
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_5" size="20" placeholder="예)양배추">
							<input type="text" name="ingrequan_5" size="10" placeholder="예)1/2개">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_6" size="20" placeholder="예)양파">
							<input type="text" name="ingrequan_6" size="10" placeholder="예)1개">
						</div>
					</li>
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_7" size="20">
							<input type="text" name="ingrequan_7" size="10">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_8" size="20">
							<input type="text" name="ingrequan_8" size="10">
						</div>
					</li>
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_9" size="20">
							<input type="text" name="ingrequan_9" size="10">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_10" size="20">
							<input type="text" name="ingrequan_10" size="10">
						</div>
					</li>
				</ul>
			</div>
			<div id="materials_list2" style="display:none;">
				<ul style="list-style:none; padding-left:125px;">
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_11" size="20">
							<input type="text" name="ingrequan_11" size="10">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_12" size="20">
							<input type="text" name="ingrequan_12" size="10">
						</div>
					</li>
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_13" size="20">
							<input type="text" name="ingrequan_13" size="10">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_14" size="20">
							<input type="text" name="ingrequan_14" size="10">
						</div>
					</li>
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_15" size="20">
							<input type="text" name="ingrequan_15" size="10">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_16" size="20">
							<input type="text" name="ingrequan_16" size="10">
						</div>
					</li>
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_17" size="20">
							<input type="text" name="ingrequan_17" size="10">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_18" size="20">
							<input type="text" name="ingrequan_18" size="10">
						</div>
					</li>
					<li>
						<div style="display:inline-block; padding-right:60px;">
							<input type="text" name="ingrename_19" size="20">
							<input type="text" name="ingrequan_19" size="10">
						</div>
						<div style="display:inline-block;">
							<input type="text" name="ingrename_20" size="20">
							<input type="text" name="ingrequan_20" size="10">
						</div>
					</li>
				</ul>
			</div>
			<div align="center" style="padding-right:120px; ">
				<input type="button" id="addmaterial" value="+" onclick="addMaterials()" style="padding-left:10px; padding-right:10px; font-size:20px; color:white; border:none; background:#57c006; border-radius:100px;">
			</div>
		</div>
		<hr>
		<div id="steps">
			<div id="steps_top">
				<span style="display:inline-block"> <h4>조리순서</h4> </span> <span style="color:#CCCCCC"> Steps </span>
			</div>
			<br>
			<div id="steplist1">
				<ul style="list-style:none;">
					<c:forEach var="i" begin="1" end="10">
						<li>
							<span style="padding-right:76px;">${i}단계</span>
							<div style="display:inline-block;"><input type="text" name="step_${i}" size="60"></div>
							<div style="display:inline-block;"><input type="file" name="fname${i}" onchange="setThumbnail();"></div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div id="steplist2" style="display:none;">
				<ul style="list-style:none;">
					<c:forEach var="j" begin="11" end="20">
						<li>
							<span style="padding-right:76px;">${j}단계</span>
							<div style="display:inline-block;"><input type="text" name="step_${j}" size="60"></div>
							<div style="display:inline-block;"><input type="file" name="fname${j}" onchange="setThumbnail();"></div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div align="center" style="padding-right:120px; ">
				<input type="button" id="addstep" value="+" onclick="addSteps()" style="padding-left:10px; padding-right:10px; font-size:20px; color:white; border:none; background:#57c006; border-radius:100px;">
			</div>
		</div>
		<hr>
		<div id="tips">
			<div id="tips_top">
				<span style="display:inline-block"> <h4>팁/주의사항</h4> </span> <span style="color:#CCCCCC"> Tips </span>
			</div>
			<br>
			<span style="padding-left:121px;"><input type="text" name="tip" size="100"></span>
		</div>
		<br>
		<hr>
		<div align="center">
			<span style="padding-right:10px;"><input type="button" value="취소" onclick="cancelWrite()" style="border:none; width:130px; height:60px;"></span>
			<span><input type="submit" value="등록" style="color:white; border:none; width:130px; height:60px; background:#57c006"></span>
		</div>
		<br>
	</form>
</div>
<br>
<br>
<br>
<br>
<br>
<c:import url="../bottom.jsp"/>