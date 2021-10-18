<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/writeboard.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=vjjh2gafg5"></script>
<script>
function can() {
	 if (!confirm("글작성을 그만 하시겠습니까?")) {
        
    } else {
        location.href="${pageContext.request.contextPath }/selllist";
    }
}
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gaegu&display=swap');
 #qwrite{
      align:center;
      margin:0 auto;
      width:1400px;
    }
li input{
	border:none;
	outline: none;
}
#hr{
	border: 1px solid green;
}
#replyarea input{
	border-bottom: 1px solid silver;
}
.btn1{
	background-color: white;
}
.btn1:hover{
	color: green;
	text-decoration: underline;
}
 ul li,label{
	font-family: 'Gaegu', cursive;
	font-size: 22px;
	font-weight: bold;
}
hr{
	color: green;
}
option,select {
	font-size: 22px;
	font-family: 'Gaegu', cursive;
}
input {
	font-family: 'Gaegu', cursive;
	font-size: 22px;
	border: 0;
}
input:focus, textarea:focus{
	outline: none;
}
textarea{
	border: none;
}
.hr1{
	color: green;
}
</style>
<body>
<div id="qwrite">
<br><br><br><br><br><br>
<form method="post" action="qwriteresult" enctype="multipart/form-data"> <!-- detail로 이동 -->
<ul>
	<li>
		<label for="category">카테고리</label>
		<select name="category">
			<option >카테고리를 설정해주세요</option>
			<option value="질문" >질문</option>
			<option value="신고" >신고</option>
		</select>
		<hr id="hr">
	</li>
	<li>
		<input type="hidden" id="user_id" name="user_id" value="${id }">
		<label>제목</label>
		<input type="text" id="title" name="title" placeholder="제목" required size="100">
		<hr id="hr">
	</li>
		<li>
			<div class="filebody">
				<div id="attach">
					<label class="upload" for="filedata">사진첨부</label><span style="font-size: 15px;"> << 클릭</span>
					<input id="filedata" type="file" name="filedata" style="display: none" multiple accept="image/*"/>
				</div>
				<div id="preview" class="filecontent"></div>
				<div class="clear"></div><hr id="hr">
			</div>
		</li>
	<li>
		<label>내용</label>
		<hr id="hr">
		<textarea rows="20" cols="100" name="content" id="content" style="resize: none;" required></textarea>
	</li>
	<li><hr id="hr">
		<input type="submit" value="등록" class="btn1">
		<input type="button" value="취소" class="btn1" onclick="can()">
	</li>
</ul><br><br><br><br>

</form>

<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
</div>
</body>
</html>