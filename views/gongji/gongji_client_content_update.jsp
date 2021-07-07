<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" href="resources/css/gongji.css" type="text/css">
<style>
#gctable{
	border: 4px solid #e6e7e8;
	width:1000px;
	height:500px;
}
td{
	border: 4px solid #e6e7e8;
	text-align:center;
	font-size: 24px;
    font-weight: bold;
}

.btn_lg {
padding: 10px 30px;
font-size: 18px;
font-weight: bold;
line-height: 1.3333333;
border-radius: 3px;
margin: 0 4px;
}

.btn_primary {
	color: #fff;
	background-color: #74b243;
	border: 1px solid #497725;
}

.btn_default {
	color: #333;
	background-color: #fff;
	border: 1px solid #ccc;
}
</style>

<script>
function gdelete(id)
{
	var del_chk=window.confirm("삭제하시겠습니까?")
	if(del_chk==true)
	{
		location.href="gongji_client_content_delete?id="+id;
	}
}

function setThumbnail()
	{
		for (var image of event.target.files) {
			var reader=new FileReader();
			
			reader.onload = function(event)
			{
				var img = document.createElement("img");
				
				img.setAttribute("src",event.target.result);
				img.setAttribute("width","100");
				document.getElementById("imgview").innerHTML ="";  // 이전이미지 삭제
	            document.getElementById("imgview").appendChild(img);  //새로 선택한 이미지  출력

			};
			reader.readAsDataURL(image); 
		}
	}
</script>
<form method="post" action="gongji_client_content_update_ok?id=${gcdto.id}" enctype="multipart/form-data">
<input type="hidden" name="id" value="${gcdto.id}">
  <table id="gctable" align="center">
  <c:if test="${userid == gcdto.userid }">
    <tr>
     <td> 제목 </td>
     <td> <input type="text" name="title" style="width:950px; height:100px;" value="${gcdto.title}"> </td>
    </tr>
    <tr>
     <td> 내용 </td>
     <td> <textarea name="content" style="width:950px; height:400px">${gcdto.content}</textarea> </td>
    </tr>
    <tr style="display:none">
     <td> 답변 </td>
     <td> <textarea name="reply_text" style="width:950px; height:400px">${gcdto.reply_text}</textarea> </td>
    </tr>
    <tr>
     <td> 사진 </td>
     <td>
     <input type="file" name="img" onchange="setThumbnail();">
						<span id="imgview"></span>
     </td>
    </tr>
    <tr style="display:none">
     <td> 답변 확인 </td>
     <td>
     	<input type="text" name="reply" value="${gcdto.reply }">
     </td>
    </tr>
   </c:if>
    <c:if test="${userid == 'admin' }">
    <tr>
     <td> 제목 </td>
     <td>${gcdto.title}</td>
    </tr>
    <tr>
     <td> 내용 </td>
     <td>${gcdto.content}</td>
    </tr>
    <tr>
     <td> 답변 </td>
     <td> <textarea name="reply_text" style="width:950px; height:400px">${gcdto.reply_text}</textarea> </td>
    </tr>
    <tr>
     <td> 사진 </td>
     <td>
     <img width="100" src="resources/img/${gcdto.img}" >
     </td>
    </tr>
        <tr>
     <td> 답변 확인 </td>
     <td>
     	<input type="text" name="reply" value="${gcdto.reply}">
     </td>
    </tr>
   </c:if>
    <tr align="center">
     <td colspan="2">
     	<button type="submit" class="btn_lg btn_primary">수정하기</button>
      	<button type="button" class="btn_lg btn_default" onclick="location.href='gongji_client_content?id=${gcdto.id}'">뒤로가기</button>
     </td>
    </tr>
  </table>
 </form>
<%@ include file="../bottom.jsp"%>