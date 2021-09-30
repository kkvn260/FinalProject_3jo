<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap');
</style>
<body>
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding">
     <%@ include file="../include/menu.jsp" %>
        <c:if test="${msg =='success' }">
         <h2>${sessionScope.nick_name }(${sessionScope.user_id })님 환영합니다</h2>
         </c:if>
   <div class=" w3-right w3-hide-small">
      <ul>
         <li><a href="${pageContext.request.contextPath }/mainpage" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;전체</a></li>
	     <li><a href="${pageContext.request.contextPath }/selllist" class="w3-bar-item w3-button">판매</a></li>
	     <li><a href="${pageContext.request.contextPath }/dongcomlist" class="w3-bar-item w3-button">동네 커뮤니티</a></li>
		 <li><a href="${pageContext.request.contextPath }/qnalist" class="w3-bar-item w3-button">Q&A</a></li>
      </ul>
    </div>
  </div>
</div>

  
<div class="main">
		<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
           <img class="w3-image" src="${pageContext.request.contextPath }/resources/img/test.jpg" width="1500" height="800">
           <div class="w3-display-middle w3-margin-top w3-center">
             <h1><a href="${pageContext.request.contextPath }/mainpage">오이마켓</a></h1>
             <h4>오늘도 이웃과 거래하는 <span id="oe">오이마켓</span></h4>
           </div>
       </header>
    </div>
        <!-- 챗봇 -->
		         <div id="cb">
                   <a href="https://console.dialogflow.com/api-client/demo/embedded/a20bbc1d-bc2d-42d1-9423-d5df37b93a4a" target="_blank">
                   <img src = "${pageContext.request.contextPath }/resources/img/52cb.png" width="70px" height="70px"></a>
                 </div> 

</body>
</html>