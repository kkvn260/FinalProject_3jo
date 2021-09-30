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
   h2{color:blue;}
   h2 a{color:black;}
   h2 a:link{text-decoration:none;}
</style>
</head>
<body>
<br><br><br><br>
<div>
<h2><a href="${pageContext.request.contextPath }/selllist">판매글 게시판 / </a> 경매글 게시판</h2>
</div>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list!=null }">
				<c:forEach var="item" items="${list }">
					<c:set var="number" value="${number+1 }" />
					<tr>
						<td><c:out value="${number }" /></td>
						<td><c:out value="${item.user_id }" /></td>
						<td><a href="tdealdetail/${item.tradeno }"><c:out
									value="${item.title }" /></a></td>
						<td><c:out value="${item.writedate }" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<a href="write">글쓰기</a>

</body>
</html>