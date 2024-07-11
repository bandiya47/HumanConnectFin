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
        function showPopup() {
            var width = 400;
            var height = 300;
            var left = (window.innerWidth - (width)) / 2 + window.screenX;
            var top = (window.innerHeight - (height)) / 2 + window.screenY;
            window.open("loginPopup", "a", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
        }
        function idPopup() {
            var width = 550;
            var height = 500;
            var left = (window.innerWidth - (width)) / 2 + window.screenX;
            var top = (window.innerHeight - (height)) / 2 + window.screenY;
            window.open("findId", "a", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);IO
        }
        function pwdPopup() {
            var width = 550;
            var height = 500;
            var left = (window.innerWidth - (width)) / 2 + window.screenX;
            var top = (window.innerHeight - (height)) / 2 + window.screenY;
            window.open("viewFindPw.do", "a", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);IO
        }
        function showAlert(msg) {
            alert(msg);
        }

        document.addEventListener("DOMContentLoaded", function() {
            var inputs = document.querySelectorAll("input[required]");

            inputs.forEach(function(input) {
                input.addEventListener("invalid", function(event) {
                    event.target.setCustomValidity("");
                    if (!event.target.validity.valid) {
                        event.target.setCustomValidity(event.target.getAttribute("data-error-message"));
                    }
                });

                input.addEventListener("input", function(event) {
                    event.target.setCustomValidity("");
                });
            });
        });
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
                    <input type="text" id="userId" name="userId" placeholder="아이디" required data-error-message="아이디를 입력해 주세요.">
                </div>
                <div class="loginInput">
                    <label for="password"></label>
                    <input type="password" id="password" name="password" placeholder="비밀번호" required data-error-message="비밀번호를 입력해 주세요.">
                </div>
                <div>
                    <button class="loginBtn" type="submit">로그인</button>
                </div>
            </form>
            <div class="loginOpt">
                <button class="loginRegBtn" onclick="idPopup();">아이디 찾기 |</button>
                <button class="loginRegBtn" onclick="pwdPopup();"> 비밀번호 재설정 |</button>
                <form action="join" method="get">
                   <button class="loginRegBtn" type="submit">회원가입 |</button>
                </form>
                <button class="loginRegBtn" onclick="showPopup();">보호소 가입</button>
            </div>
        </div>
    </main>
</body>
</html>