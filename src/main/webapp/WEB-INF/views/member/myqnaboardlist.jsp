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
   #mypagemainlist a:link{
     text-decoration:none;
     text-shadow: 2px 2px 2px pink;
   }
   #mypagemainlist{
     text-shadow: 2px 2px 2px pink;
     float:left;
     width:950px;
   }
   #myqnaboardlist{
      margin-top:-400px;
      margin-left:300px;
      text-shadow: none;
   }
   #myinfo2{
      align:center;
      margin:0 auto;
      width:1400px;
      margin-bottom:1000px;
      font-family: 'Gowun Dodum', sans-serif;
   }    
   #img{
      width: 150px;
      height:150px;
      border-radius: 75px; 
   }
   #h3,#h3hr{
      margin-left:300px;
      font-family: 'Gowun Dodum', sans-serif;
   }
    td a:hover{color:green;}
      
</style>
</head>
<body>
<div id="myinfo2">
<br><br><br><br><br><br>
     <h3 id="h3">나의 Q&A 글</h3><hr id="h3hr">
    <br><br><br>
	<div id="mypagemainlist">
	<div style="background:url(${pageContext.request.contextPath}/resources/img/myinfo.png) no-repeat; opacity:0.8; z-index:-1; 
	                                width: 200px; height:420px; border-radius:60px; text-align:center;">
	     <br>
		<a href="${pageContext.request.contextPath }/myinfo"><img width="20" height="20" src="${pageContext.request.contextPath}/resources/img/프로필icon.jpg"/>&nbsp;<strong>내 정보</strong></a><br><br>
		<p><img width="20" height="20" src="${pageContext.request.contextPath}/resources/img/글쓰기i.png"/>&nbsp;<strong>내가 쓴 글</strong></p>
		<a href="${pageContext.request.contextPath }/mysboardlist">&nbsp;&nbsp; - 판매글</a><br><br>
		<a href="${pageContext.request.contextPath }/mydboardlist">&nbsp;&nbsp; - 경매글</a><br><br>
	    <a href="${pageContext.request.contextPath }/mydongboardlist">&nbsp;&nbsp; - 동네커뮤니티글</a><br><br>
	    <a href="${pageContext.request.contextPath }/myqnaboardlist">&nbsp;&nbsp; - Q & A</a><br><br>
	    <a href="${pageContext.request.contextPath }/myreplylist"><img width="20" height="20" src="${pageContext.request.contextPath}/resources/img/댓글i.png"/>&nbsp;<strong>내가 쓴 댓글</strong></a><br><br>
	    <a href="${pageContext.request.contextPath }/mylikelist"><img width="20" height="20" src="${pageContext.request.contextPath}/resources/img/하트.png"/>&nbsp;<strong>내가 좋아요 한 글</strong></a>
    </div>
	<table class="table table-hover" id="myqnaboardlist">
		<thead style="background-color:#CCFFCC;">
			<tr>
				<th>글번호</th>
				<th>제목</th>
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
						<td><a href="qwritedetail/${item.qnano }"><c:out value="${item.title }"></c:out></td>
						<td><c:out value="${item.writedate }" /></td>
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