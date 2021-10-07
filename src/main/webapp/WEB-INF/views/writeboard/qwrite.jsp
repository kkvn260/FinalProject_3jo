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

<body>
<br><br><br><br>
<form method="post" action="qwriteresult" enctype="multipart/form-data"> <!-- detail로 이동 -->
<ul>
	<li>
		<label for="category">카테고리</label>
		<select name="category">
			<option >카테고리를 설정해주세요</option>
			<option value="의류" >의류</option> <!--남성/여성  -->
			<option value="디지털/가전" >디지털/가전</option> <!--모바일,카메라,PC/노트북,가전  -->
			<option value="생활/식품" >생활/식품</option> <!--생활용품  , 주방용품 , 식품  -->
			<option value="취미" >취미</option> <!-- 스포츠 , 수집품 , 게임 , 반려동물  -->
			<option value="도서/음반" >도서/음반</option> <!-- 국내도서 , 해외도서 , CD/DVD/LP  -->
			<option value="기타" >기타(잡화)</option>
		</select>
	</li>
	<li>
		<input type="hidden" id="user_id" name="user_id" value="${id }">
		<label>제목</label>
		<input type="text" id="title" name="title" placeholder="제목">
	</li>
		<li>
			<div class="filebody">
				<div id="attach">
					<label class="upload" for="filedata">사진첨부</label>
					<input id="filedata" type="file" name="filedata" style="display: none" multiple accept="image/*"/>
				</div>
				
				<label>미리보기</label>
				<div id="preview" class="filecontent"></div>
				<div class="clear"></div>
			</div>
		</li>
	<li>
		<textarea rows="20" cols="100" name="content" id="content"></textarea>
	</li>
	<li>
		<input type="submit" value="등록">
		<input type="button" value="취소">
	</li>
</ul>

</form>

<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
</body>
</html>