<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=vjjh2gafg5"></script>
<body>
<form method="post" action="twritedetail"> <!-- detail로 이동 -->
<ul>
	<li>
		<input type="text" id="detailcategory" value="카테고리받아오기" readonly>
	</li>
	<li>
		<input type="text" id="title" value="" readonly>
	</li>
	<li>
		<input type="text" id="sell_price" value="" readonly>
	</li>
	<li>
		<textarea rows="30" cols="100" readonly></textarea>
		<p id="map" style="width: 500px; height: 400px;"></p>
	</li>
	<li>
		<input type="button" id="modibtn" value="수정">
		<input type="button" id="delbtn" value="삭제">
		<input type="text" name="x" id="x" hidden="">
		<input type="text" name="y" id="y" hidden="">
	</li>
</ul>
		
</form>
	<script>
var mapOptions = {
		center : new naver.maps.LatLng(${x},${y}),
		zoom : 18
	};
var map = new naver.maps.Map('map', mapOptions);

var markerList = [];
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${x}, ${y}),
    map: map
});
</script>
</body>
</html>