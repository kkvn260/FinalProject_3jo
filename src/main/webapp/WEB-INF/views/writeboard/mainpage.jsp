<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
    <tiles:insertAttribute name="header"/>
</header>

<section>
	<tiles:insertAttribute name="content"/>
</section>

<footer id="footer">
   <tiles:insertAttribute name="footer"/>
</footer>

</body>
</html>