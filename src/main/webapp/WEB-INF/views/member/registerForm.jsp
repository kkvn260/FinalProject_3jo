<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReigsterForm</title>
</head>
<body>
    <h2>회원가입 Test화면</h2>
    <form action="/register" method="post">
    <ul>
        <li>
        <label for="id">아이디</label>
        <input type="text" id="id" name="user_id">
        </li>
        <li><label for="id">비밀번호</label>
            <input type="password" name="pwd"></li>
        <li><label for="nick">닉네임</label>
            <input type="text" id="nick" name="nick_name"></li>
        <li><label for="phonenum">연락처</label>
            <input type="text" id="phonenum" name="phoneno"></li>
        <li><label for="mail">이메일</label>
            <input type="text" id="mail" name="email"></li>
        <li><label for="name">이름</label>
            <input type="text" id="name" name="user_name"></li>
        <li><label for="birth">생년월일</label>
            <input type="text" id="birth" name="birthday"></li>
        <li><label for="addr">주소</label>
            <input type="text" id="addr" name="addr"></li>
        <li>
        <legend>성별</legend>
        <input type="radio" id="man" name="gender" value="남자">
             <label for="man">남자</label>
        <input type="radio" id="woman" name="gender" value="여자">
             <label for="woman">여자</label>
        </li>
        <br>
    <input type="submit" value="회원가입">
    </ul>
    </form>
</body>
</html>