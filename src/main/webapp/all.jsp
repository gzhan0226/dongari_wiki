<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국대학교 동아리 위키</title>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/all_style.css">
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
                <a href="./">홈</a> 
                <a href="list" class="active">동아리</a>
            </nav>
            <div class="header-right">
                <div class="search-bar">
                
                </div>
                <div class="user-menu">
                    <c:choose>
                        <c:when test="${empty sessionScope.username}">
                        <a href="login">로그인</a>
                        <a href="join">회원가입</a>
                        
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
                <input type="text" id="search_it" placeholder="동아리명으로 검색해보세요! "><br>
                <div id="typeof">
                <h4>분과별 검색</h4>
                <input type="text" list="suggestions"name="typeof" placeholder="전체">
                <datalist id="suggestions">
                    <option value="공연"></option>
                    <option value="봉사"></option>
                    <option value="사회"></option>
                    <option value="학술"></option>
                    <option value="예술창작"></option>
                    <option value="연구"></option>
                    <option value="체육1"></option>
                    <option value="체육2"></option>
                    <option value="신규"></option>
                </datalist>
                </div>
                <br>
                <c:forEach var="dongari" items="${list}">
                <div class="box">
                	<img>
                	<button class="apply" ${dongari.apply_start}>
                            <c:choose>
                                <c:when test="${dongari.apply_start eq 'None'}">상시모집</c:when>
                                <c:when test="${dongari.apply_start eq '9999'}">모집완료</c:when>
                                <c:otherwise>모집중</c:otherwise>
                            </c:choose>
                        </button>
                        <div class="text-container">
                            <h3>${dongari.title}</h3>
                            <p class="category">${dongari.category_name}</p>
                        </div><br>
                        <div class="recruit-btn">
                        	<button class="recruit-btn" onClick=window.location.href="/dongari_wiki/details?=${dongari.title}">상세보기</button>
                        </div>
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
    <script src="main.js"></script>
</body>
</html>