<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .contact-list {
            list-style-type: none;
            padding-left: 0;
            text-align: center;
        }
    </style>
<body>
<div class="center-content">
		<img src="${pageContext.request.contextPath}/img/logo.png" style="margin:0 auto;" width="300px" alt="로고" onclick="goIndex()">

		<h3>보호센터 가입 문의 연락처</h3>

        <ul class="contact-list">
		    <li>HP : 000-0000-0000</li>
		    <li>E-Mail : example@gmail.net</li>
        </ul>
</body>
</html>