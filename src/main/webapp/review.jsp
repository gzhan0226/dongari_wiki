<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            const button = $(this); // 현재 클릭된 버튼
            const dongari_id = button.data('dongari-id'); // 동아리 ID
            const scrapCheck = $(this).data('scrapcheck'); // 스크랩 상태
            // AJAX POST 요청 (파라미터 형식으로 전송)
            $.ajax({
                url: '/web_programming/scraps', 
                type: 'POST', // POST 방식
                data: { dongari_id: dongari_id },
                success: function () {
                    if (scrapCheck) {
                        button.removeClass('scraped'); // 스크랩 상태 스타일 제거
                        alert('스크랩이 취소되었습니다.'); 
                    } else {
                        button.addClass('scraped'); // 스크랩 상태 스타일 추가
                        alert('스크랩 되었습니다.');
                    }
                    location.reload();
                },
                error: function (xhr, status, error) {
                    console.error('스크랩 요청 실패:', error);
                    alert('스크랩 요청 처리 중 오류가 발생했습니다.');
                }
            });
        });

        // 페이지 로드 시 기존 스크랩 상태에 따라 별 색상 초기화
        $('.scrap-btn').each(function () {
            if ($(this).data('scrapcheck')) {
                $(this).addClass('scraped');
            }
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
                <a href="./">홈</a> 
                <a href="./all" class="active">동아리</a>
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

    <main>
        <section class="club-info">
            <div class="logo-container">
                <img src="./assets/caps_logo.png" alt="${dongari.title} Logo">
                <div class="site-name">
                    <div class="large-text">${dongari.title}</div> 
                    <div class="small-text">${dongari.member_num}명 이상</div>
                </div>
                <div class="scrap-btn" data-dongari-id="${dongari.id}" data-scrapcheck="${scrapCheck}">
                	<div class="scrap">★</div>
                </div>
            </div><br>
            <h3>인기 리뷰</h3>
            <div class="club-review">
               <c:forEach var="review" items="${reviews}">
				    <div class="review">
				        <p>${review.body}</p>
				    </div>
				</c:forEach>
            </div>
            <div class="write">
                <button class="write-button"><a href="newreview?id=${dongari.id}">리뷰쓰기</a></button>
            </div>
        </section>

        <section class="reviews">
          	<div class="ratings">
			    <div class="rating-summary">
			        <h3>
			            <fmt:formatNumber value="${total}" type="number" maxFractionDigits="1" />
			        </h3>
			        <div class="stars">
				        <c:forEach begin="1" end="5" var="star">
				            <c:choose>
				                <c:when test="${star <= total}">
				                    ★
				                </c:when>
				                <c:when test="${star - 1 < total && star > total}">
				                    ☆
				                </c:when>
				                <c:otherwise>
				                    ☆
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				    </div>
			    </div>
			    <div class="divider"></div>
			    <div class="category-ratings">
			    	<h4>항목별 평점</h4>
			        <p><b>★<fmt:formatNumber value="${atm}" type="number" maxFractionDigits="1" /></b>&nbsp;&nbsp;&nbsp;분위기</p>
			        <p><b>★<fmt:formatNumber value="${act}" type="number" maxFractionDigits="1" /></b>&nbsp;&nbsp;&nbsp;활동</p>
			        <p><b>★<fmt:formatNumber value="${man}" type="number" maxFractionDigits="1" /></b>&nbsp;&nbsp;&nbsp;운영</p>
			    </div>
			</div>
            <ul class="review-list">
   				<c:forEach var="review" items="${reviews}">
        		<li class="review-item" data-review-id="${review.id}" onclick="location.href='editreview?id=${dongari.id}&review_id=${review.id}'">
	            	<div class="review-header">
		                <span class="review-rating">
		                	<fmt:formatNumber value="${review.total_rating}" type="number" maxFractionDigits="1" /><br>
							<c:forEach begin="1" end="5" var="star">
					            <c:choose>
					                <c:when test="${star <= review.total_rating}">
					                    ★
					                </c:when>
					                <c:when test="${star - 1 < review.total_rating && star > review.total_rating}">
					                    ☆
					                </c:when>
					                <c:otherwise>
					                    ☆
					                </c:otherwise>
					            </c:choose>
					        </c:forEach>
		                </span>
		            </div>
		            <div class ="review-body">
			            <strong class="review-title">"${review.title}"</strong>
			            <p class="review-author">${review.username}</p>
			            <p class="review-content">${review.body}</p>
			            <div class="review-controls">
			                <span class="like-btn" data-review-id="${review.id}" data-likecheck="${review.likeCheck}">👍</span>
			                <span id="likeCount${review.id}">${review.likeCount}</span>
			            </div>
		            </div>
        		</li>
    			</c:forEach>
			</ul>
        </section>
        <aside class="sidebars">
            <h3>비슷한 동아리</h3>
            <div class="sidebar">
	            <ul>
	            <li class="club-item">
                    <div class="text-container">
                        <a href="#">멋쟁이사자처럼</a>
                    </div>
                </li>
                <li class="club-item">
                    <div class="text-container">
                        <a href="#">DNA</a>
                    </div>
                </li>
                </ul>
            </div>
            
            <div class="apply">
			    <c:choose>
				    <c:when test="${dongari.apply_start eq 'None'}">
				        <p>상시 모집 중입니다!</p><br>
				        <button onclick="checkApplyLink('${dongari.apply_link}')">
				            지원하기
				        </button>
				    </c:when>
				    <c:when test="${dongari.apply_start eq '9999'}">
				        <p>모집이 완료되었습니다.</p><br>
				        <button onclick="alert('지원 기간이 아닙니다.');">지원하기</button>
				    </c:when>
				    <c:otherwise>
				        <p>동아리 지원 기간</p>
				        <p>${dongari.apply_start} ~ ${dongari.apply_end}</p><br>
				        <button onclick="checkApplyLink('${dongari.apply_link}')">
				            지원하기
				        </button>
				    </c:otherwise>
				</c:choose>
				
				<script>
				    function checkApplyLink(link) {
				        if (link === 'None' || link.trim() === '') {
				            alert('지원 링크가 존재하지 않습니다.');
				        } else {
				            window.location.href = link; // 링크가 올바르면 해당 링크로 이동
				        }
				    }
				</script>
			</div>
        </aside>
    </main>
</body>
</html>
