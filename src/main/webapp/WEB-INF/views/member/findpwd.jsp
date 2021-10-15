
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
	font-size: 35px;
	font-weight: bold;
	color: darkgreen;
	}

input{
	width: 300px;
	height: 50px;
	
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}
#pwdfindbtn{
	width: 360px;
	background-color: #f1db90;
	border: 2px solid #576d64;
	color: black;
	font-weight: bold;
}
#content{
 	width: 600px;
 	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

</style>


</head>
<body>
<br><br><br><br><br><br>
<div id= "container" align="center" >
<br><br>

<form id="content" action="findpwd" method="post" style="border: 2px solid silver">
	<div class="subtitle" align="center" style="font-weight: bold;">
		<h2>로그인에 문제가 있나요?</h2>
		<p>가입한 이메일을 입력하면 다시 계정에 로그인 할 수 있는 임시 비밀번호를 보내드립니다.</p>
	</div>
	<div class="input" align="center">
	<label for="email">이메일</label>
		<input type="email" id="email" name="email" required="">
		
	   
	</div><br><br>
	<div id="btn" align="center">
	<input type="submit" id="pwdfindbtn" value="비밀번호찾기">
	</div>
	<br>
	<div id="loginbtn" align="center" style="font-weight: bold">
		<a href="${pageContext.request.contextPath }/login">로그인으로 돌아가기</a>
	</div>
</form>

</div>




</body>
</html>