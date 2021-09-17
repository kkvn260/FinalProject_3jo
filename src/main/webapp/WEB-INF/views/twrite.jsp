<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="twritedetail"> <!-- detail로 이동 -->
<ul>
	<li>
		<select id="category">
			<option>카테고리</option>
		</select>
	</li>
	<li>
		<input type="text" id="title" placeholder="제목을 입력해주세요.">
	</li>
	<li>
		<input type="text" id="price" placeholder="판매 희망 가격을 입력해주세요.">
	</li>
	<li>
		<textarea rows="30" cols="100"></textarea>
	</li>
</ul>
</form>
</body>
</html>