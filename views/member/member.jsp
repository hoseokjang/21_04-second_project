<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../top.jsp" %>
<style>
/*  body{
	margin: 0;
	padding: 0;

} */ 
#member{
	display:inline-block;
	position:lelative;
	list-style:none;
	width:100%; 
	/* height:900px; */
	text-align:center;
	/* border: 2px solid red; */} 

#member_wrap{ 
	display:inline-block;
	width: 350px; 
	/* max-height:900px; */
	/* padding-left:10px; */
	text-align:left; 
	position: lelative;
	/* left:10%; */
	/* transform:translate(-10%, 0%) */ ;  
  	 /* margin:0 -250px; */ 
	border-top: 3px solid green;}
	
#userid_wrap{ 
	width: 300px;
	text-align:left;
	position: relative;
	/* left:20.2%;  */
	/* transform:translate(-71%, 0%) */;
	/* border: 1px solid blue; */} 
	
.mb_frm{
	width: 200px;
	height:27px; 
	border: 1px solid green;}
	
/* #id_user{
	position: relative;
	left:50%;
	border: 1px solid green;} */
	
#id_msg{
	color:red;	
	width: 300px;
	position: relative;
	/* text-align:left; */
	/* left : 26px;  */
	/* border: 1px solid green; */}	

#pwd_msg{
	color:red;	
	width: 300px;
	position: relative;
	text-align:left;
	/* left : 65px; */ 
	/* border: 1px solid red; */}
	
#sex_wrap{
	
	width: 200px;
	text-align:left;}
	
</style>


<script>
   function userid_check()
   {   
	   
	   var chk=new XMLHttpRequest();
	   var userid=document.life.userid.value;
	   var pattern = /[0-9a-zA-Z]/;   // 문자+숫자  가능한 정규식
	   if(userid==""){
		   /* alert("공백은 사용 아이디 될 수 없습니다"); */
		   document.life.userid.focus();
		   document.getElementById("id_msg").innerHTML = "아이디를 입력해 주세요";
	   }
		else if(document.life.userid.value.length < 5)
		{
			alert("id는 5자이상입니다");
			document.getElementById("id_msg").innerHTML = "id는 5자이상이어야 합니다";
		}
	   
  		else if(!/^[A-Za-z\d]{5,8}$/.test(userid))
		{
           alert("5~8자리 영문자와 숫자만 입력하세요");
           document.life.userid.focus();
           document.getElementById("id_msg").innerHTML = "영문자와 숫자를 조합하여 사용하세요";
           return false;
		}			   
	   
	   else
		{		   
	   chk.open("get","userid_check?userid="+userid);
	   chk.send();
	   
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState==4)
		   {
			   if(chk.responseText=="1")
			   {
				   alert("이미 사용중인 아이디 입니다");
				   document.life.userid.focus();
				   document.getElementById("id_msg").innerHTML = "이미 사용중인 아이디 입니다";
				   document.life.userid.value="";
				   
			   }
			   else
			   {
				   alert("사용 가능한 아이디 입니다");
				   document.getElementById("id_msg").innerHTML = "사용 가능한 아이디 입니다";
			   }	   
			  // 한글처리 : alert(decodeURI(chk.responseText));
		   }
	   }
	 }
   }
   
   
   function pwd_check()
   {   
	   
	   var pwd=document.life.pwd.value;
	   if(pwd==""){
		   /* alert("사용할 비밀번호를 입력해 주세요"); */
		   document.life.pwd.focus();
		   alert("패스워드를 입력해 주세요");
		   document.getElementById("pwd_msg").innerHTML = "패스워드를 입력해 주세요";
	   }
			else if(document.life.pwd.value.length < 5)
			{
				alert("패스워드는 5자이상입니다");
				document.getElementById("pwd_msg").innerHTML = "패스워드는 5자이상입니다.";
			}
	   
			else if(document.life.pwd.value != document.life.pwd2.value)
				{
				alert("비밀번호가 서로 다릅니다.")
				document.getElementById("pwd_msg").innerHTML = "비밀번호가 서로 다릅니다.";
				}
	  		
			else if(!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$/.test(pwd))
			{
			           alert("영문자와 숫자를 함께 입력하세요");
			           document.life.pwd.focus();
			           document.getElementById("pwd_msg").innerHTML = "영문자와 숫자를 조합하여 사용하세요";
			           return false;
			}	
	   

			else
				{
				alert("사용가능한 패스워드입니다")
				document.getElementById("pwd_msg").innerHTML = "사용가능한 패스워드입니다";
				}

		return   
	  }
   
   
	function check()  //
	{
		var my = document.life;  
		var userid=document.life.userid.value;
		var pwd=document.life.pwd.value;
		if(document.life.userid.value=="")
		{
			alert("아이디를 입력하세요");
			document.life.userid.focus();
			return false;
		} 
		
  		else if(!/^[A-Za-z\d]{5,8}$/.test(userid))
		{
           alert("5~8자리 영문자와 숫자를 조합하여 사용하세요");
           document.life.userid.focus();
           document.getElementById("id_msg").innerHTML = "영문자와 숫자를 조합하여 사용하세요";
           return false;
		}	
 
		else if(document.life.pwd.value.length < 5)
			{
				alert("비밀번호는 5자이상입니다");
				document.getElementById("pwd_msg").innerHTML = "비밀번호는 5자이상입니다";
				return false;
			}
		else if(document.life.pwd.value != document.life.pwd2.value)
			{
				alert("비밀번호가 서로 다릅니다.")
				document.getElementById("pwd_msg").innerHTML = "비밀번호가 서로 다름니다.";
				my.pwd.value="";
				my.pwd2.value="";
				return false;
			}
		
		else if(!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$/.test(pwd))
		{
		           alert("영문자와 숫자를 함께 입력하세요");
		           document.life.pwd.focus();
		           document.getElementById("pwd_msg").innerHTML = "영문자와 숫자를 함께 입력하세요";
		           return false;
		}
				else
					return	true; 
	}

 </script>

