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
<style>
@import url('https://fonts.googleapis.com/css2?family=Gaegu&display=swap');
header{
font-family: 'Gaegu', cursive;
}
</style>   
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <header id="header">
        <nav class="navbar navbar-expand-lg navbar-black fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${pageContext.request.contextPath }/mainpage"><h2 style=" font-family: 'Gaegu', cursive;">오이마켓</h2></a>&nbsp;&nbsp;&nbsp;
                <%@ include file="../include/menu.jsp" %>      
                <c:if test="${msg =='success' }">
                  <h2>${sessionScope.nick_name }(${sessionScope.user_id })님 환영합니다</h2>
                 </c:if>   
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/mainpage">전체</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/selllist">판매</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/dongcomlist">동네커뮤니티</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/qnalist">Q&A</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        </header>

       
      
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
    
