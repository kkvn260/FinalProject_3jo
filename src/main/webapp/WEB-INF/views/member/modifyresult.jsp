<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br><br><br>
 <c:if test="${result==1 }">
    <script>
    
       alert("수정성공!!");
       location.href="${pageContext.request.contextPath }/myinfo";
    </script>  
 
 </c:if>
 <c:if test="${result!=1 }">
   <script>
     alert("수정실패!!");
     location.href="${pageContext.request.contextPath }/myinfo";
     </script>
     
     
   </c:if>

</body>
</html>