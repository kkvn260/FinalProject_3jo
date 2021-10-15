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
.modal1{ position:absolute;
		width:100%;
		height:100%;
		top:0;
		left:0;
 }
</style>
<body>
<br><br><br><br><br><br>
       <script type="text/javascript">
              alert("로그인 되셨습니다. 환영합니다.");
              alert("최초 네이버 로그인일 경우 주소 설정이 '필수' 입니다.");
       </script>
       <div class="modal1">
    	   <div class="modal_content">
       			<form action="modiaddr" method="post">
       				<label>주소를 등록해주세요.</label><br>
       				<input type="hidden" value="${id}" name="user_id">
       				<select name="addr1" id="addr1"></select>
					<select name="addr2" id="addr2"></select>
					<input type="submit" value="등록">
       			</form>
 	      </div>
       </div>
       <script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
	</body>
</html>