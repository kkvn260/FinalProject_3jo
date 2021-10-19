<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
</style>
</head>
<br><br><br><br><br><br>
	<body>
	<div style=" font-family: 'Gowun Dodum', sans-serif; margin-top:50px; margin-bottom:300px;">
    	<form action ="${pageContext.request.contextPath }/login" method="post">
            <!-- 네이버 로그인 창으로 이동 --> 
             <div id="naver_id_login" style="text-align:center">
            <label style="font-size:30px;">정말 네이버아이디로 로그인 하시겠습니까?</label><br><br>
             <a href="${url}"> 
                <img width="223" height="40" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>&nbsp;
             <a href="${pageContext.request.contextPath }/login" class="btn btn-danger">뒤로가기</a>
             </div>
    	</form>
    	</div>
	</body>
</html>