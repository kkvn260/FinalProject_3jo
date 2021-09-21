<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
   <table>
      <thead>
         <tr><th>글번호</th><th>아이디</th><th>내용</th><th>카테고리</th><th>날짜</th></tr>
      </thead>
      <tbody>
         <c:if test="${list==null }">
           <tr><td colspan="5">해당 자료가 없습니다</td></tr>
         </c:if>
         <c:if test="${list!=null }">
             <c:forEach var="item" items="${list}">
               <tr><td>${item.qnano}</td>
               <td><c:out value="${item.user_id}"/></td>
               <td><c:out value="${item.content }"/></td>
               <td><c:out value="${item.category }"/></td>
               <td><c:out value="${item.writedate}"/></td>
               </c:forEach>
         </c:if>
      </tbody>
   </table>
   <button id="insert">글쓰기</button>
</body>
</html>