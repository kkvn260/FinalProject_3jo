<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function(){
	$("#btnLogin").click(function(){
		var user_id= $("#user_id").val();
		var pwd= $("#pwd").val();
		if(user_id == ""){
			alert("아이디를 입력하세요");
			$("#user_id").focus();//입력포커스 이동
			return; //함수 종료
		}
		if(pwd == ""){
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return;
		}
		document.form1.action="${path}/loginCheck"
		document.form1.submit();
	});
});
</script>
</head>
<body>
<h2>로그인</h2>
<form name="form1" method="post" >
<table border="1" width="400px">
<tr>
	<td>아이디</td>
	<td><input type="text" name="user_id" id="user_id"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="pwd" id="pwd"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="button" id="btnLogin">로그인</button>
	<c:if test="${msg == 'failure' }">
		<div style="color: red">
			아이디 또는 비밀번호가 일치하지 않습니다
		</div>
	</c:if>
	<c:if test="${msg == 'logout' }">
		<div style="color: red">
			로그아웃되었습니다.
		</div>
	</c:if>
	</td>
</tr>
</table>
</form>
</body>
</html>