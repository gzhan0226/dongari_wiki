<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>동국대학교 동아리 위키 - 동동</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f3f3f3;
        }

        .container {
            width: 100%;
            height: 100%;
            display: flex;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .left-panel {
            background-color: #f3f3f3;
            width: 40%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }

        .logo-container {
            background-color: #333;
            width: 100%;
            height: 15%;
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            position: left;
        }

        .logo-container img {
            width: 50px;
            margin-right: 10px;
            margin-left: 30px;
        }

        .logo-container .site-name {
            color: #f3f3f3;
        }

        .logo-container .site-name .small-text {
            font-size: 12px;
            font-weight: normal;
        }

        .logo-container .site-name .large-text {
            font-size: 22px;
            font-weight: bold;
        }

        .left-panel p {
            font-size: 17px;
            color: #666;
            text-align: center;
            margin-bottom: 20px;
        }

        .hello-container img {
            width: 40vw;
            max-width: 100%;
            height: auto;
            margin-top: auto;
            position: relative;
            bottom: 0;
        }

        .right-panel {
            width: 60%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-form {
            max-width: 600px;
            background-color: #f3f3f3;
            width: 50%;
            height: 50%;
            display: flex;
            flex-direction: column;
            position: relative;
            text-align: left;
            padding: 100px;
            justify-content: center;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-form button {
            width: 20%;
            padding: 12px;
            margin: 10px 0;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-form button:hover {
            background-color: #555;
        }

        .login-form b {
            text-align: left;
            margin-bottom: 0;
        }

        .join-button {
            text-align: right;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="left-panel">
        <div class="logo-container">
            <img src="./assets/logo.png" alt="동국대학교 로고">
            <div class="site-name">
                <div class="small-text">동국대학교 동아리 위키</div>
                <div class="large-text">동동</div>
            </div>
        </div>
        <p>여러 동아리를 알아보고<br><b>동아리에 대한 리뷰</b>도 남겨보세요!</p>
        <div class="hello-container">
            <img src="./assets/hello.png" alt="환영 이미지">
        </div>
    </div>
    <div class="right-panel">
        <form class="login-form" action="join" method="post">
            <b>학번</b><input type="text" name="studentnumber" placeholder="학번" required> 
            <b>이름</b><input type="text" name="realname" placeholder="이름" required> 
            <b>아이디</b><input type="text" name="username" placeholder="아이디" required> 
            <b>비밀번호</b><input type="password" name="password" placeholder="비밀번호" required> 
            <div class="join-button"><button type="submit">가입</button></div>
        </form>
    </div>
</div>
</body>
</html>