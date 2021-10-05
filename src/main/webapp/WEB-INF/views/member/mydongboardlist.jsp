<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<br><br><br><br>
    <h3>나의 동네커뮤니티 글</h3><hr>
    <%@ include file="../member/mypagemainlist.jsp" %>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>좋아요</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list!=null }">
				<c:forEach var="item" items="${list }">
					<c:set var="number" value="${number+1 }" />
					<tr>
						<td><c:out value="${number }" /></td>
						<td><a href="dwritedetail/${item.chatno }"><c:out value="${item.title }"></c:out></td>
						<td><c:out value="${item.likeno }"/></td>
						<td><c:out value="${item.viewno }" /></td>
						<td><c:out value="${item.writedate }" /></td>
						<td><c:out value="${item.user_id }"/></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>