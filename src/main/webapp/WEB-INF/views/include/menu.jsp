<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
 #login{
   font-size:20px;
   color:#FFCC00;
 }
</style>
<body>
<c:if test="${sessionScope.user_id==null}">
           <a href="${pageContext.request.contextPath }/login" id="login">로그인</a>&nbsp;&nbsp;
		   <a href="${pageContext.request.contextPath }/registerForm" id="login">회원가입</a>
</c:if>
<c:if test="${sessionScope.user_id!=null }">
	<a href="${pageContext.request.contextPath }/logout"  id="login">로그아웃</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath }/myinfo"  id="login">마이페이지</a>
    </c:if>
</body>
</html>