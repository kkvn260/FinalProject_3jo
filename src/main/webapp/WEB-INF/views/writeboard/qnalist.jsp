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
#qnalist{
      align:center;
      margin:0 auto;
      width:1400px;
    }
</style>
</head>
<body>
<br><br><br><br><br><br>
<div id="qnalist">   
    <h2>Q & A 게시판</h2><hr>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>제목</th>
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
						<td><a href="qwritedetail/${item.qnano }"><c:out value="${item.title }"></c:out></td>
						<td><c:out value="${item.writedate }" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<c:if test="${id!=null }">
	<a href="qwrite" class="btn btn-success pull-right">글쓰기</a><br>
	</c:if>
</div>
</body>
</html>