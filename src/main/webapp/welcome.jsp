<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
if (session.getAttribute("username") == null) {
    response.sendRedirect("logout.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%= session.getAttribute("username") %>님 <small>반갑습니다.</small></h1>
    <a href="logout.jsp">로그아웃</a>
</body>
</html>