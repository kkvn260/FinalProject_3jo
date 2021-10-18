<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>오이마켓</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }/resources/startbootstrap/css/styles.css" rel="stylesheet" />
        <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
           #big{
             color:green;
             text-shadow:1px 1px 1px black;
             font-size:30px;
             font-family: 'Gowun Dodum', sans-serif;
           }
           #big2{
             font-size:20px;
             font-family: 'Gowun Dodum', sans-serif;
           }
           .k1:hover{
           		border: 3px solid green;
           }

           @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

        </style>
    </head>
   
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <hr class="divider" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 mb-5" id="big2"><span id="big">오</span>늘도 <span id="big">이</span>웃과 거래하는 오이마켓</p>
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath }/selllist">Find Out More</a>
                    </div>
                </div>
            </div>
        </header>
      
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">At Your Service</h2>
                <hr class="divider" />
                <div class="row gx-4 gx-lg-5">
                    <div class="text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                            <h3>판매</h3>
                            <p class="text-muted mb-0">필요없는 물품을 판매해보세요!</p>
                        </div>
                    </div>
                    <div class="text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                            <h3>구매</h3>
                            <p class="text-muted mb-0">원하는 상품을 저렴하게 구매하세요!</p>
                        </div>
                    </div>
                    <div class="text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>
                            <h3>경매</h3>
                            <p class="text-muted mb-0">경매로 판매해보세요!</p>
                        </div>
                    </div>
                    <div class="text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>
                            <h3>동네생활</h3>
                            <p class="text-muted mb-0">동네 사람들과 커뮤니티하세요!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
          
        
         <section id="content" class="page-section" id="about">
            <div class="container px-4 px-lg-5 mt-5">
            	<h3 style="margin: 10px 0px;">판매 인기글 TOP8 미리보기</h3>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="padding-top: 10px;">
                <c:forEach var="item" items="${list }">
                    <div class="col mb-5">
                        <div class="card h-100 k1" style="border-radius: 30px;">
                            <!-- Product image-->
                            <c:if test="${not empty item.real_name }">
                            <img class="card-img-top" style="border-radius: 30px;" src="${pageContext.request.contextPath }/resources/img/${item.real_name}" alt="..." />
                            </c:if>
                            <c:if test="${empty item.real_name }">
                            <img class="card-img-top" style="border-radius: 30px;" src="${pageContext.request.contextPath }/resources/img/이미지x.png" alt="..." />
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
                        <div class="card h-100 k1" style="border-radius: 30px;">
                            <!-- Product image-->
                            <c:if test="${not empty item.real_name }">
                            <img class="card-img-top" style="border-radius: 30px;" src="${pageContext.request.contextPath }/resources/img/${item.real_name}" alt="..." />
                            </c:if>
                            <c:if test="${empty item.real_name }">
                            <img class="card-img-top" style="border-radius: 30px;" src="${pageContext.request.contextPath }/resources/img/이미지x.png" alt="..." />
                            </c:if>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${item.title }</h5>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="dwritedetail/${item.chatno }">보러가기</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div><br><br>
            </div>
           </section>
       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath }/resources/startbootstrap/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
    
