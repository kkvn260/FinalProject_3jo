
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
	font-size: 35px;
	font-weight: bold;
	color: darkgreen;
	}
#line{
	margin:100px;
	
	width: 1000px;
}
input{
	width: 300px;
	height: 50px;
	
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}
selection{
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

</style>

<script>
$(document).ready(function(){
$('#cancel').click(function(){
	var url = "${pageContext.request.contextPath}/login";
	$(location).attr('href',url);
});



});
</script>
</head>
<body>
<br><br><br><br>
<div id= "container">
<div id="title" align="center">
<h2>비밀번호 찾기</h2>
</div>
<div id="line" align="center" style="border: 2px solid darkgreen"></div>
<div id="findpwd_form" align="center">
<div class="form-group" align="center">
<label for="user_id">아이디</label>
<input type="text" id="user_id" name="user_id" placeholder="ID" required><br>
</div>
<div class="form-group" align="center">
<label for="hint">비밀번호 질문</label>
<div id="result"></div>
</div>
<div class="form-group" align="center">
<label for="answer">답변</label>
<input type="text" id="hint" name="hint" placeholder="answer" required><br>
</div>
<div id="searchbtn" align="center">
<button type="button" id="cancel" style="width: 200px; height: 50px; background-color:darkgreen; color: white" >취소</button>
<button type="button" id="pwsearchbtn" style="width: 200px; height: 50px; background-color:darkgreen; color: white" >확인</button>
</div>
</div>







</div>

</body>
</html>