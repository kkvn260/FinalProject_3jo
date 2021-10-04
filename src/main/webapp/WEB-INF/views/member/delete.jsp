<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<br><br><br><br>

      <script type="text/javascript">
              alert("정상적으로 탈퇴 되었습니다. 이용해주셔서 감사합니다");
              location.href="${pageContext.request.contextPath }/login";
      </script>

</body>
</html>