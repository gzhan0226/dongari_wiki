<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: white;
            padding: 1em 0;
            display: flex;
            justify-content: center;
        }

        .header-content {
            width: 1200px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo-container img {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }

        .site-name .small-text {
            font-size: 12px;
        }

        .site-name .large-text {
            font-size: 22px;
            font-weight: bold;
        }

        nav a {
            color: #ccc;
            margin: 0 10px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }

        nav a.active {
            color: orange;
        }
		nav a.deactive:hover{
			color: orange;
		}
        .search-bar {
            position: relative;
            width: 250px;
            max-width: 250px;
            border-radius: 40px;
            background: #FFF;
            margin-right: 5px;
        }

        .search-bar .keyword {
            width: 100%;
            padding: 0.5em 1em;
            border: 1px solid #fff;
            border-radius: 20px;
            padding-right: 3em; /* 버튼 영역 확보 */
            font-size: 14px;
        }

        .search-bar .submit {
            position: absolute;
            right: 15px; /* 입력 박스 안쪽의 위치 */
            top: 55%;
            transform: translateY(-50%);
            color: #fff;
            border: none;
            cursor: pointer;
            background-color: #fff;
            padding: 0;
        }

        .search-bar .submit img{
            width: 20px;
            height: auto;
        }

        .user-menu a {
            border-radius: 10px;
            border: 1px solid #EFEDEB;
            color: #fff;
            padding: 0.5em 1em;
            margin-left: 5px;
            text-decoration: none;
        }

        .container {
            max-width: 1000px;
            margin: 20px auto auto auto;
            padding: 50px;
        }

        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        textarea {
            resize: none;
            height: 100px;
        }
        .form-button {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        button {
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"] {
            background-color: orange;
            color: white;
            padding: 10px 15px;
        }
        button[type="reset"] {
            background-color: #ccc;
            padding: 10px 15px;
        }
	    input[disabled], textarea[disabled] {
	        background-color: #fff;
	        color: #ccc;
	        border: 1px solid #ccc;
	        cursor: not-allowed;
	    }
	
	    input[disabled]::selection, textarea[disabled]::selection {
	        background-color: transparent;
	    }
    </style>
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

    <div class="container">
        <form action="reply" method="post">
            <div class="form-group">
                <label for="club-name">동아리명</label>
                <input type="text" id="club-name" value="${dongari.title}" readonly/>
            </div>
            <div class="form-group">
                <label for="question-title">질문 제목</label>
                <input type="text" id="question-title" name="title" value="${question.title}"readonly/>
            </div>
            <div class="form-group">
                <label for="question-content">질문 내용</label>
                <textarea id="question-content" name="body" readonly>${question.body}</textarea>
            </div>
            <div class="form-group">
                <label for="question-content">답변 내용</label>
                <textarea id="question-content" name="reply">${question.answer}</textarea>
            </div>
            <input type="hidden" name="id" value="${dongari.id}"/>
            <input type="hidden" name="question_id" value="${question.id}"/>
            <div class="form-button">
                <button type="submit">올리기</button>
                <button type="reset">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
