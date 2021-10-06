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
    <h3>내가 쓴 댓글</h3><hr>
    <%@ include file="../member/mypagemainlist.jsp" %>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>댓글번호</th>
				<th>내용</th>
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
						<td><a href="tdealdetail/${item.replyno }"><c:out value="${item.reply_content }"></c:out></td>
						<td><c:out value="${item.reply_writedate }"/></td>
						<td><c:out value="${item.user_id }"/></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>