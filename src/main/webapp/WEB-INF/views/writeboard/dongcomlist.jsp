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
	
	<div style="text-align:center;">
		<c:if test="${page.prev}">
			<a href="dongcomlist?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}">
			  <c:out value="이전"/>
			</a> 
	   </c:if>
   
	   <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock }">
			  <c:if test="${index==page.currPage}">
					<c:out value="${index }"/>
		   </c:if>
			  <c:if test="${index!=page.currPage }">
				<a href="dongcomlist?currPage=${index }&search=${search}&searchtxt=${searchtxt}">
					<c:out value="${index }"/>
				</a> 
		   </c:if>
	  </c:forEach>
   
	  <c:if test="${page.next}">
		<a href="dongcomlist?currPage=${page.endBlock+1}&search=${search}&searchtxt=${searchtxt}">
			 <c:out value="다음"></c:out>
		  </a>
	   </c:if><br><br><br><br>
  
	  <form method="get" action="dongcomlist">
		  <select name="search">
			<option value="total">전체</option>
			<option value="user_id">회원ID</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="addr">지역</option>
		  </select>
		  <input type="text"  name="searchtxt">
		  <input type="submit" value="검색">
	  </form>
		  
	</div>
	</div><br><br>
</body>
</html>