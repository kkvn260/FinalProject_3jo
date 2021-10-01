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
<ul>
	<li>
		<label>카테고리</label>
		<input type="text" id="category1" value="${list.category1 }" readonly>
		<input type="text" id="category2" value="${list.category2 }" readonly>
	</li>
	<li>
		<label>제목</label>
		<input type="text" id="title" value="${list.title }" readonly>
	</li>
	<li>
		<label>판매 희망가격</label>
		<input type="text" id="sell_price" value="${list.sell_price }" readonly>
	</li>
	<li>
		<c:if test="${list2!=null }">
		<label>첨부 사진</label>
		<div class="preview">
			<c:forEach var="item" items="${list2 }">
				<div class="preview-box">
					<img src="${pageContext.request.contextPath }/resources/img/${item.real_name}" width="100px" height="100px">
				</div>
			</c:forEach>
		</div>
		</c:if>
	<div class="clear"></div>
	</li>
	<li>
		<textarea rows="19" cols="68" class="left" readonly>${list.content }</textarea>
		<div class="right">
		<label>장소</label>
		<p id="map" style="width: 500px; height: 400px;"></p>
		</div>
	</li>
	<li>
	<div class="clear"></div>
		<input type="button" id="modibtn" value="수정" onclick="location.href='${pageContext.request.contextPath }/twritemodify/${list.tradeno}'">
		<input type="button" id="delbtn" value="삭제" onclick="location.href='${pageContext.request.contextPath }/twritedelete/${list.tradeno}'">
		<input type="button" id="slist" value="목록" onclick="location.href='${pageContext.request.contextPath }/selllist'">
	</li>
</ul>	
	<script>
var mapOptions = {
		center : new naver.maps.LatLng(${list.map_x},${list.map_y}),
		zoom : 18
	};
var map = new naver.maps.Map('map', mapOptions);

var markerList = [];
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${list.map_x}, ${list.map_y}),
    map: map
});
</script>
</body>
</html>