<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
     <tr><th>글번호</th><th>제목</th><th>아이디</th><th>작성일</th></tr>
   </thead>
   <tbody>
     <c:if test="${list!=null }">
       <c:forEach var="item" items="${list }">
          <tr><td>${item.chatno }</td>
              <td><c:out value="${item.title }"/></td>
              <td><c:out value="${item.user_id }"/></td>
              <td><c:out value="${item.writedate }"/></td>
              </tr>
       </c:forEach>
     </c:if>
   </tbody>
</table>

</body>
</html>