<div align="center" id="member">
<caption> <h3> 회원 가입하기 </h3> </caption>
<div id="member_wrap">
   <form name="life" method="post" action="member_ok" onsubmit="return check()" >
 <div id=userid_wrap>  
    <br><input type="text" name="userid" class="mb_frm" placeholder="아이디" required > 
    <input type="button" value="중복확인" onclick="userid_check()">
    <div id="id_msg"> </div>
    <p>
 </div>
 <div>
   <input type="password" name="pwd" class="mb_frm" placeholder="비밀번호" required >
   <div id="pwd_msg"></div><p>
 </div>  
 <div>
   <input type="password" name="pwd2" class="mb_frm" placeholder="비밀번호 확인" required onblur="pwd_check()" ><p>
  
 </div>  
 <div>
    <input type="text" name="nickname" class="mb_frm" placeholder="닉네임" required><p>  
 </div>
 <div>
    <input type="text" name="email" class="mb_frm" placeholder="이메일"required ><p> 
 </div>
<div id="sex_wrap">
    성별:&nbsp&nbsp<input type="radio" name="sex" value="0">남자,&nbsp&nbsp
    <input type="radio" name="sex" value="1">여자 <p> 
</div><p>
<div>
	출생년도:&nbsp&nbsp<select name="year" style="width:100px; height:27px;">
	<c:forEach var="i" begin="1920" end="2021">
			<option value="${i}">${i}</option>
	</c:forEach>
		</select>
