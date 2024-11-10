<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인</h3>
	<form action="/web_programming/login" method="post">	
		아이디<input type="text" name="username">
		비밀번호<input type="password" name="password">
		로그인<input type="submit" value="로그인">
	</form>
</body>
</html>