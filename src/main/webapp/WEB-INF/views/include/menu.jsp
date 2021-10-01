<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.user_id==null}">
           <a href="login">로그인</a>
		   <a href="registerForm">회원가입</a>
</c:if>
<c:if test="${sessionScope.user_id!=null }">
	<a href="logout">로그아웃</a>
	<a href="myinfo">마이페이지</a>
    </c:if>
</body>
</html>