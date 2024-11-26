<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국대학교 동아리 위키</title>
   <link rel="stylesheet" type="text/css" href="style/all_style.css">
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
    	<form action="search.jsp" method="GET">
    		<section class="search-bar">
	            <input type="search" name="keyword" class="keyword" placeholder="찾으시는 동아리가 있나요?">
	            <button type="submit" class="submit">
	                <img src="./assets/search.png" alt="Search">
	            </button>
            </section>
        </form>
             <section class="filter-section">
             	<form action="select.jsp" method="GET" class="selection-filter">
	                <h4>분과별 검색</h4>
	                <select class="selects">
			            <option>전체</option>
			            <option>학술</option>
			            <option>봉사</option>
			            <option>사회</option>
			            <option>연구</option>
			            <option>체육1분과</option>
			            <option>체육2분과</option>
			            <option>예술창작</option>
			            <option>신규</option>
			            <option>일반</option>
			        </select>
	            </form>
    		</section>
            <section class="club-list">
                <c:forEach var="dongari" items="${list}">
                    <div class="club-card" data-title="${dongari.title}">
                        <img src="./assets/default_logo.png" alt="logo">
                        <h4>${dongari.title}</h4>
                        <p>${dongari.category_name}</p>
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
                        <br>
                        <%-- window.location.href='/web_programming/details?id=${dongari.id}' 로 나중에 바꾸기--%>
                        <button class="club-button" onclick="window.location.href='/web_programming/review?id=${dongari.id}'">상세보기</button>
                    </div>
                </c:forEach>
            </section>
    </main>

    <%-- 서버에서 필요한 데이터를 JavaScript 변수로 전달 --%>
    <script>
        const currentUser = {
            id: '${sessionScope.userId}',
            username: '${sessionScope.username}'
        };
    </script>

    <script>
        function filterList() {
            // 검색어 입력값 가져오기
            const searchInput = document.getElementById('search_it').value.toLowerCase();
            const categoryInput = document.getElementById('categoryType').value.toLowerCase(); // 분과 검색값

            const clubBoxes = document.querySelectorAll('#club-list .box');
            // 각 동아리 이름과 분과를 필터링
            clubBoxes.forEach(box => {
                const title = box.dataset.title.toLowerCase();
                const category = box.querySelector('.category').textContent.toLowerCase();

                // 검색어와 분과 기준으로 필터링
                if (title.includes(searchInput) && category.includes(categoryInput)) {
                    box.style.display = ''; // 검색 및 분과 필터에 맞는 동아리 표시
                } else {
                    box.style.display = 'none'; // 필터에 맞지 않는 동아리 숨김
                }
            });
        }
    </script>

    <script src="main.js"></script>
</body>
</html>
