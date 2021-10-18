<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/css2.css" rel="stylesheet" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

.login-wrap{
 font-family: 'Gowun Dodum', sans-serif;
}
</style>
	</head>
	<body>
<br><br><br><br><br><br>
<div class="login-wrap">
	<div class="login-html">
    	<form action ="${pageContext.request.contextPath }/login" method="post">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"> </label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">Username</label>
					 <input type="text"  name="user_id" id="user_id" placeholder=" 아이디" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input type="password" name="pwd" id="pwd" placeholder=" 비밀번호" class="input">
				</div>
			
				<div class="group">
					<input type="submit" class="button" value="로그인">
				</div>
					<div class="hr"></div>
				
				   <div id="naver_id_login" style="text-align:center">
             <a href="${pageContext.request.contextPath }/naverlogin"> 
                <img width="350" height="50" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
             </div> 
			<br><br>
				<div class="foot-lnk">
					 <a href="${pageContext.request.contextPath }/registerForm" id="register">회원가입</a>
                     <span id="reoe">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
				     <a href="${pageContext.request.contextPath }/member/findid" id="idfind">ID찾기</a>
				     <span id="reoe">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
				     <a href="${pageContext.request.contextPath }/findpwd" id="pwfind">PW찾기</a>
				</div>
			</div>
			<div class="sign-up-htm">
	
			</div>
		</div>
		</form>
	</div>
</div><br><br><br>
</body>
</html>

