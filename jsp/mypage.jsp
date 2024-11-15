<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국대학교 동아리 위키</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.page-item').on('click', function (e) {
                if ($(e.target).hasClass('delete-button')) {
                    return;
                }
            });

            $('.delete-button').on('click', function(event) {
                event.preventDefault();
                $(this).closest('.page-item').remove();
            });
        });
    </script>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="logo-container">
                <img src="logo.png" alt="Logo">
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
                        <img src="search.png" alt="Search">
                    </button>
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
        <section class="profile-section">
            <div class="profile-box">
                <div class="profile-user">
                    <img src="user-icon.png" alt="User Icon">
                    <p>아이디</p>
                </div>
                <div class="nav-box">
                    <div class="profile-info">
                        <ul>
                            <li class="my-info">
                                <a href="#">내가 쓴 리뷰</a>
                            </li>
                            <li class="my-info">
                                <a href="#">내가 쓴 질문·답변</a>
                            </li>
                            <li class="my-info">
                                <a href="#">스크랩</a>
                            </li>
                            <li class="my-info">
                                <form action="/web_programming/logout" method="get"><button type="submit">로그아웃</button></form>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="management-section">
                <h2>관리 중인 페이지
                    <a href="#" class="add-button">+</a>
                </h2>
                <div class="managed-pages">
                    <%
                        // 예시 데이터: 실제로는 데이터베이스에서 가져옴
                        List<Map<String, String>> managedPages = new ArrayList<>();
                        Map<String, String> page1 = new HashMap<>();
                        page1.put("title", "NSA");
                        page1.put("category", "학술분과");
                        page1.put("icon", "nsa-icon.png");
                        managedPages.add(page1);

                        Map<String, String> page2 = new HashMap<>();
                        page2.put("title", "페인터즈");
                        page2.put("category", "봉사분과");
                        page2.put("icon", "painters-icon.png");
                        managedPages.add(page2);

                        for (Map<String, String> pages : managedPages) {
                    %>
                        <div class="page-item">
                            <img src="<%= pages.get("icon") %>" alt="<%= pages.get("title") %> Icon">
                            <a href="#" class="page-info">
                                <p class="page-title"><%= pages.get("title") %></p>
                                <p class="page-category"><%= pages.get("category") %></p>
                            </a>
                            <button class="delete-button">🗑️</button>
                        </div>
                    <% } %>
                </div>
            </div>
        </section>
    </main>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
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

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo-container img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        .site-name .small-text {
            font-size: 12px;
            color: #f3f3f3;
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

        .header-right {
            display: flex;
            align-items: center;
            gap: 5px;
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
            padding-right: 3em;
            font-size: 14px;
        }

        .search-bar .submit {
            position: absolute;
            right: 15px;
            top: 55%;
            transform: translateY(-50%);
            background: none;
            border: none;
        }

        .search-bar .submit img {
            width: 20px;
            height: auto;
        }

        .user-menu a {
            border-radius: 10px;
            border: 1px solid #EFEDEB;
            color: #fff;
            padding: 0.5em 1em;
            text-decoration: none;
        }

        .profile-section {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .profile-box, .management-section {
            background: #FFF;
            padding: 20px;
            margin: 10px;
            width: 600px;
            height: 400px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-user {
            display: flex;
            align-items: center;
        }

        .profile-user img {
            width: 60px;
            height: 60px;
            border-radius: 10%;
            margin-right: 10px;
        }

        .profile-user p {
            font-size: 18px;
            font-weight: bold;
        }

        .nav-box {
            justify-content: center;
            align-content: center;
        }

        .profile-info {
            margin-top: 20px;
        }

        .profile-info ul {
            list-style: none;
        }

        .profile-info ul li {
            font-size: 14px;
            cursor: pointer;
            font-weight: bold;
            padding: 20px;
        }

        .management-section h2 {
            font-size: 18px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .add-button {
            font-size: 24px;
            color: #666;
            text-decoration: none;
            margin-left: auto;
            margin-right: 12px;
            cursor: pointer;
        }

        .managed-pages .page-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            padding: 20px;
            border-radius: 6px;
            background-color: #f4f4f4;
            position: relative;
        }

        .page-item img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        .page-info {
            flex-grow: 1;
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .page-title {
            font-size: 16px;
            font-weight: bold;
        }

        .page-category {
            font-size: 12px;
            color: #666;
        }

        .delete-button {
            background: none;
            border: none;
            font-size: 18px;
            color: #999;
            cursor: pointer;
            position: absolute;
            right: 10px;
        }
        .my-info {
            display: flex;
            align-items: center;
            padding: 10px 15px;
            border-bottom: 1px solid #eee;
        }
        .my-info img {
            width: 20px;
            margin-right: 10px;
            padding: 2px;
            align-content: center;
        }
        .my-info a {
            text-decoration: none;
            color: #333;
        }
    </style>
</body>
</html>