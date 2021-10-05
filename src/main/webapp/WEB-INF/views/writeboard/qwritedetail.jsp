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
<br><br><br><br><br><br><br><br>
<ul>
	<li>
		<label>카테고리</label>
		<input type="text" id="detailcategory" value="${list.category }" readonly>
	</li>
	<li>
		<label>제목</label>
		<input type="text" id="title" value="${list.title }" readonly>
	</li>
	<li>
		<c:if test="${list2!=null  }">
		<div class="preview">
		<label>첨부 사진</label>
			<c:forEach var="item" items="${list2 }">
				<div class="preview-box">
					<img src="${pageContext.request.contextPath }/resources/img/${item.real_name}" width="100px" height="100px">
					<p>${item.real_name}</p>
				</div>
			</c:forEach>
		</div>
		</c:if>
	<div class="clear"></div>
	</li>
	<li>
		<textarea rows="30" cols="100"  readonly>${list.content }</textarea>
	</li>
	<li>
	<div class="clear"></div>
		<input type="button" id="modibtn" value="수정" onclick="location.href='${pageContext.request.contextPath }/qwritemodify/${list.qnano}'">
		<input type="button" id="delbtn" value="삭제" onclick="location.href='${pageContext.request.contextPath }/qwritedelete/${list.qnano}'">
		<input type="button" id="qlist" value="목록" onclick="location.href='${pageContext.request.contextPath }/qnalist'">
	</li>
		<li>
		<label>답변</label>
		<div id="replyarea">
		<c:forEach var="item" items="${list3 }">
			<li value="${item.replyno }">
				<input type="text" name="user_id" value="${item.user_id }" readonly>
				<input type="text" class="replychild_btn" name="reply_content" value="${item.reply_content }" readonly>
				<input type="text" name="reply_writedate" value="${item.reply_writedate }" readonly>
				<input type="hidden" value="${item.replyno }" name="replyno" class="replyno">
				<input type="hidden" value="${item.dept }" name="dept" class="dept">
				<input type="hidden" value="${item.reorder }" name="reorder" class="reorder">
				<input type="hidden" value="${item.reparent }" name="reparent" class="reparent">
			</li>
		</c:forEach>
		</div>
	</li>
	<li>
	<c:if test="${id ne null}">
		<div><br>	
			<div id="replydiv">
				<form action="${pageContext.request.contextPath }/qreplyresult" method="post">
				<input type="hidden" id="qnano" name="qnano" value="${list.qnano }">
				<input type="text" id="user_id" name="user_id" value="${id }" readonly>
				<textarea rows="4" cols="90" id="reply_content" name="reply_content" placeholder="댓글을 입력하세요."></textarea>
				<input type="submit" value="등록">
				</form>
			</div>
		</div>
	</c:if>
	</li>
</ul>	
<script>
//대댓글
$(function () {
	$(".replychild_btn").on("click",function(){
		
		let $this=$(this);
		let no=$this.parent().val();
		let data1={qnano:$("#qnano").val()
					,replyno:no
					};
		let id="${id}";
		console.log(no);
 	$.ajax({
			type:'post'
			,url:"${pageContext.request.contextPath }/qreplychild"
			,dataType:'json'
			,data: JSON.stringify(data1)
			,contentType:"application/json;charset=utf-8"
			,success:function(data)
			{
				console.log("성공");
				let p="";
				p+="<form method='post' class='replyform' action='${pageContext.request.contextPath }/qreplychildinsert'>";
	 			p+="<input type='hidden' name='user_id' value='"+id+"'>";
				p+="<input type='hidden' name='qnano' value='"+${list.qnano }+"'>";
				p+="<textarea rows='4' cols='90' name='reply_content' placeholder='댓글을 입력하세요.'></textarea>";
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
</body>
</html>