<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<a href="./" class="deactive">홈</a> <a href="./all" class="active">동아리</a>
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
		<div>
			<section class="search-bar">
				<input type="search" name="keyword" class="keyword"
					placeholder="찾으시는 동아리가 있나요?" oninput="filterList()"
					value="${keyword}">
				<div class="submit">
					<img src="./assets/search.png" alt="Search">
				</div>
			</section>
		</div>
		<section class="filter-section">
			<div class="selection-filter">
				<h4>분과별 검색</h4>
				<select class="selects" oninput="filterList()">
					<option>전체</option>
					<option>학술</option>
					<option>봉사</option>
					<option>사회</option>
					<option>연구</option>
					<option>체육1</option>
					<option>체육2</option>
					<option>예술창작</option>
					<option>신규</option>
					<option>일반</option>
				</select>
			</div>
		</section>
		<section class="club-list">
			<c:forEach var="dongari" items="${list}">
				<div class="club-card" data-title="${dongari.title}">
					<img src="./assets/default_logo.png" alt="logo">
					<h4>${dongari.title}</h4>
					<p class="category">${dongari.category_name}</p>
					<p>${dongari.summary}</p>
					<button
						class="recruit-btn 
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
					<button class="club-button"
						onclick="window.location.href='/web_programming/review?id=${dongari.id}'">상세보기</button>
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

    const initialKeyword = '${param.keyword}'; // 파라미터로 전달된 keyword
	</script>

	<script>
	document.addEventListener("DOMContentLoaded", () => {
	    // 검색창에 초기 keyword 값 설정
	    const searchInputElement = document.querySelector('.keyword');
	    if (initialKeyword) {
	        searchInputElement.value = initialKeyword; // 검색창에 keyword 값 표시
	    }
	    
	    // 초기 필터링 실행
	    filterList();
	});

	function filterList() {
	    // 검색어 입력값 가져오기
	    const searchInput = document.querySelector('.keyword').value.toLowerCase(); // 검색창 입력값
	    const categoryInput = document.querySelector('.selects').value.toLowerCase(); // 선택된 분과 값

	    // 동아리 목록 가져오기
	    const clubCards = document.querySelectorAll('.club-card'); // 각 동아리 카드

	    // 각 동아리 카드 필터링
	    clubCards.forEach(card => {
	        const title = card.dataset.title ? card.dataset.title.toLowerCase() : ''; // 데이터 속성의 제목
	        const category = card.querySelector('.category').textContent.toLowerCase(); // <p> 태그의 카테고리 텍스트

	        // 검색어와 분과 선택 조건 확인
	        const matchesSearch = title.includes(searchInput); // 제목이 검색어 포함 여부
	        const matchesCategory = categoryInput === '전체' || category.includes(categoryInput); // '전체'는 모든 분과 표시

	        // 조건에 따라 표시 여부 결정
	        if (matchesSearch && matchesCategory) {
	            card.style.display = ''; // 조건에 맞는 경우 표시
	        } else {
	            card.style.display = 'none'; // 조건에 맞지 않는 경우 숨김
	        }
	    });
	}
    </script>

	<script src="main.js"></script>
</body>
</html>
