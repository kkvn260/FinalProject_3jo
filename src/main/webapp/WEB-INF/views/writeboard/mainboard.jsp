<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

<section id="content" >
 <div id="topview" style="float:left; margin-right:200px;">
	<h3>인기글 TOP10 미리보기</h3>
		<div id="preview">
		   <table>
			  <thead>
			    <tr><th>번호</th><th>제목</th><th>좋아요</th><th>조회수</th><th>작성자</th><th>작성일</th></tr>
			  </thead>
			  <tbody>
			      <c:forEach var="item" items="${list}">
			        <c:set var="number" value="${number+1 }" />
						<tr><td><c:out value="${number }" /></td>
						    <td><a href=""><c:out value="${item.title }"></c:out></a>
							<td><c:out value="${item.likeno }"></c:out></td>
							<td><c:out value="${item.viewno }"></c:out></td>
							<td><c:out value="${item.user_id }"></c:out></td>
							<td><c:out value="${item.writedate}"></c:out></td>
				   </c:forEach>
			   </tbody>
			</table>
		</div>
 </div>
 <h3>챗봇</h3>
 <div id="cb"></div>
       <iframe
          width="350"
          height="430"
          src="https://console.dialogflow.com/api-client/demo/embedded/a20bbc1d-bc2d-42d1-9423-d5df37b93a4a">
       </iframe>
</section>

</body>
</html>