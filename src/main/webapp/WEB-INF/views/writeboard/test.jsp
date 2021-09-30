<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function () {
	$('.deal_btn').on('click',function() {
		var price=20;
		$.ajax({
			type:'post',
			url:"test1",
			data:price;
			success:function(data){
				document.getElementById("ndeal_price").value=data;
			},error:function(){
				alert("입찰 실패");
			}
		})
	})
})
</script>
</head>
<body>
<br><br><br><br>

		<label>현재 입찰가격</label>
		<input type="text" id="ndeal_price" value="10" readonly>
		<label>입찰 희망가격</label>
		<input type="text" id="deal_price" name="deal_price" >
		<button id="deal_btn" >입찰하기</button>
</body>
</html>