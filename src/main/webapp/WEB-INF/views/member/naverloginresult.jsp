<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/writeboard.css">
<style>
 @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
.modal1{
      align:center;
      margin:0 auto;
      width:800px;
      margin-left:700px;
      margin-top:-250px;
	  font-family: 'Gaegu', cursive;
 }
 select,input{
       font-family: 'Gaegu', cursive;
       font-size:20px;
 }
</style>
<body>
<br><br><br><br><br><br>
       <script type="text/javascript">
              alert("로그인 되셨습니다. 환영합니다.");
              alert("최초 네이버 로그인일 경우 주소 설정이 '필수' 입니다.");
       </script>
       <div>
       <img width="200" height="280" style="margin-top: 100px; margin-left:680px;" src="${pageContext.request.contextPath}/resources/img/52.png"/>
       <div class="modal1">
    	   <div class="modal_content">
       			<form action="modiaddr" method="post">
       				<label style="font-size:25px; color:red;"><strong>주소를 등록해주세요.</strong></label><br><br>
       				<input type="hidden" value="${id}" name="user_id">
       				<select name="addr1" id="addr1"></select>
					<select name="addr2" id="addr2"></select>
					<input type="submit" value="등록" class="btn btn-success">
       			</form>
 	      </div>
       </div><br><br><br><br>
       <script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
	</body>
</html>