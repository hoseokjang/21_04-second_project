<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp" %>
<style type="text/css">
#myupdate ul {
	list-style:none;
	border-top:2px solid green;
	max-width:350px;
	/* border:2px solid green; */}

#myupdate li {
	text-align:left;}
	
.myinfo{
	display:inline-block;
	width:80px;
	}
	
.myinput{
	display:inline-block;
	width:100px;
	}
</style>

<div id="myupdate" align="center">
 <caption> <h3> 회원 등록정보 수정 </h3> </caption>
 <form name="life" method="post" action="myupdate_ok">
 <input type="hidden" name="id" value="${mdto.id}">
    <ul><p>
    	<li> <span class="myinfo">아이디 :</span> 
    	<span class="myinput"> <input type="text" name="userid" value="${mdto.userid}" class="mb_frm"  required > </span> </li><p>
    	<li> <span class="myinfo">비밀번호:</span>
    	<span><input type="password" name="pwd" value="${mdto.pwd}" class="mb_frm" required >  </span>
    	</li><p>  
    	<li><span class="myinfo">닉네임 :</span>
    	<span><input type="text" name="nickname" value="${mdto.nickname}" class="mb_frm" > </span> </li> <p>  
    	<li><span class="myinfo">이메일 :</span> 
    	<span> <input type="text" name="email" value="${mdto.email} " class="mb_frm" ></span> </li> <p>
    	<li><span class="myinfo">성별: &nbsp</span> 
    	<input type="radio" name="sex" value="0" <c:if test="${mdto.sex eq 0}"> checked </c:if>>남자,&nbsp
    	<input type="radio" name="sex" value="1" <c:if test="${mdto.sex eq 1}"> checked </c:if>>여자 </li><p>
    	
    	<li><span class="myinfo">출생년도:&nbsp&nbsp</span> 
    	<span class="myinput"> 
    	<select name="year" style="width:100px; height:27px;">
			<c:forEach var="i" begin="1920" end="2021">
				<option value="${i}" <c:out value="${mdto.year==i?'selected':''}"/>> ${i}</option>
			</c:forEach>
		</select>
		</span></li><p>
   		
   		<%-- <li><span class="myinfo">보유질환 :</span> 
   		<span><input type="text" name="disease" value="${mdto.disease}" class="mb_frm"> </span> </li><p> --%>
   		<li><span style="display:inline-block; width:100 px;"><b>건강관심분야 :</b></span><br>
   		<span>
 
   <input type="checkbox" name="concern" value="장 건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '장 건강'}"> checked </c:if>
   </c:forEach>>장 건강&nbsp
   
   <input type="checkbox" name="concern" value="간 건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '간 건강'}"> checked </c:if>
   </c:forEach>>간 건강&nbsp
   
   <input type="checkbox" name="concern" value="위 건강/소화 기능" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '위 건강/소화 기능'}"> checked </c:if>
   </c:forEach>>위 건강/소화 기능&nbsp<br>
   
   <input type="checkbox" name="concern" value="치아 건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '치아 건강'}"> checked </c:if>
   </c:forEach>>치아 건강&nbsp
   
   <input type="checkbox" name="concern" value="관절/뼈 건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '관절/뼈 건강'}"> checked </c:if>
   </c:forEach>>관절/뼈 건강&nbsp
   
   <input type="checkbox" name="concern" value="피부 건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '피부 건강'}"> checked </c:if>
   </c:forEach>>피부 건강&nbsp<br>
   
   <input type="checkbox" name="concern" value="신장/요로 건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '신장/요로 건강'}"> checked </c:if>
   </c:forEach>>신장/요로 건강&nbsp
   
   <input type="checkbox" name="concern" value="혈당 조절" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '혈당 조절'}"> checked </c:if>
   </c:forEach>>혈당 조절&nbsp
   
   <input type="checkbox" name="concern" value="혈압 조절" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '혈압 조절'}"> checked </c:if>
   </c:forEach>>혈압 조절&nbsp<br>
   
   <input type="checkbox" name="concern" value="콜레스테롤 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '콜레스테롤 개선'}"> checked </c:if>
   </c:forEach>>콜레스테롤 개선&nbsp
   
   <input type="checkbox" name="concern" value="혈중중성지방 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '혈중중성지방 개선'}"> checked </c:if>
   </c:forEach>>혈중중성지방 개선&nbsp<br>
   
   <input type="checkbox" name="concern" value="혈행개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '혈행개선'}"> checked </c:if>
   </c:forEach>>혈행개선&nbsp
   
   <input type="checkbox" name="concern" value="체지방 감소" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '체지방 감소'}"> checked </c:if>
   </c:forEach>>체지방 감소&nbsp

   <input type="checkbox" name="concern" value="면역기능" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '면역기능'}"> checked </c:if>
   </c:forEach>>면역기능&nbsp <br>

   <input type="checkbox" name="concern" value="면역과민피부 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '면역과민피부 개선'}"> checked </c:if>
   </c:forEach>>면역과민피부 개선&nbsp 

   <input type="checkbox" name="concern" value="항산화" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '항산화'}"> checked </c:if>
   </c:forEach>>항산화&nbsp 

   <input type="checkbox" name="concern" value="피로 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '피로 개선'}"> checked </c:if>
   </c:forEach>>피로 개선&nbsp <br>

   <input type="checkbox" name="concern" value="긴장완화" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '긴장완화'}"> checked </c:if>
   </c:forEach>>긴장완화&nbsp

   <input type="checkbox" name="concern" value="수면 질 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '수면 질 개선'}"> checked </c:if>
   </c:forEach>>수면 질 개선&nbsp
   
   <input type="checkbox" name="concern" value="기억력 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '기억력 개선'}"> checked </c:if>
   </c:forEach>>기억력 개선&nbsp<br>

      
   <input type="checkbox" name="concern" value="인지능력 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '인지능력 개선'}"> checked </c:if>
   </c:forEach>>인지능력 개선&nbsp
   
   <input type="checkbox" name="concern" value="운동수행능력 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '운동수행능력 개선'}"> checked </c:if>
   </c:forEach>>운동수행능력 개선&nbsp<br>
      
   <input type="checkbox" name="concern" value="근력 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '근력 개선'}"> checked </c:if>
   </c:forEach>>근력 개선&nbsp

      
   <input type="checkbox" name="concern" value="칼슘흡수 촉진" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '칼슘흡수 촉진'}"> checked </c:if>
   </c:forEach>>칼슘흡수 촉진&nbsp

   <input type="checkbox" name="concern" value="어린이 성장" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '어린이 성장'}"> checked </c:if>
   </c:forEach>>어린이 성장&nbsp<br>

      
   <input type="checkbox" name="concern" value="정자 운동성" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '정자 운동성'}"> checked </c:if>
   </c:forEach>>정자 운동성&nbsp

      
   <input type="checkbox" name="concern" value="전립선 건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '전립선 건강'}"> checked </c:if>
   </c:forEach>>전립선 건강&nbsp<br>

      
   <input type="checkbox" name="concern" value="질내 유익균 증식/유해균 억제" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '질내 유익균 증식/유해균 억제'}"> checked </c:if>
   </c:forEach>>질내 유익균 증식/유해균 억제&nbsp<br>
  
   <input type="checkbox" name="concern" value="월경전상태 개선" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '월경전상태 개선'}"> checked </c:if>
   </c:forEach>>월경전상태 개선&nbsp

   <input type="checkbox" name="concern" value="갱년기 남성" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '갱년기 남성'}"> checked </c:if>
   </c:forEach>>갱년기 남성&nbsp
      
   <input type="checkbox" name="concern" value="갱년기 여성" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '갱년기 여성'}"> checked </c:if>
   </c:forEach>>갱년기 여성&nbsp<br>

      
   <input type="checkbox" name="concern" value="배뇨기능" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '배뇨기능'}"> checked </c:if>
   </c:forEach>>배뇨기능&nbsp

   <input type="checkbox" name="concern" value="뇌건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '뇌건강'}"> checked </c:if>
   </c:forEach>>뇌건강&nbsp
      
   <input type="checkbox" name="concern" value="심장병 예방" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '심장병 예방'}"> checked </c:if>
   </c:forEach>>심장병 예방&nbsp

      
   <input type="checkbox" name="concern" value="여성건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '여성건강'}"> checked </c:if>
   </c:forEach>>여성건강&nbsp<br>

   <input type="checkbox" name="concern" value="정신건강" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '정신건강'}"> checked </c:if>
   </c:forEach>>정신건강&nbsp

   <input type="checkbox" name="concern" value="항암" 
   <c:forEach var="concern" items="${mdto.concern}">
   <c:if test="${concern == '항암'}"> checked </c:if>
   </c:forEach>>항암&nbsp
   <p>
   

   		</span></li><p>
    	<li><span >가입경로 :</span><br> 
    	 <input type="radio" name="route" value="1" <c:if test="${mdto.route eq 1}"> checked </c:if>>인터넷, 
    	 <input type="radio" name="route" value="2" <c:if test="${mdto.route eq 2}"> checked </c:if>>SNS(카톡, 밴드 등),
    	 <input type="radio" name="route" value="3" <c:if test="${mdto.route eq 3}"> checked </c:if>>지인소개,<br>
    	 <input type="radio" name="route" value="4" <c:if test="${mdto.route eq 4}"> checked </c:if>>문제메세지,
    	 <input type="radio" name="route" value="5" <c:if test="${mdto.route eq 5}"> checked </c:if>>TV,
    	 <input type="radio" name="route" value="6" <c:if test="${mdto.route eq 5}"> checked </c:if>>인터넷  ,
    	<input type="radio" name="route" value="7" <c:if test="${mdto.route eq 6}"> checked </c:if>>신문
    	</li><p>  
    	
    	<li style="text-align:center;"> <input type="submit" style="width:200px;" value="저장하기"> </li><p>
    </ul>
    </form>
 </div>

 <%@ include file="../bottom.jsp" %>
