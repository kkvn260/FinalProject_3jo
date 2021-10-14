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
#deal_price{
	border-bottom: 1px solid silver;
}
#hr{
	border: 1px solid green;
}
#replyarea input{
	border-bottom: 1px solid silver;
}
.btn1{
	background-color: white;
}
.btn1:hover{
	color: green;
	text-decoration: underline;
}
</style>
<script>
//경매 시간
function remaindTime() {
    var date = '${list.writedate}';
    var day=date.substr(0,10);
    var hour=date.substr(11,2);
    var min=date.substr(14,2);
    var sec=date.substr(17,2);
    var day2=new Date(day);
    var now=new Date();
    var start = new Date(day2.getFullYear(),day2.getMonth(),day2.getDate(),hour,min,sec);
    var end = new Date(day2.getFullYear(),day2.getMonth(),day2.getDate()+2,hour,min,sec);
    
    var nt = now.getTime();
    var st = start.getTime(); 
    var et = end.getTime(); 
   if(nt>et){ 
    $(".lefttime").text("입찰 마감");
    $(".time").fadeOut();
    $("#deal_btn").hide();
   }else{
     $(".time").fadeIn();
     $(".lefttime").text("입찰 마감까지");
     sec =parseInt(et - nt) / 1000;
     day  = parseInt(sec/60/60/24);
     sec = (sec - (day * 60 * 60 * 24));
     hour = parseInt(sec/60/60);
     sec = (sec - (hour*60*60));
     min = parseInt(sec/60);
     sec = parseInt(sec-(min*60));
     if(hour<10){hour="0"+hour;}
     if(min<10){min="0"+min;}
     if(sec<10){sec="0"+sec;}
     
      $(".day").text(day+"일");
      $(".hour").text(hour+"시간");
      $(".min").text(min+"분");
      $(".sec").text(sec+"초");
   }
 }
setInterval(remaindTime,100);
//경매 기능
$(function () {
	$('#deal_btn').on('click',function(){
		var b=$("#ndeal_price").text();
		var b2=b.split(",");
		var br="";
		var i;
		for(i=0; i<b2.length; i++){
			br+=b2[i];
		}
		var before=Number(br);
		
		var a=$("#deal_price").val();
		var a2=a.split(",");
		var ar="";
		var j;
		for(j=0; j<a2.length; j++){
			ar+=a2[j];
		}
		var after=Number(ar);
		   let data1={tradeno:$("#tradeno").val(),deal_price:a,user_id:$("#user_id").val()};
		if($("#user_id").val()==null){
			alert("로그인이 필요합니다.");
		}else if(after<=before){
			alert("입찰 가격은 현재 입찰가 보다 높아야 합니다.");
		}
		else{
		 $.ajax({
			type:"post"
			,url:'${pageContext.request.contextPath }/deal/'+before+"/"+after
			,data: JSON.stringify(data1)
		    ,dataType:"text"
			,contentType:"application/json"
			,success:function(data)
			{	
				alert("입찰 성공!");
				$('#ndeal_price').text(data);
				$('#deal_price').val(""); //초기화
			},error:function(err){
				console.log(err);
			} 
		})
		}
	})
})
</script>
<body>
<br><br><br><br>
<div class="modal">
	<div class="modal_content" title="클릭하면 닫기!.">
		<img class="modalimg" src="">
	</div>
