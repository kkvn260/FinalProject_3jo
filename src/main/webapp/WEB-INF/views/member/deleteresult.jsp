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
<h3>회원 탈퇴</h3><hr>

<form method="post" action="${pageContext.request.contextPath }/delete">
 	<div>
 	    <label>정말 탈퇴 하시겠습니까?</label>
 		<input type="submit" value="탈퇴하기">
 		<input type="reset" value="취소">
 	</div>
 	
</form>

</body>
</html>