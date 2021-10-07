<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mainstyles.css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>

@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');

   h3{
     color:green;
     text-shadow:1px 1px 1px pink;
     font-family: 'Sunflower', sans-serif;
   }
</style>
<body>
<br><br><br><br>
<div class="main">
		<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
           <img src="${pageContext.request.contextPath }/resources/img/test.jpg" width="1200" height="400"/>
           <div class="w3-display-middle w3-margin-top w3-center">
             <h1><a href="${pageContext.request.contextPath }/mainpage">오이마켓</a></h1>
             <h4>오늘도 이웃과 거래하는 <span id="oe">오이마켓</span></h4>
           </div>
       </header>
</div>
<section id="content" class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
            	<h3 style="margin: 10px 0px;">판매 인기글 TOP10 미리보기</h3>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="padding-top: 10px;">
                <c:forEach var="item" items="${list }">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/${item.real_name}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${item.title }</h5>
                                    <!-- Product price-->
                                    ${item.sell_price }원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                    </div>
                </div>
 <div id="topview" style="float:left; margin-left:30px;"><br>
		<div>
		   <table class="table table-striped">
			  <thead>
			    <tr><th>번호</th><th>제목</th><th>좋아요</th><th>조회수</th><th>작성자</th><th>작성일</th></tr>
			  </thead>
			  <tbody>
			      <c:forEach var="item" items="${list}">
			        <c:set var="number" value="${number+1 }" />
						<tr><td>&nbsp;<c:out value="${number }" /></td>
							<c:if test="${empty item.deal_price}">
						    <td><a href="twritedetail/${item.tradeno }"><c:out value="${item.title }"></c:out></a>
							</c:if>
							<c:if test="${empty item.sell_price }">
							<td><a href="tdealdetail/${item.tradeno }"><c:out value="${item.title }"></c:out></a>
							</c:if>
							<td><c:out value="${item.likeno }"></c:out></td>
							<td><c:out value="${item.viewno }"></c:out></td>
							<td><c:out value="${item.user_id }"></c:out></td>
							<td><c:out value="${item.writedate}"></c:out></td>
				   </c:forEach>
			   </tbody>
			</table>
		</div>
		 <br>
 </div>

 <div id="dongtopview" style="float:right; margin-right:30px"><br>
    <h3>동네 커뮤니티 인기글 TOP10 미리보기</h3>
       <div>
         <table class="table table-striped">
            <thead>
              <tr><th>번호</th><th>제목</th><th>좋아요</th><th>조회수</th><th>작성자</th><th>작성일</th></tr>
			  </thead>
			<tbody>
			      <c:forEach var="item" items="${list2}">
			        <c:set var="number2" value="${number2+1 }" />
						<tr><td>&nbsp;<c:out value="${number2 }" /></td>
						    <td><a href="dwritedetail/${item.chatno }"><c:out value="${item.title }"></c:out></a>
							<td><c:out value="${item.likeno }"></c:out></td>
							<td><c:out value="${item.viewno }"></c:out></td>
							<td><c:out value="${item.user_id }"></c:out></td>
							<td><c:out value="${item.writedate}"></c:out></td>
				   </c:forEach>
			 </tbody>
         </table>
       </div>
 </div>

</section>

</body>
</html>