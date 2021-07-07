<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" href="resources/css/gongji.css" type="text/css">
<style>
	
</style>
</head>
<form method="post" action="gongji_update_ok">
	<input type="hidden" name="id" value="${gldto.id}">
	<div align="center">
		제목<input type="text" name="head" style="width:1000px;height:40px;font-size:20px;" value="${gldto.head}">
	</div>
	<div align="center">
	내용<textarea name="body" style="width:1000px;height:500px;font-size:20px;">${gldto.body}</textarea>
	</div>
	<div align="center">
		<input type="submit" value="글수정">
	</div>
</form>
<%@ include file="../bottom.jsp"%>