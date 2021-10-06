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
   form{
       text-align: center;
       margin:200px;
   }
  

   .border{
       margin:200px;
       width:400px;
       height:500px;
       border:3px solid #555555;
       border-radius: 10%;
       background-color: #336633;
   }

   #loginoe{
   width:60px;
   height:70px;
   border-bottom-left-radius:20px;
   border-bottom-right-radius:20px;
   border-top-right-radius:20px;
   border-top-left-radius:20px;
    margin-top:20px;
       margin-bottom:20px; 
   }

	h1{
		color: white;
		margin-top:5px;
		padding: 15px;
	
	}
   input{
       	width:300px;
      	height: 50px;
       	margin-bottom: 10px;
        border-bottom-left-radius:5px;
   		border-bottom-right-radius:5px;
   		border-top-right-radius:5px;
   		border-top-left-radius:5px;
        background-color: white;
   }
   #reoe{
       color:white;
   }
   #loginfind{
   		color: white;
   		font-weight: bold;
   }
   #register{
   		color: yellow;
   		font-weight: bold;
   }
   .border a{
       color:black;
       text-decoration:none;
   }
   #idfind{color: yellow; font-weight: bold;}
   #pwfind{color: yellow; font-weight: bold;}
	</style>
	</head>
	<body>
	<div id="loginform">
    	<form action ="${pageContext.request.contextPath }/login" method="post">
        	<div class="border">
            	<h1>login</h1>
            	<img src ="${pageContext.request.contextPath}/resources/img/52.png" id="loginoe"><br>
            	
                <input type="text"  name="user_id" id="user_id" placeholder="아이디"><br>
            	<input type="password" name="pwd" id="pwd" placeholder="비밀번호"><br><br>
            	<input type="submit" value="로그인"><br>
            	
            	<label id="reoe">아직 오이마켓 회원이 아니신가요?</label>
                <a href="${pageContext.request.contextPath }/registerForm" id="register">회원가입</a>
				<label id="loginfind">아이디와 비밀번호를 잊어버리셨습니까?</label><br>
				<a href="${pageContext.request.contextPath }/member/findid" id="idfind">ID찾기</a>
				<a href="${pageContext.request.contextPath }/member/findpwd" id="pwfind"> | PW찾기</a>
        	</div> 
    	</form>
    	</div>
	</body>
</html>