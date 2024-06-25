<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script>
    	function goIndex() {
    		window.location.href = "index";
    	}
    </script>
</head>
<body class="loginBody">
	<main class="loginMain">
		<img src="${pageContext.request.contextPath}/img/logo.png" width="450px" alt="로고" onclick="goIndex()">
		<div class="loginContainer">
		    <form action="login" method="post">
		        <div class="loginInput">
		            <label for="userId"></label>
		            <input type="text" id="userId" name="userId" placeholder="아이디" required>
		        </div>
		        <div class="loginInput">
		            <label for="password"></label>
		            <input type="password" id="password" name="password" placeholder="비밀번호"required>
		        </div>
		        <div>
		            <button class="loginBtn" type="submit">로그인</button>
		            </form>
		                <div class="loginOpt">
		                    <form action="join" method="get">
		                        <button class="loginRegBtn" type="submit"> 회원가입</button>
		                    </form>
		                    <form action="join" method="get">
		                        <button class="loginRegBtn" type="submit"> 비밀번호 찾기 |</button>
		                    </form>
		                    <form action="join" method="get">
		                        <button class="loginRegBtn" type="submit">아이디 찾기 |</button>
		                    </form>
		                </div>
		       	</div>
		       </form>
		      </div>
	    </main>
</body>
</html>