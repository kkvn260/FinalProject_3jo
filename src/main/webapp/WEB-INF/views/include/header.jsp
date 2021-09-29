<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<c:if test="${msg =='success' }">
<h2>${sessionScope.nick_name }(${sessionScope.user_id })님 환영합니다</h2>
</c:if>
  
    <div class="main">
		<header>
		        <img src="${pageContext.request.contextPath }/resources/img/52.png" width="60px" height="90px">
				<h1><a href="${pageContext.request.contextPath }/mainpage">&nbsp;오이마켓</a></h1><br><br><br>
				<h4>&nbsp;&nbsp;오늘도 이웃과 거래하는 오이마켓</h4>
		</header>
    </div>
        <hr>
		<nav class="menu">
		<ul>
			<li><a href="${pageContext.request.contextPath }/mainpage">전체</a></li>
			<li><a href="${pageContext.request.contextPath }/selllist">판매</a></li>
			<li><a href="">동네 커뮤니티</a></li>
			<li><a href="${pageContext.request.contextPath }/qnalist">Q&A</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
		</ul>
		</nav>
		<hr>

</body>
</html>