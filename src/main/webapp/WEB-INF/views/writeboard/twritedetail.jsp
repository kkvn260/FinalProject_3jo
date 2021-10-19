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
<style>
li input{
	border:none;
	outline: none;
}
#hr{
	border: 1px solid green;
}
.under{
	border: 1px soild silver;
}
#replyarea input{
	border-bottom: 1px solid silver;
}
.btn1{
	background-color: white;
	border: none;
}
.btn1:hover{
	color: green;
	text-decoration: underline;
}
 #tdetail {
      align:center;
      margin:0 auto;
      width:1400px;
    }
ul li,label{
	font-family: 'Gaegu', cursive;
	font-size: 22px;
	font-weight: bold;
}
option,select {
	font-size: 22px;
	font-family: 'Gaegu', cursive;
}
input {
	font-family: 'Gaegu', cursive;
	font-size: 22px;
	border: 0;
}
input:focus, textarea:focus{
	outline: none;
}
textarea{
	border: none;
}
.replytext{
	border: 1px solid silver;
}
</style>
<script>
    function del() {
        if (!confirm("정말 삭제 하시겠습니까?")) {
            
        } else {
            alert("삭제하셨습니다.");
            location.href="${pageContext.request.contextPath }/twritedelete/${list.tradeno}";
        }
    }
</script>
<body>
<br><br><br><br><br><br>
<div id="tdetail">
<div class="modal">
	<div class="modal_content" title="클릭하면 닫기!.">
		<img class="modalimg" src="">
	</div>
