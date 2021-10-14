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
<form method="post" action="dwriteresult" enctype="multipart/form-data"> <!-- detail로 이동 -->
<ul>
	<li>
		<label for="category">카테고리</label>
		<select name="category1" id="category1"></select>
		<select name="category2" id="category2"></select>
	</li>
	<li>
		<input type="hidden" id="user_id" name="user_id" value="${id }">
		<label>제목</label>
		<input type="text" id="title" name="title" placeholder="제목">
	</li>
		<li>
			<div class="filebody">
				<div id="attach">
					<label class="upload" for="filedata">사진첨부</label><span style="font-size: 15px;"> << 클릭</span>
					<input id="filedata" type="file" name="filedata" style="display: none" multiple accept="image/*"/>
				</div>
				
				<label>미리보기</label>
				<div id="preview" class="filecontent"></div>
				<div class="clear"></div>
			</div>
		</li>
	<li>
		<textarea rows="14" cols="68" name="content" id="content" class="left" style="resize: none;" required></textarea>
		<div class="right">
		<label><img alt="지도" src="${pageContext.request.contextPath }/resources/img/지도아이콘.png" width="25px" height="25px">장소 설정</label>
		<p id="map" style="width: 500px; height: 400px;"></p>
		</div>
	</li>
	<li>
		<div class="clear"></div>
		<input type="hidden" name="map_x" id="map_x" >
		<input type="hidden" name="map_y" id="map_y" >
	</li>
	<li>
		<input type="submit" value="등록">
		<input type="button" value="취소">
	</li>
</ul><br><br><br><br>

</form>

<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
<script>
	  
	    //naver Map
		var mapOptions = {
				center : new naver.maps.LatLng(37.5273873, 126.9789274),
				zoom : 10
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
 	        document.getElementById("map_x").value = e.coord.lat();
	        document.getElementById("map_y").value = e.coord.lng(); 
	        
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

	  	
	</script>
</body>
</html>