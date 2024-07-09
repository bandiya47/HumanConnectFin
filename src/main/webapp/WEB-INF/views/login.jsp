<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script>
        function goIndex() {
            window.location.href = "index";
        }
        function showPopup() { window.open("loginPopup", "a", "width=400, height=300, left=0, top=50"); }
        function idPopup() { window.open("loginPopup", "a", "width=400, height=300, left=0, top=50"); }
        function showAlert(msg) {
            alert(msg);
        }
    </script>
</head>
<body class="loginBody">
    <main class="loginMain">
        <img src="./img/logo.png" width="450px" alt="로고" onclick="goIndex()">
        <div class="loginContainer">
            <c:if test="${not empty errorMessage}">
                <script>
                    showAlert("${errorMessage}");
                </script>
            </c:if>
            <form action="login" method="post">
                <div class="loginInput">
                    <label for="userId"></label>
                    <input type="text" id="userId" name="userId" placeholder="아이디" required>
                </div>
                <div class="loginInput">
                    <label for="password"></label>
                    <input type="password" id="password" name="password" placeholder="비밀번호" required>
                </div>
                <div>
                    <button class="loginBtn" type="submit">로그인</button>
                </div>
            </form>
            <div class="loginOpt">
                <form action="join" method="get">
                    <button class="loginRegBtn" type="submit"> 회원가입</button>
                </form>
                <form action="join" method="get">
                    <button class="loginRegBtn" type="submit"> 비밀번호 찾기 |</button>
                </form>
                <button class="loginRegBtn" onclick="idPopup();">| 아이디 찾기 |</button>
                <input type="button" value="보호소 가입" onclick="showPopup();" style="width:80px;border:none;background-color:#FDECCB;margin-right:-75px"/>
            </div>
        </div>
    </main>
</body>
</html>