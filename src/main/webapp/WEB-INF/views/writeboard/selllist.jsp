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
   h2{color:blue;}
   h2 a{color:black;}
   h2 a:link{text-decoration:none;}
</style>
</head>
<body>
<br><br><br><br><br><br>
<div>
<h2> 판매글 게시판<a href="${pageContext.request.contextPath }/deallist"> / 경매글 게시판</a></h2><hr>
</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>날짜</th>
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
						<td><c:out value="${item.writedate }" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>


	  <form method="get" action="selllist">
		<select name="search">
		  <option value="total">전체</option>
		  <option value="user_id">회원ID</option>
		  <option value="title">제목</option>
		  <option value="content">내용</option>
		</select>
		<input type="text"  name="searchtxt">
		<input type="submit" value="검색">
	  </form>

	  <span>
		&emsp;&emsp;&emsp;&emsp;
		<h4 style="display: inline">인기</h4>
			<c:forEach items="${topSearch}" var="index">
				<a href="selllist?search=total&searchtxt=${index}"><c:out value="${index}"/> &nbsp;</a>
			</c:forEach>
	</span>
 
  <a href="write" class="btn btn-success pull-right">글쓰기</a><br><br>
	



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
 	</c:if>

</body>
</html>