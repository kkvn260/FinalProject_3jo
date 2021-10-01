<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<br><br><br><br>
<div class="main">
		<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
           <img class="w3-image" src="${pageContext.request.contextPath }/resources/img/test.jpg" width="1200" height="600">
           <div class="w3-display-middle w3-margin-top w3-center">
             <h1><a href="${pageContext.request.contextPath }/mainpage">오이마켓</a></h1>
             <h4>오늘도 이웃과 거래하는 <span id="oe">오이마켓</span></h4>
           </div>
       </header>
    </div>
<section id="content" >
 <div id="topview" style="float:left; margin-left:30px;"><br>
	<h3>판매 인기글 TOP10 미리보기</h3><hr>
		<div id="preview">
		   <table>
			  <thead>
			    <tr><th>번호</th><th>제목</th><th>좋아요</th><th>조회수</th><th>작성자</th><th>작성일</th></tr>
			  </thead>
			  <tbody>
			      <c:forEach var="item" items="${list}">
			        <c:set var="number" value="${number+1 }" />
						<tr><td><c:out value="${number }" /></td>
						    <td><a href="twritedetail/${item.tradeno }"><c:out value="${item.title }"></c:out></a>
							<td><c:out value="${item.likeno }"></c:out></td>
							<td><c:out value="${item.viewno }"></c:out></td>
							<td><c:out value="${item.user_id }"></c:out></td>
							<td><c:out value="${item.writedate}"></c:out></td>
				   </c:forEach>
			   </tbody>
			</table>
		</div>
		 <br>
 </div>

 <div id="dongtopview" style="float:right; margin-right:30px"><br>
    <h3>동네 커뮤니티 인기글 TOP10 미리보기</h3><hr>
       <div id="dongpreview">
         <table>
            <thead>
              <tr><th>번호</th><th>제목</th><th>좋아요</th><th>조회수</th><th>작성자</th><th>작성일</th></tr>
			  </thead>
			<tbody>
			      <c:forEach var="item" items="${list2}">
			        <c:set var="number" value="${number+1 }" />
						<tr><td><c:out value="${number }" /></td>
						    <td><a href="dwritedetail/${item.chatno }"><c:out value="${item.title }"></c:out></a>
							<td><c:out value="${item.likeno }"></c:out></td>
							<td><c:out value="${item.viewno }"></c:out></td>
							<td><c:out value="${item.user_id }"></c:out></td>
							<td><c:out value="${item.writedate}"></c:out></td>
				   </c:forEach>
			 </tbody>
         </table>
       </div>
 </div>

</section>

</body>
</html>