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
  #myinfo2{
      align:center;
      margin:0 auto;
      width:1400px;
    
    }
</style>
</head>
<body>
<div id="myinfo2">
<br><br><br><br><br><br>
<h3>내정보 수정</h3><hr>
<form method="post" action="${pageContext.request.contextPath }/modifyresult" >

<table class="table table-striped">
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
<input type="submit" value="수정">
<input type="reset" value="취소">
</form>
<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
</div>

</body>
</html>