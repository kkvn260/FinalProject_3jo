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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/writeboard.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=vjjh2gafg5"></script>
<body>
<form method="post" action="twriteresult"> <!-- detail로 이동 -->
<ul>
	<li>
		<select name="category">
			<option value="category1" >카테고리1</option>
			<option value="category2" >카테고리2</option>
		</select>
	</li>
	<li>
		<input type="text" id="title" name="title" placeholder="제목">
	</li>
	<li>
		<input type="text" id="sell_price" name="sell_price" placeholder="판매 희망 가격">
	</li>
	<li>
		<textarea rows="30" cols="100" name="content" id="content"></textarea>
		<p id="map" style="width: 500px; height: 400px;"></p>
	</li>
	<li>
		<label>경매기능 사용여부</label>
		<input type="checkbox" id="deal">
		<input type="text" id="deal_price" name="deal_price" placeholder="경매 시작 가격" hidden="">
	</li>
	<li>
		<input type="submit" value="등록">
		<input type="reset" value="초기화">
		<input type="text" name="map_x" id="x" hidden="">
		<input type="text" name="map_y" id="y" hidden="">
	</li>
</ul>
</form>

<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
<script>
		var mapOptions = {
			center : new naver.maps.LatLng(37.5088702, 126.8395384),
			zoom : 15
		};

		var map = new naver.maps.Map('map', mapOptions);
		var markerList = [];
	    var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
		
	    map.getPanes().floatPane.appendChild(menuLayer[0]);
		
	    naver.maps.Event.addListener(map, 'click', function(e) {
	    for (var i=0, ii=markerList.length; i<ii; i++) {
            markerList[i].setMap(null);
        }
	        markerList = [];
	        var marker = new naver.maps.Marker({
	            position: e.coord,
	            map: map
	        });
	        
	        markerList.push(marker);
	        console.log(e.coord.lat()); // 좌표
	        console.log(e.coord.lng());
	        document.getElementById("x").value = e.coord.lat();
	        document.getElementById("y").value = e.coord.lng();
	        
	    });

	    naver.maps.Event.addListener(map, 'keydown', function(e) {
	        var keyboardEvent = e.keyboardEvent,
	            keyCode = keyboardEvent.keyCode || keyboardEvent.which;

	        var ESC = 27;

	        if (keyCode === ESC) { //마커 초기화
	            keyboardEvent.preventDefault();

	            for (var i=0, ii=markerList.length; i<ii; i++) {
	                markerList[i].setMap(null);
	            }

	            markerList = [];

	            menuLayer.hide();
	        }
	    });

	    naver.maps.Event.addListener(map, 'mousedown', function(e) {
	        menuLayer.hide();
	    });

	    naver.maps.Event.addListener(map, 'rightclick', function(e) {
	        var coordHtml =
	            'Coord: '+ '(우 클릭 지점 위/경도 좌표)' + '<br />' +
	            'Point: ' + e.point + '<br />' +
	            'Offset: ' + e.offset;

	        menuLayer.show().css({
	            left: e.offset.x,
	            top: e.offset.y
	        }).html(coordHtml);

	        console.log('Coord: ' + e.coord.toString());
	    });
	</script>
</body>
</html>