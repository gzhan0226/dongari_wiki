<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동동</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
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
            max-width: 600px;
            margin: 20px auto auto auto;
            background: #fff;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group-inline input[type="radio"] {
            display: none;
        }
        .form-group-inline label {
            background: #ddd;
            color: #333;
            padding: 7px 12px;
            border-radius: 10px;
            margin: 5px;
            cursor: pointer;
        }
        .form-group-inline input[type="radio"]:checked + label {
            background: orange;
        }
        .form-button {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 30px;
        }
        .delete-button {
            display: flex;
            gap: 10px;
            justify-content: flex-start;
            margin-top: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        .description {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        input[type="number"], input[type="date"]{
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        .form-group-inline-file {
            display: flex; 
            align-items: center; 
            gap: 10px; 
        }
        input[type="file"]::file-selector-button {
            background: #333;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px;
        }
        input[type="file"]::file-selector-button:hover {
            color: orange;
        }
        .description {
            resize: none;
            height: 100px;
        }
        .form-group-inline {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .form-group-inline input[type="radio"] {
            margin-right: 5px;
        }
        button {
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background: #ccc;
        }
        button[type="submit"] {
            background-color: orange;
            color: white;
        }
        button[type="reset"] {
            background-color: #ccc;
            padding: 10px 15px;
        }
        .form-button button{
        	padding: 10px 15px;
        }
        .delete-button button {
            background-color: #fff;
            border: 1px solid #333;
            padding: 10px 15px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // 멤버 수 입력 숫자만 허용
            const memberInput = document.getElementById('currentMembers');
            if (memberInput) {
                memberInput.addEventListener('input', event => {
                    const input = event.target;
                    input.value = input.value.replace(/[^0-9]/g, '');
                });
            }
    
            // 모집 상태에 따라 모집 기간 활성화/비활성화
            const applyStatusRadios = document.querySelectorAll('input[name="apply_status"]');
            const startInput = document.querySelector('input[name="apply_start"]');
            const endInput = document.querySelector('input[name="apply_end"]');
    
            function toggleRecruitmentPeriod() {
                const selectedStatus = document.querySelector('input[name="apply_status"]:checked').value;
                if (selectedStatus === "1") {
                    startInput.disabled = false;
                    endInput.disabled = false;
                } else {
                    startInput.disabled = true;
                    endInput.disabled = true;
                    startInput.value = "";
                    endInput.value = "";
                }
            }
    
            applyStatusRadios.forEach(radio => radio.addEventListener('change', toggleRecruitmentPeriod));
            toggleRecruitmentPeriod();

            // 삭제 버튼 클릭 시 확인 메시지
            const deleteButton = document.querySelector('button[onclick="sendDelete()"]');
            if (deleteButton) {
                deleteButton.addEventListener('click', () => {
                    if (confirm('정말로 삭제하시겠습니까?')) {
                        // 삭제 로직 실행
                        console.log('삭제 처리 실행'); // 이 부분을 실제 삭제 처리로 변경
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
        <form action="${type}" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <div class="form-group-inline-file">
                    <label for="image">동아리 소개 이미지</label>
                    <input type="file" id="image" name="clubImage">
                    <input type="hidden" name="existingImage" value="${dongari.img}">
                </div>
            </div>
            <div class="form-group">
                <label for="name">동아리명 *</label>
                <input type="text" value="${dongari.title}" name="title" required>
            </div>
            <div class="form-group">
                <label for="summary">동아리 요약 (15자) *</label>
                <input type="text" value="${dongari.summary}" name="summary" maxlength="15" required>
            </div>
            <div class="form-group">
                <label for="description">동아리 설명 *</label>
                <textarea class="description" name="body" required>${dongari.body}</textarea>
            </div>
            <div class="form-group">
                <label for="currentMembers">현재 부원 수</label>
                <input type="number" value="${dongari.member_num}" name="member_num" min="1">
            </div>
            <div class="form-group">
                <label>모집 상태</label>
                <div class="form-group-inline">
                    <input type="radio" name="apply_status" value="1" id="recruiting" checked>
                    <label for="recruiting">모집 중</label>
                    <input type="radio" name="apply_status" value="2" id="always-recruiting">
                    <label for="always-recruiting">상시모집</label>
                    <input type="radio" name="apply_status" value="3" id="recruitment-closed">
                    <label for="recruitment-closed">모집 완료</label>
                </div>
            </div>
            <div class="form-group">
                <label for="recruitmentPeriod">모집 기간 (한글로 입력 ex. 9월 11일)</label>
                <div class="form-group-inline">
                    <input type="date" value="${dongari.apply_start}" name="apply_start" placeholder="시작일">
                    <span>~</span>
                    <input type="date" value="${dongari.apply_end}" name="apply_end" placeholder="종료일">
                </div>
            </div>
            <div class="form-group">
                <label for="apply_link">지원 링크</label>
                <input type="text" value="${dongari.apply_link}" name="apply_link">
            </div>
            <div class="form-group">
                <label for="sns_link">동아리 SNS 링크</label>
                <input type="text" value="${dongari.sns_link}" name="sns_link">
            </div>
            <div class="form-group">
                <label for="location">동아리방 위치</label>
                <input type="text" value="${dongari.location}" name="location">
            </div>
            <input type="hidden" value="${dongari.category_id}" name="category_id">
	        <input type="hidden" value="${dongari.id}" name="id">
            <div class="form-button">
                <button type="submit">저장</button>
                <button type="reset">취소</button>
            </div>
        </form>
        <div class="delete-button">
            <button onclick="sendDelete()">삭제하기</button>
        </div>
    </div>
</body>
</html>
