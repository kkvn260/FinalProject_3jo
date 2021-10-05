<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #mypagemainlist a:link{
     text-decoration:none;
     text-shadow: 2px 2px 2px pink;
   }
   #mypagemainlist{
     float:left;
   }
</style>
</head>
<body>

	<div id="mypagemainlist">
		<a href="${pageContext.request.contextPath }/myinfo">★ 내 정보</a><br><br>
		<a href="${pageContext.request.contextPath }/mydboardlist">★  판매글</a><br><br> 
	    <a href="${pageContext.request.contextPath }/mydongboardlist">★ 나의 동네커뮤니티글</a><br><br>
	    <a href="${pageContext.request.contextPath }/myqnaboardlist">★ 나의 Q & A</a><br><br>
	</div>
</body>
</html>