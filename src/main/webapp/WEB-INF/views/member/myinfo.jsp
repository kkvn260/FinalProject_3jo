<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
   #myinfo{
     margin-top:-300px;
     margin-left:300px;
     text-shadow: none;
   }
   #center{
     margin-top:420px;
   }
</style>
<body>
<br><br><br><br>
<h3>내 정보</h3><hr>

 <br><br><br>
	<div id="mypagemainlist">
		<a href="${pageContext.request.contextPath }/myinfo">★ 내 정보</a><br><br>
		<p>★ 내가 쓴 글</p>
		<a href="${pageContext.request.contextPath }/mysboardlist">&nbsp;&nbsp; - 판매글</a><br>
		<a href="${pageContext.request.contextPath }/mydboardlist">&nbsp;&nbsp; - 경매글</a><br>
	    <a href="${pageContext.request.contextPath }/mydongboardlist">&nbsp;&nbsp; - 동네커뮤니티글</a><br>
	    <a href="${pageContext.request.contextPath }/myqnaboardlist">&nbsp;&nbsp; - Q & A</a><br><br>
	    <a href="${pageContext.request.contextPath }/myreplylist">★ 내가 쓴 댓글</a>

<table class="table table-striped"  id="myinfo">
<thead>
   <tr><th>아이디</th>
       <th><c:out value="${list.user_id }"/></th></tr>
   <tr><th>닉네임</th>
       <th><c:out value="${list.nick_name }"/></th></tr>
   <tr><th>핸드폰 번호</th>
       <th><c:out value="${list.phoneno }"/></th></tr>
   <tr><th>이메일</th>
       <th><c:out value="${list.email }"/></th></tr>
   <tr><th>이름</th>
       <th><c:out value="${list.user_name }"/></th></tr>
   <tr><th>생년월일</th>
       <th><c:out value="${list.birthday }"/></th></tr>
   <tr><th>주소</th>
       <th><c:out value="${list.addr1 }/${list.addr2 }"/></th></tr>
   <tr><th>성별</th>
       <th><c:out value="${list.gender }"/></th></tr>
   <tr><th>등급</th>
       <th><c:out value="${list.grade }"/></th></tr>
</thead>
</table>
</div>
<center id="center">
  <input type="submit" id="infomodify" value="수정"  onclick="location.href='${pageContext.request.contextPath }/modify/${user_id}'">
  <input type="submit" id="infodelete" value="탈퇴"  onclick="location.href='${pageContext.request.contextPath }/deleteresult'"> 
</center>

</body>
</html>