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
   .hi{
   		font-size: 30px;
   		color: green;
   }
</style>
<body>
<br><br>
<div class="main">
		<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
           <img src="${pageContext.request.contextPath }/resources/img/test.jpg" width="1200" height="400"/>
           <div class="w3-display-middle w3-margin-top w3-center">
             <h1><a href="${pageContext.request.contextPath }/mainpage" style="font-size: 50px;">오이마켓</a></h1>
             <h4><span class="hi">오</span>늘도 <span class="hi">이</span>웃과 거래하는 <span id="oe">오이마켓</span></h4>
           </div>
       </header>
</div>
<section id="content" class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
            	<h3 style="margin: 10px 0px;">판매 인기글 TOP8 미리보기</h3>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="padding-top: 10px;">
                <c:forEach var="item" items="${list }">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <c:if test="${not empty item.real_name }">
                            <img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/${item.real_name}" alt="..." />
                            </c:if>
                            <c:if test="${empty item.real_name }">
                            <img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/이미지x.png" alt="..." />
                            </c:if>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${item.title }</h5>
                                    <!-- Product price-->
                                    <c:if test="${empty item.sell_price }">
                                    	경매중인 상품!
                                    </c:if>
                                    <c:if test="${empty item.deal_price }">
                                   		${item.sell_price }원
                                    </c:if>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            	<c:if test="${empty item.sell_price }">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="tdealdetail/${item.tradeno }">보러가기</a></div>
                            	</c:if>
                            	<c:if test="${empty item.deal_price }">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="twritedetail/${item.tradeno }">보러가기</a></div>
                            	</c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <h3>동네 커뮤니티 인기글 TOP8 미리보기</h3>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="padding-top: 10px;">
                <c:forEach var="item" items="${list2 }">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <c:if test="${not empty item.real_name }">
                            <img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/${item.real_name}" alt="..." />
                            </c:if>
                            <c:if test="${empty item.real_name }">
                            <img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/이미지x.png" alt="..." />
                            </c:if>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${item.title }</h5>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top--transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">보러가기</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div><br><br>
            </div>
</section>

</body>
</html>