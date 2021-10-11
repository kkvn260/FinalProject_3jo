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
   #myreplylist{
      float:right;
      position:absolute;
      right:360px;
      top:220px;
      width:950px;
   }
</style>
</head>
<body>
<br><br><br><br>
    <h3>내가 쓴 댓글</h3><hr>
    <%@ include file="../member/mypagemainlist.jsp" %>
	<table class="table table-striped" id="myreplylist">
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
						<c:if test="${item.qnano==0 && item.chatno==0 && empty item.deal_price}">
						<td><a href="twritedetail/${item.tradeno }"><c:out value="${item.reply_content }"></c:out></a></td>
						</c:if>
						<c:if test="${item.qnano==0 && item.chatno==0 && empty item.sell_price}">
						<td><a href="tdealdetail/${item.tradeno }"><c:out value="${item.reply_content }"></c:out></a></td>
						</c:if>
						<c:if test="${item.chatno==0 && item.tradeno==0}">
						<td><a href="qwritedetail/${item.qnano }"><c:out value="${item.reply_content }"></c:out></a></td>
						</c:if>
						<c:if test="${item.qnano==0 && item.tradeno==0}">
						<td><a href="dwritedetail/${item.chatno }"><c:out value="${item.reply_content }"></c:out></a></td>
						</c:if>
						<td><c:out value="${item.reply_writedate }"/></td>
						<td><c:out value="${item.user_id }"/></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>