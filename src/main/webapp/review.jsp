<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<h1><%= session.getAttribute("username") %>님 <small>반갑습니다.</small></h1>
<form action="/web_programming/logout" method="get"><button type="submit">로그아웃</button></form>

</body>
</html>