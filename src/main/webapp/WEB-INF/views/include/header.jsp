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

span{
	font-size : 25px;
	color: green;
    text-shadow: 1px 1px 1px pink;
    font-family: 'Sunflower', sans-serif;
    margin: 10px;
   
}
</style>
<body>
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding" style="width: 1200px;">
   <a href="${pageContext.request.contextPath }/mainpage"><img src="${pageContext.request.contextPath }/resources/img/52.png" width="45px" height="65px">&nbsp;&nbsp;</a>         
     <%@ include file="../include/menu.jsp" %>      
        <c:if test="${msg =='success' }">
         <h2>${sessionScope.nick_name }(${sessionScope.user_id })님 환영합니다</h2>
         </c:if>     
   <div class="w3-right w3-hide-small" style="float: left;">
         <span><a href="${pageContext.request.contextPath }/mainpage" >전체</a></span>
	     <span><a href="${pageContext.request.contextPath }/selllist" >판매</a></span>
	     <span><a href="${pageContext.request.contextPath }/dongcomlist" >동네커뮤니티</a></span>
		 <span><a href="${pageContext.request.contextPath }/qnalist" >Q&A</a></span>
    </div>
  </div>
</div>
</body>
</html>