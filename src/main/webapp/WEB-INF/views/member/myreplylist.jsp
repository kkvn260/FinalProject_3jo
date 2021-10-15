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
   #myreplylist{
      margin-top:-300px;
      margin-left:250px;
      text-shadow: none;
   }
     #myinfo2{
      align:center;
      margin:0 auto;
      width:1400px;
</style>
</head>
<body>
<div id="myinfo2">
<br><br><br><br>
    <h3>내가 쓴 댓글</h3><hr>
    <br><br><br>
	<div id="mypagemainlist">
		<a href="${pageContext.request.contextPath }/myinfo">★ 내 정보</a><br><br>
		<p>★ 내가 쓴 글</p>
		<a href="${pageContext.request.contextPath }/mysboardlist">&nbsp;&nbsp; - 판매글</a><br>
		<a href="${pageContext.request.contextPath }/mydboardlist">&nbsp;&nbsp; - 경매글</a><br>
	    <a href="${pageContext.request.contextPath }/mydongboardlist">&nbsp;&nbsp; - 동네커뮤니티글</a><br>
	    <a href="${pageContext.request.contextPath }/myqnaboardlist">&nbsp;&nbsp; - Q & A</a><br><br>
	    <a href="${pageContext.request.contextPath }/myreplylist">★ 내가 쓴 댓글</a>
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
  </div>
 </div>
</body>
</html>