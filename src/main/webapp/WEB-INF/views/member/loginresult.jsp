<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<meta charset="UTF-8">
<title>Insert title here</title>
<body>

<c:if test="${login==null }">
      <script type="text/javascript">
              alert("로그인 실패하였습니다. 다시 확인하고 시도해주세요");
              location.href="${pageContext.request.contextPath }/login";
      </script>
</c:if>
<c:if test="${login!=null}">
       <script type="text/javascript">
              alert("로그인 되셨습니다. 환영합니다");
              location.href="${pageContext.request.contextPath }/mainpage";
       </script>
</c:if>

	</body>
</html>