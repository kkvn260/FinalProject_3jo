<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
 
   #h2{color:black;
       font-family: 'Gowun Dodum', sans-serif;
   }
   h2 a{color:grey;}
   h2 a:link{text-decoration:none;}
   h2 a:hover, td a:hover{color:green;}
   #selllist{
      align:center;
      margin:0 auto;
      width:1400px;
	  font-family: 'Gowun Dodum', sans-serif;
	  font-size: 18px;
  }
  
</style>
</head>
<body>
<br><br><br><br><br><br>
<div id="selllist">
<div>
<h2 id="h2"><span style="background:url(${pageContext.request.contextPath}/resources/img/수채화이미지.png) no-repeat; opacity:0.7; z-index:-1;"> 판매글 게시판</span>
            <a href="${pageContext.request.contextPath }/deallist">&nbsp;경매글 게시판</a></h2><hr>
</div>
	<table class="table table-hover">
		<thead style="background-color:#CCFFCC;">
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list!=null }">
				<c:forEach var="item" items="${list }">
					<c:set var="number" value="${number+1 }" />
					<tr>
						<td><c:out value="${number }" /></td>
						<td><c:out value="${item.user_id }" /></td>
						<td><a href="twritedetail/${item.tradeno }"><c:out
									value="${item.title }" /></a></td>
					    <td><c:out value="${item.viewno }"/></td>
						<td><c:out value="${item.writedate }" /></td>
						<td><c:out value="${item.addr1 }/${item.addr2 }" /></td>
					</tr>
				</c:forEach>
				<img width="60" height="80" style="margin-top: 20px" src="${pageContext.request.contextPath}/resources/img/52.png"/>
			</c:if>
		</tbody>    
	</table>
	 <c:if test="${id!=null }">
        <a href="write" style="float:right;"><img width="110" height="40" src="${pageContext.request.contextPath}/resources/img/글쓰기.png"></a><br>
      </c:if><br>
<div style="text-align:center;">
	<c:if test="${page.prev}">
  		<a href="selllist?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}">
   		 <c:out value="이전"/>
  		</a> 
 	</c:if>
 
 	<c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock }">
   		 <c:if test="${index==page.currPage}">
       	   	<c:out value="${index }"/>
    	 </c:if>
   		 <c:if test="${index!=page.currPage }">
     		 <a href="selllist?currPage=${index }&search=${search}&searchtxt=${searchtxt}">
     		 	<c:out value="${index }"/>
     		 </a> 
    	 </c:if>
    </c:forEach>
 
	<c:if test="${page.next}">
	  <a href="selllist?currPage=${page.endBlock+1}&search=${search}&searchtxt=${searchtxt}">
   		<c:out value="다음"></c:out>
  	  </a>
 	</c:if><br><br><br><br>

	  <form method="get" action="selllist">
		<select name="search">
		  <option value="total">전체</option>
		  <option value="user_id">회원ID</option>
		  <option value="title">제목</option>
		  <option value="content">내용</option>
		  <option value="addr">지역</option>
		</select>
		<input type="text"  name="searchtxt">
		<input type="submit" value="검색">
	  </form>

	  <span>
		<h4 style="display: inline;  font-family: 'Gowun Dodum', sans-serif; margin-right:170px;">인기</h4>
			<c:forEach items="${topSearch}" var="index">
				<a href="selllist?search=cat&searchtxt=${index}"><c:out value="${index}"/> &nbsp;</a>
			</c:forEach>
	</span><br><br>
</div>
 	</div>
</body>
</html>