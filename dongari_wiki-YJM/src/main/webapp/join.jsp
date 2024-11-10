<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원가입</h3>
	<form action="/web_programming/join" method="post">	
		학번<input type="text" name="studentnumber">
		이름<input type="text" name="realname">
		아이디<input type="text" name="username">
		비밀번호<input type="password" name="password">
		가입<input type="submit" value="가입">
	</form>
</body>
</html>