</div><p>
	<p>건강관심분야:<br> 
   <input type="checkbox" name="concern" value="장 건강">장 건강&nbsp
   <input type="checkbox" name="concern" value="간 건강">간 건강&nbsp
   <input type="checkbox" name="concern" value="위 건강/소화 기능">위 건강/소화 기능&nbsp
   <input type="checkbox" name="concern" value="치아 건강">치아 건강&nbsp<br>
   <input type="checkbox" name="concern" value="관절/뼈 건강">관절/뼈 건강&nbsp
   <input type="checkbox" name="concern" value="피부 건강">피부 건강&nbsp
   <input type="checkbox" name="concern" value="신장/요로 건강">신장장요로 건강&nbsp<br>
   <input type="checkbox" name="concern" value="혈당 조절">혈당 조절&nbsp
   <input type="checkbox" name="concern" value="혈압 조절">혈압 조절&nbsp
   <input type="checkbox" name="concern" value="콜레스테롤 개선">콜레스테롤 개선&nbsp<br>
   <input type="checkbox" name="concern" value="혈중중성지방 개선">혈중중성지방 개선&nbsp
   <input type="checkbox" name="concern" value="혈행개선">혈행개선&nbsp
   <input type="checkbox" name="concern" value="체지방 감소">체지방 감소&nbsp<br>
   <input type="checkbox" name="concern" value="면역기능">면역기능&nbsp
   <input type="checkbox" name="concern" value="면역과민피부 개선">면역과민피부 개선&nbsp
   <input type="checkbox" name="concern" value="항산화">항산화&nbsp<br>
   <input type="checkbox" name="concern" value="피로 개선">피로 개선&nbsp
   <input type="checkbox" name="concern" value="긴장완화">긴장완화&nbsp
   <input type="checkbox" name="concern" value="수면 질 개선">수면 질 개선&nbsp
   <input type="checkbox" name="concern" value="기억력 개선">기억력 개선&nbsp<br>
   <input type="checkbox" name="concern" value="인지능력 개선">인지능력 개선&nbsp
   <input type="checkbox" name="concern" value="운동수행능력 개선">운동수행능력 개선&nbsp
   <input type="checkbox" name="concern" value="근력 개선">근력 개선&nbsp<br>
   <input type="checkbox" name="concern" value="칼슘흡수 촉진">칼슘흡수 촉진&nbsp
   <input type="checkbox" name="concern" value="어린이 성장">어린이 성장&nbsp
   <input type="checkbox" name="concern" value="정자 운동성">정자 운동성&nbsp<br>
   <input type="checkbox" name="concern" value="전립선 건강">전립선 건강&nbsp
   <input type="checkbox" name="concern" value="질내 유익균 증식, 유해균 억제">질내 유익균 증식, 유해균 억제&nbsp<br>
   <input type="checkbox" name="concern" value="월경전상태 개선">월경전상태 개선&nbsp
   <input type="checkbox" name="concern" value="갱년기 남성">갱년기 남성&nbsp
   <input type="checkbox" name="concern" value="갱년기 여성">갱년기 여성&nbsp<br>
   <input type="checkbox" name="concern" value="배뇨기능">배뇨기능&nbsp
   <input type="checkbox" name="concern" value="뇌건강">뇌건강&nbsp
   <input type="checkbox" name="concern" value="심장병 예방">심장병 예방&nbsp
   <input type="checkbox" name="concern" value="여성건강">여성건강&nbsp<br> 
   <input type="checkbox" name="concern" value="정신건강">정신건강&nbsp
   <input type="checkbox" name="concern" value="항암">항암&nbsp 
   <p>
      
   <!-- <input type="text" name="concern" class="mb_frm" placeholder="관심질환"><p> -->
    가입경로:<br> <input type="radio"  name="route" value="1">인터넷,      
    <input type="radio"  name="route" value="2">SNS(카톡,밴드 등),<br>
    <input type="radio"  name="route" value="3">지인소개,
    <input type="radio"  name="route" value="4">문자메세지,  
    <input type="radio"  name="route" value="5">TV,  
    <input type="radio"  name="route" value="6">신문 <p>  
    <div style="text-align:center;"> <input type="submit" value="가입하기" style="width:200px;"></div><p> 
   </form>
</div>




</div>

<%@ include file="../bottom.jsp" %>

