<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국대학교 동아리 위키</title>
    <link rel="stylesheet" href="./style/main_style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="logo-container">
                <img src="logo.png" alt="동국대학교 로고">
                <div class="site-name">
                
                    <div class="small-text">동국대학교 동아리 위키</div>
                    <div class="large-text">동동</div>
                </div>
            </div>
            <nav>
                <a href="main.jsp" class="active">홈</a>
                <a href="clubs.jsp">동아리</a>
            </nav>
            <div class="header-right">
                <div class="search-bar">
                    <form action="search.jsp" method="GET">
                        <input type="search" name="keyword" class="keyword" placeholder="찾으시는 동아리가 있나요?">
                        <button type="submit" class="submit">
                            <img src="search.png" alt="Search">
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

    <main>
        <section class="clubs">
            <h2>동아리</h2>
            <p>여러 분야의 동아리를 확인하고, 관심있는 동아리에 대해 찾아보세요</p>
            <ul class="club-list">
                <c:forEach var="club" items="${clubs}">
                    <li class="club-item">
                        <div class="text-container">
                            <span><b>${club.name}</b></span>
                            <span class="category">${club.category}</span>
                        </div>
                        <button class="recruit-btn ${club.recruitmentStatus}">
                            <c:choose>
                                <c:when test="${club.recruitmentStatus eq 'ongoing'}">상시모집</c:when>
                                <c:when test="${club.recruitmentStatus eq 'open'}">모집중</c:when>
                                <c:otherwise>모집완료</c:otherwise>
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
                        <p>관심있는 동아리를 PICK하고 다른 대학생들의 의견을 알아보세요!</p>
                        <a href="login.jsp">로그인</a>
                        <a href="register.jsp">회원가입</a>
                    </c:when>
                    <c:otherwise>
                        <span><b>${sessionScope.username}</b></span><br><br>
                        <a href="mypage.jsp">마이페이지</a>
                        <form action="/web_programming/logout" method="get"><button type="submit">로그아웃</button></form>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <c:if test="${not empty sessionScope.username}">
                <h5>스크랩</h5>
                <div class="sidebar">
                    <c:choose>
                        <c:when test="${empty scrappedClubs}">
                            <p>관심있는 동아리를 PICK하고 다른 대학생들의 의견을 알아보세요!</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="scrappedClub" items="${scrappedClubs}">
                                <div class="scrapped-club">
                                    <span>${scrappedClub.name}</span>
                                    <span class="category">${scrappedClub.category}</span>
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
                    <%-- 선택사항 --%>
                    <div class="review-meta">
                        <span class="likes">좋아요 ${review.likes}</span>
                        <span class="date">${review.formattedDate}</span>
                    </div>
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