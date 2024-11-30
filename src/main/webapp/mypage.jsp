<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국대학교 동아리 위키</title>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/mypage_style.css">
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
                <a href="./all" class="deactive">동아리</a>
            </nav>
            <div class="header-right">
                <div class="search-bar">
                    <form action="all" method="GET">
                        <input type="search" name="keyword" class="keyword" placeholder="찾으시는 동아리가 있나요?">
                        <button type="submit" class="submit">
                            <img src="./assets/search.png" alt="Search">
                        </button>
                    </form>
                </div>
                <div class="user-menu">
                    <c:choose>
                        <c:when test="${empty sessionScope.username}">
                            <a href="./login">로그인</a>
                        </c:when>
                        <c:otherwise>
                            <a href="./mypage">마이페이지</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </header>
     <div class="profile-container">
     <div id="left">
     <div id="profile">
     		<h1>${user.realname}님 반갑습니다!</h1><br>
     		<h2>ℹ️ 회원 정보</h2>
            <h3> 학번: ${user.studentnumber}  </h3>
            <h3> 아이디: ${user.username}</h3>
        </div> 	
        <div id="my">
       	<div class="select"><h3>👍 내가 쓴 리뷰</h3>
       	<div class="sidebar">

                    <c:choose> 
                        <c:when test="${empty reviewList}">
                            <p>관심있는 동아리에 리뷰를 남기세요!</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="review" items="${reviewList}">
                                <div class="scrapped-club">
                                    <span><b>제목: </b>"${review.title}" </span><br>
                                    <span class="category">내용: ${review.body}</span><br>
                                    <hr>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div></div>
               <br>
       	<hr>
       	<div class="select"><h3>⁉️나의 질문과 답변</h3>
       	<div class="sidebar">
                    <c:choose> 
                        <c:when test="${empty questionList}">
                            <p>관심있는 동아리에 질문을 남기세요!!</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="question" items="${questionList}">
                                <div class="scrapped-club" >
                                	<b>질문</b><br>
                                     <span>제목: "${question.title}"</span><br>
                                     <span>내용: ${question.body}</span><br><br>
                                    <c:choose>
		                                <c:when test="${not empty question.answer}">
		                                	<b>답변</b><br>
		                                    <span class="category">${question.answer}</span>
		                                </c:when>
		                                <c:otherwise>
		                                    <b>답변 대기 중</b>
		                                </c:otherwise>
		                            </c:choose>
		                            </div>
                                <hr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
</div>
       	<hr>
       	<div class="select">
       	<h3>☆ 스크랩</h3>
                <div class="sidebar">
                    <c:choose> 
                        <c:when test="${empty scrapList}">
                            <p>관심있는 동아리를 PICK하고 다른 대학생들의 의견을 알아보세요!</p>
                    
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="scrap" items="${scrapList}">
                                <div class="scrapped-club" onclick="window.location.href='/web_programming/review?id=${scrap.id}'">
                                    <span><b>${scrap.title}</b></span>
                                    <span class="category">${scrap.category_name}</span>
                                    <hr>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            <br>
        </div><br>
       	<hr>
       	<div class="select"><a href="./logout">ﾧ↦ 로그아웃</a></div><br><br>
        </div>
      </div>
        
        <div id="right">
            
            <h1>관리 중인 페이지</h1>
            <section class="club-list">
                <c:forEach var="dongari" items="${dongariList}">
                    <div class="club-card" data-title="${dongari.title}">
                        <img src="./assets/default_logo.png" alt="logo">
                        <div class="inner">
                        <h4>${dongari.title}</h4>
                        <p class="category">${dongari.category_name}</p>
                        <p>${dongari.summary}</p>
                        <button class="recruit-btn" onclick="window.location.href='/web_programming/edit?id=${dongari.id}'">
                        수정
                        </button>
                        <br>
                        <button class="club-button" onclick="window.location.href='/web_programming/review?id=${dongari.id}'">상세보기</button>
                        </div>
                    </div>
                </c:forEach>
            </section>
        </div>
    </div>
    <%-- 서버에서 필요한 데이터를 JavaScript 변수로 전달 --%>
    <script>
        const currentUser = {
            id: '${sessionScope.userId}',
            username: '${sessionScope.username}'
        };
    </script>
    <script src="main.js"></script>
</body>
</html>