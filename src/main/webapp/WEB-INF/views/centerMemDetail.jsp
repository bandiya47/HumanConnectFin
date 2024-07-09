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
            <li><a href="${pageContext.request.contextPath}/adminNoticeList.do">고객센터</a></li>
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
