<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dongariForm_style.css">
</head>
<body>
<header>
        <div class="header-content">
            <div class="logo-container">
                <img src="./assets/logo.png" alt="동국대학교 로고">
                <div class="site-name">
                
                    <div class="small-text">동국대학교 동아리 위키</div>
                    <div class="large-text">동동</div>
                </div>
            </div>
            <nav>
                <a href="./" class="active">홈</a> 
                <a href="./all">동아리</a>
            </nav>
            <div class="header-right">
                <div class="search-bar">
                    <form action="search.jsp" method="GET">
                        <input type="search" name="keyword" class="keyword" placeholder="찾으시는 동아리가 있나요?">
                        <button type="submit" class="submit">
                            <img src="./assets/search.png" alt="Search">
                        </button>
                    </form>
                </div>
                <div class="user-menu">
                    <c:choose>
                        <c:when test="${empty sessionScope.username}">
                            <a href="login.jsp">로그인</a>
                        </c:when>
                        <c:otherwise>
                            <a href="mypage.jsp">마이페이지</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </header>
    <div id="inputbox">
	<form action="${type}" method="post">
	<label>동아리 소개 이미지</label>
		<label for="filebtn" id="customFileBtn">파일 찾기</label>
	<input type="file" name="file" id="filebtn" style="display:none"><br>
	<label>동아리명*</label><br>
			<input type="text" value="${dongari.title}" name="title"><br>
			<label>동아리 요약(15자)*</label><br>
			<input type="text" value="${dongari.summary}" name="summary"><br>
			<label>동아리 설명*</label><br>
			<textarea name="body"value="${dongari.body}"></textarea><br><br>
			<label>현재 부원 수</label>
			<input type="number" name="number"><br><br>
				<label>모집 상태*</label><br>
  <input type="radio" id="option1" name="apply_status" value="1" checked>
  <label for="option1" class="radio-btn">모집 중</label>

  <input type="radio" id="option2" name="apply_status" value="2">
  <label for="option2" class="radio-btn">상시 모집</label>

  <input type="radio" id="option3" name="apply_status" value="3">
  <label for="option3" class="radio-btn">모집 완료</label>
			<br><br>
			<label>모집 기간</label><br>
			<input type="date" value="${dongari.apply_start}" name="apply_start">~
			<input type="date" value="${dongari.apply_end}" name="apply_end"><br><br>
			<label>지원 링크</label><br>
			<input type="text" value="${dongari.apply_link}" name="apply_link"><br>
			<label>동아리 SNS 링크</label><br>
			<input type="text" value="${dongari.sns_link}" name="sns_link"><br>
			<label>동아리방 위치</label><br>
			<input type="text" value="${dongari.location}" name="location"><br>
	<input type="hidden" value="${dongari.category_id}" name="category_id">
	<input type="hidden" value="${dongari.id}" name="id"><br>
	<input type="submit" value="저장">
	<input type="reset" value="취소">
	</form>
	</div>
</body>
</html>