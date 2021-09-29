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
<style>
#preview img {
	width: 100px;
	height: 100px;
}

#preview p {
	text-overflow: ellipsis;
	overflow: hidden;
}

.preview-box {
	padding: 5px;
	border-radius: 2px;
	margin-bottom: 5px;
	margin-right: 5px;
	float: left;
}
.clear{
	clear: both;
}
#attach label{
	background-color: aqua;
}
.right{
	float: right;
}
.left{
	float: left;
}
.clear{
	clear: both;
}
</style>
<body>
<form method="post" action="twriteresult" enctype="multipart/form-data"> <!-- detail로 이동 -->
<ul>
	<li>
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
		<input type="text" id="title" name="title" placeholder="제목">
	</li>
	<li>
		<input type="text" id="sell_price" name="sell_price" placeholder="판매 희망 가격">
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
		<textarea rows="21" cols="85" name="content" id="content" class="left"></textarea>
		<div class="right">
		<label>장소 설정</label>
		<p id="map" style="width: 500px; height: 400px;"></p>
		</div>
	</li>
	<li>
		<div class="clear"></div>
		<input type="hidden" name="map_x" id="map_x" >
		<input type="hidden" name="map_y" id="map_y" >
		<label>경매기능 사용여부</label>
		<input type="checkbox" id="deal">
		<input type="text" id="deal_price" name="deal_price" hidden="" placeholder="경매 시작가격">
	</li>
	<li>
		<input type="submit" value="등록">
		<input type="button" value="취소">
	</li>
</ul>

</form>

<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
<script>
	  
	    //naver Map
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