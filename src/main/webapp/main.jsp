<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- page: jsp 설정 지시자 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>동아리 목록</h3>

<table border="1">
	<tr><th>동아리 id</th><th>user id</th><th>title</th><th>summary</th><th>body</th>
	<th>카테고리</th><th>지원시작일</th><th>지원종료일</th><th>지원주소</th><th>엠버수</th><th>sns</th>
	<th>위치</th></tr>
	<c:forEach var="dongari" items="${list }"> 
	<tr><td>${dongari.id}</td><td>${dongari.user_id}</td><td>${dongari.title}</td><td>${dongari.summary}</td>
	<td>${dongari.body}</td><td>${dongari.category}</td><td>${dongari.apply_start}</td><td>${dongari.apply_end}</td>
	<td>${dongari.apply_link}</td><td>${dongari.member_num}</td><td>${dongari.sns_link}</td><td>${dongari.location}</td>
	</c:forEach>
</table>
</body>
</html>