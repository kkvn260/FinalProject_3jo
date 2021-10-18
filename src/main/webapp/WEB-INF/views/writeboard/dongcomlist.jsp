<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
 #h2{
    font-family: 'Gowun Dodum', sans-serif;
    background:url(${pageContext.request.contextPath}/resources/img/수채화이미지.png) no-repeat; opacity:0.8; z-index:-1;"
 }
#dongcomlist{
      align:center;
      margin:0 auto;
      width:1400px;
      font-family: 'Gowun Dodum', sans-serif;
	  font-size: 18px;
    }
  td a:hover{color:green;}
</style>
</head>
<body>
<br><br><br><br><br><br>
<div id="dongcomlist">
    <h2 id="h2">동네 커뮤니티</h2><hr>
	<table class="table table-hover">
		<thead style="background-color:#CCFFCC;">
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list!=null }">
				<c:forEach var="item" items="${list }">
					<c:set var="number" value="${number+1 }" />
					<tr>
						<td><c:out value="${number }" /></td>
						<td><c:out value="${item.user_id }" /></td>
						<td><a href="dwritedetail/${item.chatno }"><c:out value="${item.title }"></c:out></td>
						<td><c:out value="${item.viewno }"/></td>
						<td><c:out value="${item.writedate }" /></td>
					</tr>
				</c:forEach>
				<img width="60" height="80" style="margin-top: 20px" src="${pageContext.request.contextPath}/resources/img/52.png"/>
			</c:if>
		</tbody>
	</table>
	<c:if test="${id!=null }">
	<a href="dwrite" style="float:right;"><img width="110" height="40" src="${pageContext.request.contextPath}/resources/img/글쓰기.png"></a><br>
	</c:if>
	</div><br><br>
</body>
</html>