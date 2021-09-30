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
       margin:300px;
       width:400px;
       height:500px;
       border:3px solid #555555;
       border-radius: 10%;
       background-color: #336633;
   }

   img{
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
	</style>
	</head>
	<body>
	<div id="loginform">
    	<form action ="/Login" method="post">
        	<div class="border">
            	<h1>login</h1>
            	<img src ="${pageContext.request.contextPath}/resources/img/52.png"><br>
            	
                <input type="text"  name="id" id="id" placeholder="아이디"><br>
            	<input type="password" name="password" id="password" placeholder="비밀번호"><br><br>
            	<input type="submit" value="로그인">

        	</div> 
    	</form>
    	</div>
	</body>
</html>