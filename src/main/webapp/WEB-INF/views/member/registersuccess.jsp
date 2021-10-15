<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.entry{
		width: 1000px;
		height: 600px;
		background-image: url('${pageContext.request.contextPath}/resources/img/오이배경.jpg')
}
h2.title{
		text-shadow: 2px 2px 2px #666666; color: white; padding-top: 105px;
		text-align: left;
		font-size: 20px;
		padding-left: 30px;
	

}
#loginpg{
		text-shadow: 2px 2px 2px #666666; color: lime;
		font-size: 25px;
		padding-left: 30px;
}
h1{
		text-shadow: 2px 2px 2px #666666; color: white; padding-top:50px;
		text-align: left;
		font-size: 40px;
		padding-left: 30px;

}
 #reg2{
      align:center;
      margin-left:450px;
      width:1400px;
    
    }
</style>
</head>
<body>
<div id="reg2">
<br><br><br><br><br><br>

 

 <br>
 <div class="entry">
 <h1>hello!!</h1>
 <h2 class="title">환영합니다 !<br><br>
 회원가입이 정상적으로 이루어 졌습니다.<br><br>
 로그인 하시면 홈페이지 내의 모든 서비스를<br><br> 이용하실 수 있습니다!</h2><br>

 
 <a href="${pageContext.request.contextPath }/login" id="loginpg">로그인페이지로 </a>
 </div>
 </div>
</body>
</html>