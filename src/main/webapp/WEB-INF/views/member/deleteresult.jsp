<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
  #delmember{
      align:center;
      margin:0 auto;
      width:1400px;
      font-family: 'Gowun Dodum', sans-serif;
      margin-bottom:400px;
    }
     #h3,#h3hr{
      margin-left:300px;
      font-family: 'Gowun Dodum', sans-serif;
   }  
   #mypagemainlist{
     text-shadow: 2px 2px 2px pink;
     float:left;
     width:950px;
   }
   #delm{
     margin-top:-350px;
     margin-left:490px;
     text-shadow: none;
     text-align:center;
     width:700px;
   }
</style>
</head>
<body>
<div id="delmember">
<br><br><br><br><br><br>
<h3 id="h3">회원 탈퇴</h3><hr id="h3hr">
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
<form method="post" action="${pageContext.request.contextPath }/delete">
 	<div id="delm">
 	    <label style="font-size:30px;">정말 탈퇴 하시겠습니까? :( </label><br><br><br>
 		<input type="submit" value="탈퇴하기" class="btn btn-danger">
 		<input type="reset" value="취소" class="btn btn-success">
 	</div>
</form>
</div>
</div>

</body>
</html>