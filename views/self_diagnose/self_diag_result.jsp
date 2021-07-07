<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<style>
#self_diag_result {
	font-family: 'Noto Sans KR', sans-serif;
	}
#self_diag_result ul {
	list-style-type:none;
	padding-inline-start:0px;
}
#self_diag_result_top {
	width:1140px;margin:auto;
}
#recommend_recipe ul li{
	display:inline-block; text-align:center; padding:30px; height:450px; position:relative;
}
#recommend_hfood ul li{
	display:inline-block; text-align:center; padding:30px; height:450px; position:relative;
}
.hfoodbox {
	width:250px;
	position:absolute;
	display:inline-block;
	left:22px;
}
</style>
<div id="self_diag_result">
	<div id="self_diag_result_top">
		<span style="display:inline-block"> <h4>자가진단</h4> </span>
		<span style="color:#CCCCCC">Self Diagnose</span>
		<br><br>
		<div style="display:inline-block;"> <h4><b style="color:#57c006">Step3</b></h4></div>
		<div style="display:inline-block">예측된 진단에 맞는 레시피 또는 건강기능식품을 확인하세요</span>
	</div>
	<br><br>
	<div id="diagnose" style="text-align:center; border:3px solid #57c006; padding-top:8px; padding-bottom:8px;">
		진단결과 : 
		<b>${nickname}</b> 님은 
		<c:if test="${list.predict==0}">
		<b style="color:red">현기증</b>
		</c:if>
		<c:if test="${list.predict==1}">
		<b style="color:red">여드름</b>
		</c:if>
		<c:if test="${list.predict==2}">
		<b style="color:red">알코올성 간 질환</b>
		</c:if>
		<c:if test="${list.predict==3}">
		<b style="color:red">관절염</b>
		</c:if>
		<c:if test="${list.predict==4}">
		<b style="color:red">경추증</b>
		</c:if>
		<c:if test="${list.predict==5}">
		<b style="color:red">감기</b>
		</c:if>
		<c:if test="${list.predict==6}">
		<b style="color:red">당뇨병</b>
		</c:if>
		<c:if test="${list.predict==7}">
		<b style="color:red">치질</b>
		</c:if>
		<c:if test="${list.predict==8}">
		<b style="color:red">역류성 식도염</b>
		</c:if>
		<c:if test="${list.predict==9}">
		<b style="color:red">장염</b>
		</c:if>
		<c:if test="${list.predict==10}">
		<b style="color:red">심근경색/심장마비</b>
		</c:if>
		<c:if test="${list.predict==11}">
		<b style="color:red">B형 간염</b>
		</c:if>
		<c:if test="${list.predict==12}">
		<b style="color:red">C형 간염</b>
		</c:if>
		<c:if test="${list.predict==13}">
		<b style="color:red">D형 간염</b>
		</c:if>
		<c:if test="${list.predict==14}">
		<b style="color:red">E형 간염</b>
		</c:if>
		<c:if test="${list.predict==15}">
		<b style="color:red">고혈압</b>
		</c:if>
		<c:if test="${list.predict==16}">
		<b style="color:red">저혈당증</b>
		</c:if>
		<c:if test="${list.predict==17}">
		<b style="color:red">편두통</b>
		</c:if>
		<c:if test="${list.predict==18}">
		<b style="color:red">골관절염</b>
		</c:if>
		<c:if test="${list.predict==19}">
		<b style="color:red">뇌출혈</b>
		</c:if>
		<c:if test="${list.predict==20}">
		<b style="color:red">소화성 위 궤양</b>
		</c:if>
		<c:if test="${list.predict==21}">
		<b style="color:red">건선피부</b>
		</c:if>
		<c:if test="${list.predict==22}">
		<b style="color:red">요로감염</b>
		</c:if>
		<c:if test="${list.predict==23}">
		<b style="color:red">하지정맥</b>
		</c:if>
		<c:if test="${list.predict==24}">
		<b style="color:red">A형 간염</b>
		</c:if>
		에 가장 위험한 것으로 예측됩니다!
	</div>
	<br>
	<div id="recommend">
		<div id="recommend_recipe">
			<div>
				<c:if test="${list.predict==0}">
				<b>현기증</b>
				</c:if>
				<c:if test="${list.predict==1}">
				<b>여드름</b>
				</c:if>
				<c:if test="${list.predict==2}">
				<b>알코올성 간 질환</b>
				</c:if>
				<c:if test="${list.predict==3}">
				<b>관절염</b>
				</c:if>
				<c:if test="${list.predict==4}">
				<b>경추증</b>
				</c:if>
				<c:if test="${list.predict==5}">
				<b>감기</b>
				</c:if>
				<c:if test="${list.predict==6}">
				<b>당뇨병</b>
				</c:if>
				<c:if test="${list.predict==7}">
				<b>치질</b>
				</c:if>
				<c:if test="${list.predict==8}">
				<b>역류성 식도염</b>
				</c:if>
				<c:if test="${list.predict==9}">
				<b>장염</b>
				</c:if>
				<c:if test="${list.predict==10}">
				<b>심근경색/심장마비</b>
				</c:if>
				<c:if test="${list.predict==11}">
				<b>B형 간염</b>
				</c:if>
				<c:if test="${list.predict==12}">
				<b>C형 간염</b>
				</c:if>
				<c:if test="${list.predict==13}">
				<b>D형 간염</b>
				</c:if>
				<c:if test="${list.predict==14}">
				<b>E형 간염</b>
				</c:if>
				<c:if test="${list.predict==15}">
				<b>고혈압</b>
				</c:if>
				<c:if test="${list.predict==16}">
				<b>저혈당증</b>
				</c:if>
				<c:if test="${list.predict==17}">
				<b>편두통</b>
				</c:if>
				<c:if test="${list.predict==18}">
				<b>골관절염</b>
				</c:if>
				<c:if test="${list.predict==19}">
				<b>뇌출혈</b>
				</c:if>
				<c:if test="${list.predict==20}">
				<b>소화성 위 궤양</b>
				</c:if>
				<c:if test="${list.predict==21}">
				<b>건선피부</b>
				</c:if>
				<c:if test="${list.predict==22}">
				<b>요로감염</b>
				</c:if>
				<c:if test="${list.predict==23}">
				<b>하지정맥</b>
				</c:if>
				<c:if test="${list.predict==24}">
				<b>A형 간염</b>
				</c:if>
				에 좋은 레시피 Best3
			</div>
			<br>
			<div id="ulbox">
				<c:if test="${list.predict==7 || list.predict==23}">
					<div align="center">아직 등록된 레시피가 없습니다</div>
				</c:if>
				<ul align="center">
					<c:forEach items="${reco_rlist}" var="reco_rlist">
						<li>
							<a href="readnum?recipe_code=${reco_rlist.recipecode}">
								<img src="resources/img/recipe/${reco_rlist.recipecode}.jpg" width="240" height="240"> <p>
								<div class="hfoodbox">
									<span class="recipename">${reco_rlist.name}</span><p>
									<span style="color:#999999"> 조회수 ${reco_rlist.readnum}</span>
									<span id="unlike" style="display:inline-block; width:90px; height:25px;background:#F7F7F7"> 좋아요 
										<span style="display:inline-block;"><img src="resources/img/heart1.PNG" width=17px;></span>
										<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${reco_rlist.r_like}</span>
									</span>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div align="right">
				<a href="recipe_list?ctg=${rctgval}">
					<c:if test="${list.predict==0}">
					<b>현기증</b>
					</c:if>
					<c:if test="${list.predict==1}">
					<b>여드름</b>
					</c:if>
					<c:if test="${list.predict==2}">
					<b>알코올성 간 질환</b>
					</c:if>
					<c:if test="${list.predict==3}">
					<b>관절염</b>
					</c:if>
					<c:if test="${list.predict==4}">
					<b>경추증</b>
					</c:if>
					<c:if test="${list.predict==5}">
					<b>감기</b>
					</c:if>
					<c:if test="${list.predict==6}">
					<b>당뇨병</b>
					</c:if>
					<c:if test="${list.predict==7}">
					<b>치질</b>
					</c:if>
					<c:if test="${list.predict==8}">
					<b>역류성 식도염</b>
					</c:if>
					<c:if test="${list.predict==9}">
					<b>장염</b>
					</c:if>
					<c:if test="${list.predict==10}">
					<b>심근경색/심장마비</b>
					</c:if>
					<c:if test="${list.predict==11}">
					<b>B형 간염</b>
					</c:if>
					<c:if test="${list.predict==12}">
					<b>C형 간염</b>
					</c:if>
					<c:if test="${list.predict==13}">
					<b>D형 간염</b>
					</c:if>
					<c:if test="${list.predict==14}">
					<b>E형 간염</b>
					</c:if>
					<c:if test="${list.predict==15}">
					<b>고혈압</b>
					</c:if>
					<c:if test="${list.predict==16}">
					<b>저혈당증</b>
					</c:if>
					<c:if test="${list.predict==17}">
					<b>편두통</b>
					</c:if>
					<c:if test="${list.predict==18}">
					<b>골관절염</b>
					</c:if>
					<c:if test="${list.predict==19}">
					<b>뇌출혈</b>
					</c:if>
					<c:if test="${list.predict==20}">
					<b>소화성 위 궤양</b>
					</c:if>
					<c:if test="${list.predict==21}">
					<b>건선피부</b>
					</c:if>
					<c:if test="${list.predict==22}">
					<b>요로감염</b>
					</c:if>
					<c:if test="${list.predict==23}">
					<b>하지정맥</b>
					</c:if>
					<c:if test="${list.predict==24}">
					<b>A형 간염</b>
					</c:if>
					에 좋은 레시피 더 보러가기
				</a>
			</div>
		</div>
		<br>
		<div id="recommend_hfood">
			<div>
				<c:if test="${list.predict==0}">
				<b>현기증</b>
				</c:if>
				<c:if test="${list.predict==1}">
				<b>여드름</b>
				</c:if>
				<c:if test="${list.predict==2}">
				<b>알코올성 간 질환</b>
				</c:if>
				<c:if test="${list.predict==3}">
				<b>관절염</b>
				</c:if>
				<c:if test="${list.predict==4}">
				<b>경추증</b>
				</c:if>
				<c:if test="${list.predict==5}">
				<b>감기</b>
				</c:if>
				<c:if test="${list.predict==6}">
				<b>당뇨병</b>
				</c:if>
				<c:if test="${list.predict==7}">
				<b>치질</b>
				</c:if>
				<c:if test="${list.predict==8}">
				<b>역류성 식도염</b>
				</c:if>
				<c:if test="${list.predict==9}">
				<b>장염</b>
				</c:if>
				<c:if test="${list.predict==10}">
				<b>심근경색/심장마비</b>
				</c:if>
				<c:if test="${list.predict==11}">
				<b>B형 간염</b>
				</c:if>
				<c:if test="${list.predict==12}">
				<b>C형 간염</b>
				</c:if>
				<c:if test="${list.predict==13}">
				<b>D형 간염</b>
				</c:if>
				<c:if test="${list.predict==14}">
				<b>E형 간염</b>
				</c:if>
				<c:if test="${list.predict==15}">
				<b>고혈압</b>
				</c:if>
				<c:if test="${list.predict==16}">
				<b>저혈당증</b>
				</c:if>
				<c:if test="${list.predict==17}">
				<b>편두통</b>
				</c:if>
				<c:if test="${list.predict==18}">
				<b>골관절염</b>
				</c:if>
				<c:if test="${list.predict==19}">
				<b>뇌출혈</b>
				</c:if>
				<c:if test="${list.predict==20}">
				<b>소화성 위 궤양</b>
				</c:if>
				<c:if test="${list.predict==21}">
				<b>건선피부</b>
				</c:if>
				<c:if test="${list.predict==22}">
				<b>요로감염</b>
				</c:if>
				<c:if test="${list.predict==23}">
				<b>하지정맥</b>
				</c:if>
				<c:if test="${list.predict==24}">
				<b>A형 간염</b>
				</c:if>
				에 좋은 건강기능식품 Best3
			</div>
			<br>
			<div>
				<c:if test="${list.predict==2 || list.predict==24 || list.predict==11 || list.predict==12 || list.predict==13 || list.predict==14}"> <!-- 간 -->
				</c:if>
				<c:if test="${list.predict==3 || list.predict==4 || list.predict==18}"> <!-- 관절/뼈 건강 -->
				</c:if>
				<c:if test="${list.predict==0 || list.predict==17 || list.predict==19}"> <!-- 뇌 건강 -->
					<div align="center">아직 등록된 건강기능식품이 없습니다</div>
				</c:if>
				<c:if test="${list.predict==22}"> <!-- 신장/요로 건강 -->
				</c:if>
				<c:if test="${list.predict==10}"> <!-- 심장병 예방 -->
					<div align="center">아직 등록된 건강기능식품이 없습니다</div>
				</c:if>
				<c:if test="${list.predict==8 || list.predict==20}"> <!-- 위 건강/소화 기능 -->
				</c:if>
				<c:if test="${list.predict==9}"> <!-- 장 건강 -->
				</c:if>
				<c:if test="${list.predict==1 || list.predict==21}"> <!-- 피부 건강 -->
				</c:if>
				<c:if test="${list.predict==6 || list.predict==16}"> <!-- 혈당 조절 -->
				</c:if>
				<c:if test="${list.predict==15}"> <!-- 혈압 조절 -->
				</c:if>
				<c:if test="${list.predict==7 || list.predict==23}">
				</c:if>
				<ul align="center">
					<c:forEach items="${reco_hlist}" var="reco_hlist">
						<li>
							<a href="hreadnum?id=${reco_hlist.id}">
								<img src="resources/img/hfood/${reco_hlist.productid}.jpg" width="240" height="240"> <p>
								<div class="hfoodbox" width="250">
									<span class="hfoodname">${reco_hlist.name}</span><p>
									<span style="color:#999999"> 조회수 ${reco_hlist.readnum}</span>
									<span id="unlike" style="display:inline-block; width:90px; height:25px;background:#F7F7F7"> 평점 
										<span style="display:inline-block;"><img src="resources/img/heart1.PNG" width=17px;></span>
										<span style="display:inline-block; color:#D23B01; background:#F7F7F7">${reco_hlist.jumsu}</span>
									</span>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div align="right">
				<a href="hfood?ctg=${hctgval}">
					<c:if test="${list.predict==0}">
					<b>현기증</b>
					</c:if>
					<c:if test="${list.predict==1}">
					<b>여드름</b>
					</c:if>
					<c:if test="${list.predict==2}">
					<b>알코올성 간 질환</b>
					</c:if>
					<c:if test="${list.predict==3}">
					<b>관절염</b>
					</c:if>
					<c:if test="${list.predict==4}">
					<b>경추증</b>
					</c:if>
					<c:if test="${list.predict==5}">
					<b>감기</b>
					</c:if>
					<c:if test="${list.predict==6}">
					<b>당뇨병</b>
					</c:if>
					<c:if test="${list.predict==7}">
					<b>치질</b>
					</c:if>
					<c:if test="${list.predict==8}">
					<b>역류성 식도염</b>
					</c:if>
					<c:if test="${list.predict==9}">
					<b>장염</b>
					</c:if>
					<c:if test="${list.predict==10}">
					<b>심근경색/심장마비</b>
					</c:if>
					<c:if test="${list.predict==11}">
					<b>B형 간염</b>
					</c:if>
					<c:if test="${list.predict==12}">
					<b>C형 간염</b>
					</c:if>
					<c:if test="${list.predict==13}">
					<b>D형 간염</b>
					</c:if>
					<c:if test="${list.predict==14}">
					<b>E형 간염</b>
					</c:if>
					<c:if test="${list.predict==15}">
					<b>고혈압</b>
					</c:if>
					<c:if test="${list.predict==16}">
					<b>저혈당증</b>
					</c:if>
					<c:if test="${list.predict==17}">
					<b>편두통</b>
					</c:if>
					<c:if test="${list.predict==18}">
					<b>골관절염</b>
					</c:if>
					<c:if test="${list.predict==19}">
					<b>뇌출혈</b>
					</c:if>
					<c:if test="${list.predict==20}">
					<b>소화성 위 궤양</b>
					</c:if>
					<c:if test="${list.predict==21}">
					<b>건선피부</b>
					</c:if>
					<c:if test="${list.predict==22}">
					<b>요로감염</b>
					</c:if>
					<c:if test="${list.predict==23}">
					<b>하지정맥</b>
					</c:if>
					<c:if test="${list.predict==24}">
					<b>A형 간염</b>
					</c:if>
					에 좋은 건강기능식품 더 보러가기
				</a>
			</div>
		</div>
	</div>
</div>
<br><br><br><br>
<c:import url="../bottom.jsp"/>