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
<form method="post" action="${pageContext.request.contextPath }/dwritemodifyresult" enctype="multipart/form-data">
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
		<input type="hidden" name="chatno" id="chatno" value="${list.chatno }">
		<label>제목</label>
		<input type="text" id="title" name="title" value="${list.title }">
	</li>
	<li>
		<li>
			<div class="filebody">
				<c:if test="${list2!=null }">
			<label>수정 전 첨부사진</label>
			<div>
				<div class="preview">
					<c:forEach var="item" items="${list2 }">
						<div class="preview-box">
							<img src="${pageContext.request.contextPath }/resources/img/${item.real_name}" width="100px" height="100px">
							<p>${item.real_name}</p>
						</div>
					</c:forEach>
				</div>
			</div>
				</c:if>
				<div class="clear"></div>
				<div id="attach">
					<label class="upload" for="filedata">사진첨부</label>
					<input id="filedata" type="file" name="filedata" style="display: none" multiple accept="image/*"/>
				</div>
				<label>미리보기</label>
				<div id="preview" class="filecontent"></div>

			</div>
			<div class="clear"></div>
		</li>
	<li>
		<textarea rows="19" cols="68" class="left" name="content">${list.content }</textarea>
		<div class="right">
		<label>장소 설정</label>
		<p id="map" style="width: 500px; height: 400px;"></p>
		</div>
	</li>
	<li>
		<div class="clear"></div>
		<input type="hidden" name="map_x" id="map_x" value="${list.map_x }">
		<input type="hidden" name="map_y" id="map_y" value="${list.map_y }">
	</li>
	<li>
		<input type="submit" value="등록">
		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath }/dwritedetail/${list.chatno}'">
	</li>
</ul>	

</form>

<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
<script>
	  
	    //naver Map
		var mapOptions = {
			center : new naver.maps.LatLng(${list.map_x}, ${list.map_y}),
			zoom : 18
		};
		
		var map = new naver.maps.Map('map', mapOptions);
		var markerList = [];
        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(${list.map_x}, ${list.map_y}),
            map: map
        });
        
        markerList.push(marker);
		
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

	  	
	</script>
</body>
</html>