</div>
<ul>
	<li>
		<div>
		<label>작성자</label>
		<span> : ${list.user_id }</span>
		</div>
		<div style="float: right;">
		<c:if test="${result ne null }">
		<img class="like_btn" alt="좋아요" src="${pageContext.request.contextPath }/resources/img/하트.png" width="30px" height="30px">
		</c:if>
		<c:if test="${result eq null }">
		<img class="like_btn" alt="좋아요" src="${pageContext.request.contextPath }/resources/img/빈하트.png" width="30px" height="30px">
		</c:if>
		<span class="likeno">좋아요 수 : ${list.likeno }</span>
		</div>
		<label>카테고리</label>
		<span>${list.category1} > </span>
		<span>${list.category2}</span>
		<hr id="hr">
	</li>
	<li>
		<input type="hidden" id="user_id" value="${list.user_id }" readonly>
		<label>제목</label>
		<input type="text" id="title" value="${list.title }" readonly>
		<hr id="hr">
	</li>
	<li>
		<label>판매 희망가격</label>
		<input type="text" id="sell_price" value="${list.sell_price }원" readonly>
		<hr id="hr">
	</li>
	<li>
		<c:if test="${list2!=null }">
		<label>첨부 사진</label><span style="font-size: 15px;"> (사진 클릭시 확대해서 볼 수 있습니다.)</span>
		<div class="preview">
			<c:forEach var="item" items="${list2 }">
				<div class="preview-box">
					<img class="moimg" src="${pageContext.request.contextPath }/resources/img/${item.real_name}" width="100px" height="100px">
				</div>
			</c:forEach>
		</div>
		</c:if>
	<div class="clear"></div>
	</li>
	<li>
		<label>내용</label><br><hr id="hr">
		<textarea rows="15" cols="65" class="left" readonly style="resize: none;">${list.content }</textarea>
		<div class="right">
		<label><img alt="지도" src="${pageContext.request.contextPath }/resources/img/지도아이콘.png" width="25px" height="25px"> 장소</label>
		<p id="map" style="width: 650px; height: 470px;"></p>
		</div>
	</li>
	<li>
	<div class="clear"></div><hr id="hr">
		<c:if test="${id == list.user_id }">
		<input type="button" class="btn1" id="modibtn" value="수정" onclick="location.href='${pageContext.request.contextPath }/twritemodify/${list.tradeno}'">
		<input type="button" class="btn1" id="delbtn" value="삭제" onclick="del()">
		</c:if>
		<input type="button" class="btn1" id="slist" value="목록" onclick="location.href='${pageContext.request.contextPath }/selllist'">
	</li>
	<li>
	<div>
	 <form class="priceSearch" id="priceSearch">
		<select id="searchKeyword">
		  <option value="item_name">제품명</option>
		  <option value="product_no">제품모델명</option>
		</select>
		<input type="text" id="itemProd" placeholder="검색어를 입력하세요" name="searchtxt">
		<button type="button" id="btn_search" class="btn1" style="border:0;">시세조회</button>
	</form>
	</div>
	<br><br><br><br>
    </li>


	<div>
		<canvas id="myChart"></canvas>
	</div>
	
	<div class="priceChart">
		
	</div>



	<c:if test="${not empty list3}">
	<li>
		<label>댓글</label>
		<hr id="hr">
		<div id="replyarea">
		<c:forEach var="item" items="${list3 }">
			<li value="${item.replyno }">
				<div class="replychild_btn" style="margin-left:${10*item.dept}px; display: flex; justify-content: space-between; margin-bottom:5px">
				<div>
				<c:if test="${item.dept==1 }">
					<img  src="${pageContext.request.contextPath }/resources/img/화살표.jfif" width="40px" height="25px" style="margin-left:${20*item.dept}px;"> 
				</c:if>
				<span>${item.user_id }</span>&ensp;
				</div>
				<span style="flex-grow: 1;"> >> ${item.reply_content }</span>
				<input type="text" name="reply_writedate" value="${item.reply_writedate }" readonly style="flex-grow: 0;">
					<c:if test="${id eq item.user_id && item.dept==0}">
						<a href="${pageContext.request.contextPath }/treplydelete/${item.replyno}/${list.tradeno}" 
							style="color: red; font-size: 13px; margin-top: 7px;">삭제</a>
					</c:if>
					<c:if test="${id eq item.user_id && item.dept==1}">
						<a href="${pageContext.request.contextPath }/treplydelete2/${item.replyno}/${list.tradeno}" 
							style="color: red; font-size: 13px; margin-top: 7px;">삭제</a>
					</c:if>
				</div>
				<input type="hidden" value="${item.replyno }" name="replyno" class="replyno">
				<input type="hidden" value="${item.dept }" name="dept" class="dept">
				<input type="hidden" value="${item.reorder }" name="reorder" class="reorder">
				<input type="hidden" value="${item.reparent }" name="reparent" class="reparent">
			</li>
		</c:forEach>
		</div>
	</li>
	</c:if>
	<li>
	<c:if test="${id ne null}">
		<div><br>	
			<div id="replydiv">
			<hr id="hr">
				<label>댓글 쓰기</label>
				<form action="${pageContext.request.contextPath }/treplyresult" method="post">
				<input type="hidden" id="tradeno" name="tradeno" value="${list.tradeno }">
				<textarea class="replytext" rows="4" cols="90" id="reply_content" name="reply_content" placeholder="댓글을 입력하세요."
						 required style="resize: none;"></textarea>
				<input type="submit" value="등록" style="margin-bottom:5px;" class="btn1">
				</form><br><br><br><br>
			</div>
		</div>
	</c:if>
	</li>
</ul>
		</div>
