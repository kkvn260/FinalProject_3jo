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

<%@ include file="header.jsp" %>
<section id="content" >
<div id="like" style="float:left; margin-right:200px;">
	<br>
		<h4>좋아요 TOP5 미리보기</h4>
		<div id="preview">
			<table>
				
			</table>
		</div>
	</div>
     <iframe
      width="350"
      height="430"
      src="https://console.dialogflow.com/api-client/demo/embedded/a20bbc1d-bc2d-42d1-9423-d5df37b93a4a">
     </iframe>
      
</section>
<%@ include file="footer.jsp" %>
</body>
</html>