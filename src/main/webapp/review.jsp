<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동아리 위키 - CAPS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/review_style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function () {
        // 좋아요 버튼 클릭 이벤트 핸들러
        $('.like-btn').on('click', function () {
            const review_id = $(this).data('review-id'); // 버튼에서 review_id 가져오기
			const likeCheck = $(this).data('likecheck');
            // AJAX POST 요청 (파라미터 형식으로 전송)
            $.ajax({
                url: '/web_programming/likes', // 요청을 보낼 URL
                type: 'POST', // POST 방식
                data: { review_id: review_id }, // 파라미터로 전송
                success: function () {
                	if (likeCheck) {
                		alert('좋아요 취소');
                	}
                	else
                		alert('좋아요');
                    location.reload();
                },
                error: function (xhr, status, error) {
                    console.error('좋아요 요청 실패:', error);
                    alert('좋아요 요청 처리 중 오류가 발생했습니다.');
                }
            });
        });
        $('.scrap-btn').on('click', function () {
            const dongari_id = $(this).data('dongari-id'); 
			const scrapCheck = $(this).data('scrapcheck');
            // AJAX POST 요청 (파라미터 형식으로 전송)
            $.ajax({
                url: '/web_programming/scraps', 
                type: 'POST', // POST 방식
                data: { dongari_id: dongari_id },
                success: function () {
                	if (scrapCheck) {
                		alert('스크랩 취소');
                	}
                	else
                		alert('스크랩');
                    location.reload();
                },
                error: function (xhr, status, error) {
                    console.error('스크랩 요청 실패:', error);
                    alert('스크랩 요청 처리 중 오류가 발생했습니다.');
                }
            });
        });
    });
    </script> 
    
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
                <a href="main.jsp" class="active">홈</a>
                <a href="#">동아리</a>
            </nav>
            <div class="header-right">
                <div class="search-bar">
                    <input type="search" class="keyword" placeholder="찾으시는 동아리가 있나요?">
                    <button class="submit">
                        <img src="./assets/search.png" alt="Search">
                    </button>
                </div>
                <div class="user-menu">
                    <a href="mypage.jsp">마이페이지</a>
                </div>
            </div>
        </div>
    </header>

    <main>
        <section class="club-info">
            <div class="logo-container">
                <img src="./assets/caps_logo.png" alt="${dongari.title} Logo">
                <div class="site-name">
                    <div class="large-text">${dongari.title}</div> 
                    <div class="small-text">${dongari.member_num}명 이상</div>
                    <button class="scrap-btn" data-dongari-id="${dongari.id}" data-scrapcheck="${scrapCheck}">즐겨찾기☆</button>
                </div>
            </div><br>
            <h3>인기 리뷰</h3>
            <div class="review">
               <c:forEach var="review" items="${reviews}">
				    <div class="review">
				        <p>${review.body}</p>
				    </div>
				</c:forEach>
            </div>
            <div class="write">
                <button id="write-review">리뷰쓰기</button>
            </div>
        </section>

        <section class="reviews">
          	<div class="ratings">
                <div class="rating-summary">
                    <h3><c:out value="${total}" /></h3>
                    <div class="stars"><c:out value="${total}" /></div>
                </div>
                <div class="divider"></div>
                 <div class="category-ratings">
                    <p>분위기: ${atm} </p>
					<p>활동 : ${act} </p>
					<p>운영 : ${man} </p>
                </div> 
            </div> 
            
            
            
            <ul class="review-list">
   				<c:forEach var="review" items="${reviews}">
        		<li class="review-item" data-review-id="${review.id}">
            	<div class="review-header">
                <span class="review-rating">${review.total_rating} ★</span>
                <strong>${review.title}</strong>
            </div>
            <p class="review-author">${review.username}</p>
            <p class="review-content">${review.body}</p>
            <div class="review-controls">
                <!-- 좋아요 버튼 -->
                <button class="like-btn" data-review-id="${review.id}" data-likecheck="${review.likeCheck}">좋아요 👍</button>
                <!-- 좋아요 수 -->
                <span id="likeCount${review.id}">${review.likeCount}</span>
            </div>
        		</li>
    			</c:forEach>
			</ul>
        </section>
    </main>
</body>
</html>