<script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
<script>
//좋아요
$(function () {
	$(".like_btn").on("click",function(){
		let id=$("#user_id").val();
		let tradeno=${list.tradeno}
		let data1={user_id:id,tradeno:tradeno};
		if(id == null){
			alert("로그인이 필요합니다.");
		}else{
			$.ajax({
				type:"post"
				,url:"${pageContext.request.contextPath}/tlike"
				,dataType:'json'
				,data: JSON.stringify(data1)
				,contentType:"application/json;charset=utf-8"
				,success:function(data){
					if(data[0]==0){
						alert("이 글을 좋아요 하였습니다.");
						$(".like_btn").attr("src","${pageContext.request.contextPath}/resources/img/하트.png");
						$(".likeno").text("좋아요 수 : "+data[1]);
					}else{
						alert("좋아요를 취소하였습니다.");	
						$(".like_btn").attr("src","${pageContext.request.contextPath}/resources/img/빈하트.png");
						$(".likeno").text("좋아요 수 : "+data[1]);
					}
				},error:function(err){
					console.log("에러");
				}
			}) 
		}
	})
})
//대댓글
$(function () {
	$(".replychild_btn").on("click",function(){
		
		let $this=$(this);
		let no=$this.parent().val();
		let data1={tradeno:$("#tradeno").val()
					,replyno:no
					};
		let id="${id}";
		console.log(no);
 	$.ajax({
			type:'post'
			,url:"${pageContext.request.contextPath }/treplychild"
			,dataType:'json'
			,data: JSON.stringify(data1)
			,contentType:"application/json;charset=utf-8"
			,success:function(data)
			{
				console.log("성공");
				let p="";
				p+="<form method='post' class='replyform' action='${pageContext.request.contextPath }/treplychildinsert'>";
	 			p+="<input type='hidden' name='user_id' value='"+id+"'>";
				p+="<input type='hidden' name='tradeno' value='"+${list.tradeno }+"'>";
				p+="<textarea class='replytext' rows='4' cols='90' name='reply_content' placeholder='대댓글을 입력하세요.' style='margin-left:25px; resize: none;'></textarea>";
				p+="<input type='hidden' name='reorder' value='"+data.reorder+"'>";
				p+="<input type='hidden' name='reparent' value='"+no+"'>";
				p+="<input type='submit' class='btn1' value='댓글달기'>";
				p+="</form>";
				
				$('.replyform').remove();
				$this.parent().append(p);
			},error:function(err){
				console.log("에러");
			}
		})  
	})
})

 

</script>
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


<script>
//가격비교 
	$(function(){
		const chartLabels = [];
		const chartData = [];
		const itemName="";

		const cooContractNo = '<c:out value="${no}"/>';

		function createChart(){

			let ctx = document.getElementById('myChart').getContext('2d'); 
			LineChartDemo = Chart.Line(ctx, {
				data : lineChartData,
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero: true
							}
						}]
					}
				}
			});  
		}
	

	$('#btn_search').click(function(){
		let category = $('#searchKeyword option:selected').val();
		let itemProd= $('#itemProd').val();
		console.log(category);
		console.log(itemProd);
	
	$.ajax({
		method:'post'
		,url:"${pageContext.request.contextPath }/getPriceData"
		,dataType: 'text'
		,data:{'category': category, 'itemProd':itemProd}
		,success:function(data){
			console.log("test.............");
            console.log(data,'hello');

			// var ctx = document.getElementById('myChart').getContext('2d'); 
			// var chart = new Chart(ctx, { 
			// // 챠트 종류
			// type: 'line', 
		
			// // 챠트 데이터
			// data: { 
			// 	labels: ['월평균가격', '주평균가격', '현재가격' ], 
			// 	datasets: [{ 
			// 		label: 'My First dataset', 
			// 		backgroundColor: 'transparent', 
			// 		borderColor: 'red', 
			// 		data: Object.values(data)
			// 	}] 
			// }, 
			// // 옵션 
			// options: {} 
			// });
		}
		,error:function(err)
		{
			console.log(err);
		}
	})
      




		// chartLabels = [];
		// chartData = [];

		// $.getJSON("./getPriceData",{
		// 	  cooContractNo : cooContractNo,
		// 	  itemName : itemName
		// }),
		// function(data){
		// 	$.each(data,function(key, value){
		// 		//DTO에서 데이터 넣기
		// 		chartLabels.push(value.stateDate);
		// 		chartData.push(value.stataAmount);
		// 	});

		// 	lineChartData = {
		// 		labels: ['월평균가격', '주평균가격', '현재가격' ],
		// 		backgroundColor: 'transparent', 
		// 		borderColor: 'red', 
		// 		data : chartData

		// 	}

		// 	createChart();
		// }


	});



});
</script>

</body>
</html>