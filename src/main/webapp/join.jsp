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
		<table border="1">
				<tr><th>학번</th><td><input type="text" name="studentnumber"></td></tr>
				<tr><th>이름</th><td><input type="text" name="realname"></td></tr>
				<tr><th>아이디</th><td><input type="text" name="username"></td></tr>
				<tr><th>비밀번호</th><td><input type="password" name="password"></td></tr>
				<tr><th>가입</th><td><input type="submit" value="가입"></td></tr>
		</table>
	</form>
</body>
</html>