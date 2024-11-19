<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국대학교 동아리 위키</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/newreview_style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function alertLogin() {
            alert("로그인이 필요한 기능입니다.");
        }
    </script>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="logo-container">
                <img src="./assets/logo.png" alt="Logo">
                <div class="site-name">
                    <span class="small-text">동국대학교 동아리 위키</span><br>
                    <span class="large-text">동동</span>
                </div>
            </div>
            <nav>
                <a href="main.jsp">홈</a>
                <a href="#" class="active">동아리</a>
            </nav>
            <div class="header-right">
                <div class="search-bar">
                    <input type="search" class="keyword" placeholder="찾으시는 동아리가 있나요?">
                    <button class="submit">
                        <img src="./assets/search.png" alt="Search">
                    </button>
                </div>
                <div class="user-menu">
                    <c:choose>
                        <c:when test="${empty sessionScope.username}">
                            <a href="login">로그인</a>
                        </c:when>
                        <c:otherwise>
                            <a href="mypage">마이페이지</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div class="clubs">
            <div class="review">
                <form method="post" action="${type}">
                    <label>
                        <input type="radio" name="anonymity" value="실명" checked> 실명
                    </label>
                    <label>
                        <input type="radio" name="anonymity" value="익명"> 익명
                    </label>
                    <br><br>
                    
                    <div class="ratings-box">
                        <div class="star_rating">
                            <strong>분위기</strong>
                            <span class="star" data-value="1">★</span>
                            <span class="star" data-value="2">★</span>
                            <span class="star" data-value="3">★</span>
                            <span class="star" data-value="4">★</span>
                            <span class="star" data-value="5">★</span>
                            <input type="hidden" name="atm_rating" class="rating-input">
                        </div>
                        <div class="star_rating">
                            <strong>운영</strong>
                            <span class="star" data-value="1">★</span>
                            <span class="star" data-value="2">★</span>
                            <span class="star" data-value="3">★</span>
                            <span class="star" data-value="4">★</span>
                            <span class="star" data-value="5">★</span>
                            <input type="hidden" name="man_rating" class="rating-input">
                        </div>
                        <div class="star_rating">
                            <strong>활동</strong>
                            <span class="star" data-value="1">★</span>
                            <span class="star" data-value="2">★</span>
                            <span class="star" data-value="3">★</span>
                            <span class="star" data-value="4">★</span>
                            <span class="star" data-value="5">★</span>
                            <input type="hidden" name="act_rating" class="rating-input">
                        </div>

                        <script>
                            $(document).ready(function() {
                                $('.star_rating .star').click(function() {
                                    var ratingValue = $(this).data('value');
                                    $(this).siblings('.star').removeClass('on');
                                    $(this).addClass('on').prevAll('.star').addClass('on');
                                    $(this).closest('.star_rating').find('.rating-input').val(ratingValue);
                                });
                            });
                        </script>

                        <br><br>
                        <input type="hidden" value="${id}" name="id">
                        <input type="text" name="title" placeholder="제목" required>
                        <textarea name="body" placeholder="내용을 입력하세요." required></textarea>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.username}">
                            <button type="button" onclick="alertLogin()"><b>글쓰기</b></button>
                        </c:when>
                        <c:otherwise>
                            <button type="submit"><b>글쓰기</b></button>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </div>
    </main>
</body>
</html>