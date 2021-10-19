
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
#container{
	background-color: white;
	 font-family: 'Gowun Dodum', sans-serif;
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
	background-color:#FF8833;
	border: 1px solid white;
	color: white;
	font-weight: bold;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}
#loginbtn{
border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}
#content{
 	width: 700px;
 	height: 400px;
}



</style>


</head>
<body>
<br><br><br><br><br><br>
<div id= "container" align="center" >
<br><br>

<form id="content" action="findpwd" method="post" >
	<div class="subtitle" align="center" style="font-weight: bold;">
		<br><br>
		<h2 style="font-size: 35px;  font-family: 'Gowun Dodum', sans-serif;">PW 찾기</h2>
		<p>가입한 이메일을 입력하면 다시 계정에 로그인 할 수 있는 임시 비밀번호를 보내드립니다.</p>
	</div>
	<br><br>
	<div class="input" align="center">
	<label for="email">이메일</label>
		<input type="email" id="email" name="email" required="">
		
	   
	</div><br><br>
	<div id="btn" align="center">
	<button id=loginbtn style="width: 250px; height: 50px; border: 1px solid white; background-color: #ff3344" ><a href="${pageContext.request.contextPath }/login" style="color: white;">로그인으로 </a></button>
	<input type="submit" id="pwdfindbtn" value="비밀번호찾기" style="width: 250px; height: 50px">
		
	</div>
</form>

</div>




</body>
</html>