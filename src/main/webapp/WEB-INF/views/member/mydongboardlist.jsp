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
   #mypagemainlist a:link{
     text-decoration:none;
     text-shadow: 2px 2px 2px pink;
   }
   #mypagemainlist{
     text-shadow: 2px 2px 2px pink;
     float:left;
     width:950px;
   }
   #mydongboardlist{
      margin-top:-300px;
      margin-left:250px;
      text-shadow: none;
   }
</style>
</head>
<body>
<br><br><br><br>
    <h3>나의 동네커뮤니티 글</h3><hr>
    <br><br><br>
	<div id="mypagemainlist">
		<a href="${pageContext.request.contextPath }/myinfo">★ 내 정보</a><br><br>
		<p>★ 내가 쓴 글</p>
		<a href="${pageContext.request.contextPath }/mysboardlist">&nbsp;&nbsp; - 판매글</a><br>
		<a href="${pageContext.request.contextPath }/mydboardlist">&nbsp;&nbsp; - 경매글</a><br>
	    <a href="${pageContext.request.contextPath }/mydongboardlist">&nbsp;&nbsp; - 동네커뮤니티글</a><br>
	    <a href="${pageContext.request.contextPath }/myqnaboardlist">&nbsp;&nbsp; - Q & A</a><br><br>
	    <a href="${pageContext.request.contextPath }/myreplylist">★ 내가 쓴 댓글</a>
	    
	<table class="table table-striped" id="mydongboardlist">
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
   </div>
</body>
</html>