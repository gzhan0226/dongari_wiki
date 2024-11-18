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
    <link rel="stylesheet" href="dongari_review_style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#write-review').on('click', function() {
                const categoryRatings = {
                    분위기: <c:out value="${categoryRatings.분위기}" />,
                    운영: <c:out value="${categoryRatings.운영}" />,
                    활동: <c:out value="${categoryRatings.활동}" />
                };
                
                $('.category-ratings').html(`
                    <p>${categoryRatings.분위기}★ 분위기</p>
                    <p>${categoryRatings.운영}★ 운영</p>
                    <p>${categoryRatings.활동}★ 활동</p>
                `);
                
                const totalRating = (categoryRatings.분위기 + categoryRatings.운영 + categoryRatings.활동) / 3;
                $('.rating-summary h3').text(totalRating.toFixed(1));
                
                const fullStars = '★'.repeat(Math.floor(totalRating));
                const halfStar = (totalRating % 1 >= 0.5) ? '☆' : '';
                const emptyStars = '☆'.repeat(4 - Math.floor(totalRating));
                $('.rating-summary .stars').html(`${fullStars}${halfStar}${emptyStars}`);
            });

            function toggleLikeDislike(type, reviewId) {
                const userId = '<%= session.getAttribute("userId") %>';
                if (!userId) {
                    alert('로그인이 필요한 기능입니다.');
                    return;
                }

                $.ajax({
                    url: 'ToggleLikeDislikeServlet',
                    type: 'POST',
                    data: { type: type, reviewId: reviewId, userId: userId },
                    success: function(response) {
                        $(`#likeCount${reviewId}`).text(response.likes);
                        $(`#dislikeCount${reviewId}`).text(response.dislikes);
                        if (type === 'like') {
                            $(`#likeBtn${reviewId}`).toggleClass('selected', response.liked);
                            $(`#dislikeBtn${reviewId}`).removeClass('selected');
                        } else {
                            $(`#dislikeBtn${reviewId}`).toggleClass('selected', response.disliked);
                            $(`#likeBtn${reviewId}`).removeClass('selected');
                        }
                    }
                });
            }
        });
    </script>
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
                <a href="#">동아리</a>
            </nav>
            <div class="header-right">
                <div class="search-bar">
                    <input type="search" class="keyword" placeholder="찾으시는 동아리가 있나요?">
                    <button class="submit">
                        <img src="search.png" alt="Search">
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
                <img src="caps_logo.png" alt="${clubName} Logo">
                <div class="site-name">
                    <div class="large-text">${clubName}</div> 
                    <div class="small-text">${memberCount}명 이상</div>
                </div>
            </div><br>
            <h3>인기 리뷰</h3>
            <div class="review">
               <c:forEach var="review" items="${reviews}">
				    <div class="review">
				        <p>${review.content}</p>
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
                    <h3><c:out value="${totalRating}" /></h3>
                    <div class="stars"><c:out value="${totalStars}" /></div>
                </div>
                <div class="divider"></div>
                <div class="category-ratings">
                    <p><c:out value="${categoryRatings.분위기}" />★ 분위기</p>
                    <p><c:out value="${categoryRatings.운영}" />★ 운영</p>
                    <p><c:out value="${categoryRatings.활동}" />★ 활동</p>
                </div>
            </div>
            
            <ul class="review-list">
                <c:forEach var="review" items="${reviews}">
                    <li class="review-item" data-review-id="${review.id}">
                        <div class="review-header">
                            <span class="review-rating">${review.rating} ★</span>
                            <strong>${review.title}</strong>
                        </div>
                        <p class="review-author">${review.author}</p>
                        <p class="review-content">${review.content}</p>
                        <div class="review-controls">
                            <span class="like" id="likeBtn${review.id}" onclick="toggleLikeDislike('like', ${review.id})">좋아요 👍</span> <span id="likeCount${review.id}">${review.likes}</span>
                            <span class="dislike" id="dislikeBtn${review.id}" onclick="toggleLikeDislike('dislike', ${review.id})">싫어요 👎</span> <span id="dislikeCount${review.id}">${review.dislikes}</span>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </section>
    </main>
</body>
</html>