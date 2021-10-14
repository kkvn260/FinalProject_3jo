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
       height:600px;
       border:3px solid #555555;
       border-radius: 10%;
       background-color: #CCFF99;
   }
   
   #loginoew{
      color:#336600;
      text-shadow: 1px 1px 1px yellow;
      width:300px;
      margin-bottom:20px; 
   }
   #loginoe{
      height:100px;
      margin-top:20px;
   }

	h2{
		color: #336600;
		margin-top:20px;
	
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
   #reoe,#or, #loginfind{
       color: #336600;
   }
   #register, #idfind , #pwfind{
   		color: #336600;
   		
   }
   .border a{
       color:black;
       text-decoration:none;
   }

   </style>
	</head>
	<body>
	<div id="loginform">
    	<form action ="${pageContext.request.contextPath }/login" method="post">
        	<div class="border">
                <img src ="${pageContext.request.contextPath}/resources/img/greenoe.jpg" id="loginoe"><br>
            	<label id="loginoew">&nbsp;오이마켓 방문을 환영합니다</label><br><br>
            	
                <input type="text"  name="user_id" id="user_id" placeholder=" 아이디"><br>
            	<input type="password" name="pwd" id="pwd" placeholder=" 비밀번호"><br><br>
            	<input type="submit" value="로그인"><br>
            <label id="or">or</label>
            <!-- 네이버 로그인 창으로 이동 --> 
             <div id="naver_id_login" style="text-align:center">
             <a href="${pageContext.request.contextPath }/naverlogin"> 
                <img width="300" height="50" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
             </div> 
			<div id="kakao_id_login" style="text-align:center">
             <a href="${pageContext.request.contextPath }/kakaologin"> 
                <img width="250" height="38" style="margin-top: 5px" src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png"/></a>
             </div>
            	
                <a href="${pageContext.request.contextPath }/registerForm" id="register">회원가입</a>
                <span id="reoe">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
				<a href="${pageContext.request.contextPath }/member/findid" id="idfind">ID찾기</a>
				<span id="reoe">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
				<a href="${pageContext.request.contextPath }/findpwd" id="pwfind">PW찾기</a>
        	</div> 
    	</form>
    	</div>
	</body>
</html>