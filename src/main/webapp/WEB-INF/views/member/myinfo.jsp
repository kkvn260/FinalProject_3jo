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
   #myinfo{
     margin-top:-350px;
     margin-left:480px;
     text-shadow: none;
     text-align:center;
     width:700px;
   }
   #center{
     margin-top:420px;
     text-align:center;
   }
    #myinfo2{
      align:center;
      margin:0 auto;
      width:1400px;
      font-family: 'Gowun Dodum', sans-serif;
    }
    #h3,#h3hr{
      margin-left:300px;
      font-family: 'Gowun Dodum', sans-serif;
    }
</style>
<body>

<div id="myinfo2">
<br><br><br><br><br><br>
<h3 id="h3">내 정보</h3><hr id="h3hr">
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
<table class="table table-striped"  id="myinfo">
<thead>
   <tr><th>아이디</th>
       <th><c:out value="${list.user_id }"/></th></tr>
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
</thead>
</table>
</div>
<div id="center" style="margin-left:240px; margin-bottom:100px;">
  <input type="submit" id="infomodify" class="btn btn-success" value="수정"  onclick="location.href='${pageContext.request.contextPath }/modify/${user_id}'">
  <input type="submit" id="infodelete" class="btn btn-danger" value="탈퇴"  onclick="location.href='${pageContext.request.contextPath }/deleteresult'"> 
</div>
</div>
</body>
</html>