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
</script>
<input type="hidden" name="id" value="${gcdto.id}">
  <table id="gctable" align="center">
    <tr>
     <td> 제목 </td>
     <td> ${gcdto.title} </td>
    </tr>
    <tr>
     <td> 내용 </td>
     <td> ${gcdto.content} </td>
    </tr>
    <tr>
     <td> 답변 </td>
     <td> ${gcdto.reply_text} </td>
    </tr>
    <tr>
     <td> 사진 </td>
     <td><img width="100" src="resources/img/${gcdto.img}" ></td>
    </tr>
    <tr align="center">
     <td colspan="2">
     <c:if test="${userid != 'admin' }">
     	<button type="button" class="btn_lg btn_default" onclick="location.href='gongji_client_content_update?id=${gcdto.id}'">수정</button>
     	<!-- <button type="button" class="btn_lg btn_default" onclick="location.href='javascript:gdelete(${gcdto.id})'">삭제</button>-->
      	<button type="button" class="btn_lg btn_default" onclick="location.href='gongji_client'">목록</button>
     </c:if>
     <c:if test="${userid == 'admin' }">
     	<button type="button" class="btn_lg btn_default" onclick="location.href='gongji_client_content_update?id=${gcdto.id}'">수정</button>
     	<button type="button" class="btn_lg btn_default" onclick="location.href='javascript:gdelete(${gcdto.id})'">삭제</button>
      	<button type="button" class="btn_lg btn_default" onclick="location.href='admin_client_list'">목록</button>
     </c:if>
     </td>
    </tr>
  </table>
  <br><br>
<%@ include file="../bottom.jsp"%>