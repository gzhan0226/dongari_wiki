<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국대학교 동아리 위키</title>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main_style.css">
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
    <main>
        <section class="clubs">
            <h2>동아리</h2>
            <p>여러 분야의 동아리를 확인하고, 관심있는 동아리에 대해 찾아보세요</p>
            <ul class="club-list">
                <c:forEach var="dongari" items="${dongariList}">
                    <li class="club-item" onclick="window.location.href='/web_programming/review?id=${dongari.id}'">
                        <div class="text-container">
                            <span><b>${dongari.title}</b></span>
                            <span class="category">${dongari.category_name}</span>
                        </div>
                        <button class="recruit-btn 
	                        <c:choose>
					            <c:when test="${dongari.apply_start eq 'None'}">ongoing</c:when>
					            <c:when test="${dongari.apply_start eq '9999'}">closed</c:when>
					            <c:otherwise>open</c:otherwise>
					        </c:choose>">
                            <c:choose>
                                <c:when test="${dongari.apply_start eq 'None'}">상시모집</c:when>
                                <c:when test="${dongari.apply_start eq '9999'}">모집완료</c:when>
                                <c:otherwise>모집중</c:otherwise>
                            </c:choose>
                        </button>
                    </li>
                </c:forEach>
            </ul>
        </section>

        <aside class="sidebars">
            <div class="sidebar">
                <c:choose>
                    <c:when test="${empty sessionScope.username}">
                        <p>관심있는 동아리를 PICK하고 다른 대학생들의 의견을 알아보세요!</p><br>
                        <a href="login">로그인</a>
                        <a href="join">회원가입</a>
                    </c:when>
                    <c:otherwise>
                        <span><b>${sessionScope.username}</b></span><br><br>
                        <div class="user-actions">
                           <a href="mypage">마이페이지</a>
                            <form action="/web_programming/logout" method="get">
                                <button type="submit" class="logout-button">로그아웃</button>
                            </form>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <c:if test="${not empty sessionScope.username}">
                <h5>스크랩</h5>
                <div class="sidebar">
                    <c:choose>
                        <c:when test="${empty scrapList}">
                            <p>관심있는 동아리를 PICK하고 다른 대학생들의 의견을 알아보세요!</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="scrap" items="${scrapList}">
	                                <div class="scrapped-club" onclick="window.location.href='/web_programming/review?id=${scrap.id}'">
	                                    <span><b>${scrap.title}</b> </span>
	                                    <span class="category">${scrap.category_name}</span>
	                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>

            <h5>인기 동아리 리뷰 둘러보기</h5>
            <c:forEach var="review" items="${popularReviews}">
                <div class="review">
                    <strong>${review.clubName}</strong>
                    <p><br>${review.content}</p>
                </div>
            </c:forEach>
        </aside>
    </main>

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
