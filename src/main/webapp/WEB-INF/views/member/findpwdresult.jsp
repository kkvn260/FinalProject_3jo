<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
</head>
<body>

	


	<script>
		alert("가입된 이메일로 임시비밀번호를 발송하였습니다");
		location.href="${pageContext.request.contextPath}/login";
	</script>

</body>
</html>