</div>
<h3 class="lefttime" style="text-align: center;"></h3>
<div class="time" style="text-align: center;">
<span class="day"></span>
<span class="hour"></span>
<span class="min"></span>
<span class="sec"></span>
</div>
<br>
<ul>
	<li>
		<label>카테고리</label>
		<span>${list.category1} > </span>
		<span>${list.category2}</span>
	</li>
	<li>
		<input type="hidden" name="user_id" value="${id }">
		<input type="hidden" name="tradeno" id="tradeno" value="${list.tradeno }">
		<label>제목</label>
		<input type="text" id="title" value="${list.title }" readonly>
		<div style="float: right;">
		<label>작성자</label>
		<span> : ${list.user_id }</span>
		</div>
	</li>
	<li>
		<label>현재 입찰가격</label>
		<span id="ndeal_price">${price }</span><span>원</span>&ensp;
		<label >입찰 희망가격</label>
		<input type="text" id="deal_price" class="deal_price" name="deal_price" onkeyup="numberWithCommas2(this.value)">원
		<button id="deal_btn" >입찰하기</button>
		<div style="float: right;">
		<c:if test="${result ne null }">
		<img class="like_btn" alt="좋아요" src="${pageContext.request.contextPath }/resources/img/하트.png" width="30px" height="30px">
		</c:if>
		<c:if test="${result eq null }">
		<img class="like_btn" alt="좋아요" src="${pageContext.request.contextPath }/resources/img/빈하트.png" width="30px" height="30px">
		</c:if>
		<span class="likeno">좋아요 수 : ${list.likeno }</span>
		</div>
	</li>
	<li>
		<label>첨부 사진</label>
		<c:if test="${list2!=null }">
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
		<textarea rows="14" cols="68" class="left" readonly style="resize: none;">${list.content }</textarea>
		<div class="right">
		<label><img alt="지도" src="${pageContext.request.contextPath }/resources/img/지도아이콘.png" width="25px" height="25px">장소</label>
		<p id="map" style="width: 500px; height: 400px;"></p>
		</div>
	</li>
	<li>
	<div class="clear"></div>
		<c:if test="${id == list.user_id }">
		<input type="button" class="btn1" id="modibtn" value="수정" onclick="location.href='${pageContext.request.contextPath }/twritemodify/${list.tradeno}'">
		<input type="button" class="btn1" id="delbtn" value="삭제" onclick="location.href='${pageContext.request.contextPath }/twritedelete/${list.tradeno}'">
		</c:if>
		<input type="button" class="btn1" id="dlist" value="목록" onclick="location.href='${pageContext.request.contextPath }/deallist'">
		<br><br><br><br>
	</li>
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
				<input type="text" name="reply_writedate" value="${item.reply_writedate }" readonly>
					<c:if test="${id eq item.user_id && item.dept==0}">
						<a href="${pageContext.request.contextPath }/treplydelete/${item.replyno}/${list.tradeno}" style="color: red; font-size: 13px; margin-top: 7px;">삭제</a>
					</c:if>
					<c:if test="${id eq item.user_id && item.dept==1}">
						<a href="${pageContext.request.contextPath }/treplydelete2/${item.replyno}/${list.tradeno}" style="color: red; font-size: 13px; margin-top: 7px;">삭제</a>
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
	<hr id="hr"><br><br><br><br>
	</c:if>
	<li>
	<c:if test="${id ne null}">
		<div><br>	
			<div id="replydiv">
				<label>댓글 쓰기</label>
				<form action="${pageContext.request.contextPath }/tdreplyresult" method="post">
				<input type="hidden" id="tradeno" name="tradeno" value="${list.tradeno }">
				<input type="text" id="user_id" name="user_id" value="${id }" readonly><br> 
				<textarea rows="4" cols="90" id="reply_content" name="reply_content" placeholder="댓글을 입력하세요." required style="resize: none;"></textarea>
				<input type="submit" value="등록">
				</form><br><br><br><br>
			</div>
		</div>
	</c:if>
	</li>
</ul>	
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
				p+="<textarea rows='4' cols='90' name='reply_content' placeholder='댓글을 입력하세요.' style='margin-left:25px; resize: none;'></textarea>";
				p+="<input type='hidden' name='reorder' value='"+data.reorder+"'>";
				p+="<input type='hidden' name='reparent' value='"+no+"'>";
				p+="<input type='submit' value='댓글달기'>";
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
</body>
</html>