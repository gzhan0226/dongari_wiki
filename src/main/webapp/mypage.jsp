<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBUtil"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MySQL 연결 드라이버 테스트</title>
</head>
<body>
	<h1>MySQL 연결 드라이버 테스트</h1>
	<%
		
		try
		{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.open();
			if (conn != null) {
				out.println("MySQL 연결 성공");
			}
			else {
				out.println("MySQL 연결 실패");
			}
			
		}
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
		}
	%>
</body>
</html>