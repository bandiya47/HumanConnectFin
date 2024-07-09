<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>센터 회원 상세 정보</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        html, body {
            background-color: white !important;
        }
        .adminMemDetailBody {
            font-family: Arial, sans-serif;
            margin: 0 auto;
            padding: 0;
            background-color: white;
            width: 1250px;
        }

        .adminMemDetailHeader {
            display: flex;
            justify-content: center;
            border-bottom: 1px solid #000;
            align-items: center;
            padding: 10px 0;
        }

        .adminMemDetailHeader img {
            width: 280px; /* 로고 크기 */
            height: 100px;
            cursor: pointer;
        }

        .adminMemDetailContainer {
            display: flex;
            width: 100%;
            margin: 0 auto;
        }

        .adminMemDetailSidebar {
            width: 180px;
            height: 100vh;
            border-right: 1px solid #000;
            border-left: 1px solid #000;
            padding: 20px 0;
            box-sizing: border-box;
        }

        .adminMemDetailSidebar h3 {
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            font-size: 30px;
        }

        .adminMemDetailSidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .adminMemDetailSidebar li {
            margin: 0 auto;
            padding: 20px 0;
            border-top: 1px solid #ccc;
            text-align: center;
        }

        .adminMemDetailSidebar li a {
            text-decoration: none;
            color: #000;
            display: block;
        }

        .adminMemDetailSidebar li:last-child {
            border-bottom: 1px solid #ccc;
        }

        .adminMemDetailSidebar li:hover, .adminMemDetailSidebar li.active {
            background-color: #e0e0e0;
        }

        .adminMemDetailSidebar .adminMemDetailSubmenu {
            background-color: #fff;
            margin: 0 auto;
            padding: 0;
            border: none;
        }

        .adminMemDetailSidebar .adminMemDetailSubmenu li {
            background-color: #f0f0f0;
            margin: 0;
            padding: 10px;
            border: none;
            border-bottom: 1px solid #ccc;
        }

        .adminMemDetailSidebar .adminMemDetailSubmenu li:last-child {
            border-bottom: none;
        }

        .adminMemDetailSidebar .adminMemDetailSubmenu li a {
            text-decoration: none;
            color: #000;
            display: block;
        }

        .adminMemDetailContent {
            flex: 1;
            padding: 10px;
            border-right: 1px solid #000;
        }

        .adminMemDetailContent h1 {
            font-size: 24px;
            font-weight: bold;
            margin: 10px auto;
            text-align: center;
        }

        .adminMemDetailDetails-box {
            padding: 20px;
            margin-bottom: 20px;
        }

        .adminMemDetailDetails-box label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .adminMemDetailDetails-box .info {
            margin-bottom: 10px;
        }

        .adminMemDetailDetails-box table {
            width: 100%;
            border-collapse: collapse;
        }

        .adminMemDetailDetails-box table, th, td {
            border: 1px solid #000;
        }

        .adminMemDetailDetails-box th, td {
            padding: 10px;
            text-align: left;
        }

        .adminMemDetailDetails-box input[type="text"] {
            width: 100%;
            border: none;
            border-bottom: 1px solid #ccc;
            padding: 5px;
            box-sizing: border-box;
        }

        .adminMemDetailActionButtons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .adminMemDetailActionButtons button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            background-color: #2b5d7c; /* 어드민 메인 페이지와 어울리도록 색상 변경 */
            color: white;
        }

        .adminMemDetailActionButtons button:hover {
            background-color: #204160; /* 어드민 메인 페이지와 어울리도록 색상 변경 */
        }
    </style>
</head>
<body class="adminMemDetailBody">
<header class="adminMemDetailHeader">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고">
</header>
<div class="adminMemDetailContainer">
    <div class="adminMemDetailSidebar">
        <h3>관리자<br>페이지</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/adminCenterMem">센터회원정보 조회</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>
    </div>
    <div class="adminMemDetailContent">
        <h1>센터 회원 상세 정보</h1>
        <div class="adminMemDetailDetails-box">
            <table>
                <tr>
                    <td>이름</td>
                    <td colspan="2"><input type="text" id="c_name" value="${centerMember.c_name}"></td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td colspan="2"><input type="text" id="c_id" value="${centerMember.c_id}"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td colspan="2"><input type="text" id="c_pwd" value="${centerMember.c_pwd}"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" id="c_addr1" value="${centerMember.c_addr1}"></td>
                    <td><input type="text" id="c_addr2" value="${centerMember.c_addr2}"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td colspan="2"><input type="text" id="c_phone" value="${centerMember.c_phone}"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td colspan="2"><input type="text" id="c_email" value="${centerMember.c_email}"></td>
                </tr>
                <input type="hidden" id="oldCId" name="oldCId" value="${centerMember.c_id}">
            </table>
        </div>
        <div class="adminMemDetailActionButtons">
            <button type="button" class="updateButton" onclick="updateCenterMember('${centerMember.c_id}')">수정</button>
                        <button type="button" class="deleteButton" onclick="deleteCenterMember('${centerMember.c_id}')">삭제</button>
        </div>
    </div>
</div>
<script>
    function updateCenterMember() {
        const oldCId = document.getElementById("oldCId").value;
        const c_id = document.getElementById("c_id").value;
        const c_name = document.getElementById("c_name").value;
        const c_pwd = document.getElementById("c_pwd").value;
        const c_addr1 = document.getElementById("c_addr1").value;
        const c_addr2 = document.getElementById("c_addr2").value;
        const c_phone = document.getElementById("c_phone").value;
        const c_email = document.getElementById("c_email").value;

        const form = document.createElement('form');
        form.method = 'post';
        form.action = `${contextPath}/updateCenterMember`;

        const inputs = { oldCId, c_id, c_name, c_pwd, c_addr1, c_addr2, c_phone, c_email };

        for (const name in inputs) {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = name;
            input.value = inputs[name];
            form.appendChild(input);
        }

        document.body.appendChild(form);
        form.submit();
    }
</script>
</body>
</html>
