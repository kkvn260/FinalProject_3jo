<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br><br><br>
<h3>마이페이지</h3><hr>
<table class="table table-striped">
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
       <th><c:out value="${list.addr }"/></th></tr>
   <tr><th>성별</th>
       <th><c:out value="${list.gender }"/></th></tr>
   <tr><th>등급</th>
       <th><c:out value="${list.grade }"/></th></tr>
</table>

<input type="submit" id="infomodify" value="수정"  onclick="location.href='${pageContext.request.contextPath }/modify/${user_id}'">
<input type="submit" id="infodelete" value="탈퇴"  onclick="location.href='${pageContext.request.contextPath }/deleteresult'"> 
		

</body>
</html>