<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  #myinfo2{
      align:center;
      margin:0 auto;
      width:1400px;
      margin-bottom:600px;
      font-family: 'Gowun Dodum', sans-serif;
    }
   #h3,#h3hr{
      margin-left:300px;
      font-family: 'Gowun Dodum', sans-serif;
   }  
   #myinfomo{
     margin-top:-350px;
     margin-left:490px;
     text-shadow: none;
     text-align:center;
     width:700px;
   }
   #center{
     margin-top:420px;
     text-align:center;
   }
</style>
</head>
<body>
<div id="myinfo2">
<br><br><br><br><br><br>
<h3 id="h3">내 정보 수정</h3><hr id="h3hr">
<br><br><br>
	<div id="mypagemainlist">
		<a href="${pageContext.request.contextPath }/myinfo"><img width="20" height="20" src="${pageContext.request.contextPath}/resources/img/프로필i.jpg"/>&nbsp;<strong>내 정보</strong></a><br><br>
		<p><img width="20" height="20" src="${pageContext.request.contextPath}/resources/img/글쓰기i.png"/>&nbsp;<strong>내가 쓴 글</strong></p>
		<a href="${pageContext.request.contextPath }/mysboardlist">&nbsp;&nbsp; - 판매글</a><br><br>
		<a href="${pageContext.request.contextPath }/mydboardlist">&nbsp;&nbsp; - 경매글</a><br><br>
	    <a href="${pageContext.request.contextPath }/mydongboardlist">&nbsp;&nbsp; - 동네커뮤니티글</a><br><br>
	    <a href="${pageContext.request.contextPath }/myqnaboardlist">&nbsp;&nbsp; - Q & A</a><br><br>
	    <a href="${pageContext.request.contextPath }/myreplylist"><img width="20" height="20" src="${pageContext.request.contextPath}/resources/img/댓글i.png"/>&nbsp;<strong>내가 쓴 댓글</strong></a>

<form method="post" action="${pageContext.request.contextPath }/modifyresult" >

<table class="table table-striped" id="myinfomo">
<br>
<thead>
   <tr><th>아이디</th>
       <th><input type="text" name="user_id" value="${list.user_id }" readonly="readonly"/></th></tr>
   <tr><th>핸드폰 번호</th>
       <th><input type="text" name="phoneno" value="${list.phoneno }"/></th></tr>
   <tr><th>이메일</th>
       <th><input type="text" name="email" value="${list.email }"/></th></tr>
   <tr><th>이름</th>
       <th><input type="text" name="user_name" value="${list.user_name }"/></th></tr>
   <tr><th>생년월일</th>
       <th><input type="text" name="birthday" value="${list.birthday }" readonly="readonly"/></th></tr>
   <tr><th>주소</th>
       <th><input type="text" value="${list.addr1 }/${list.addr2 }" readonly/></th></tr>
   <tr><th></th><th>	<select name="addr1" id="addr1"></select>
   				<select name="addr2" id="addr2"></select><th></tr>
   <tr><th>성별</th>
       <th><c:out value="${list.gender }"/></th></tr>
</table>
<div id="center" style="margin-left:600px; margin-top:50px;">
<input type="submit" value="수정">
<input type="reset" value="취소">
</div><br><br><br><br>
</form>
<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
</div>
</div>
</body>
</html>