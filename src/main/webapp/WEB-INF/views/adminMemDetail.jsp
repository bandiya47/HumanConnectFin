<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 상세 정보</title>
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
            <li class="active"><a href="${pageContext.request.contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/adminCenterMem">센터회원정보 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/adminNoticeList.do">고객센터</a></li>
        </ul>
    </div>
    <div class="adminMemDetailContent">
        <h1>회원 상세 정보</h1>
        <div class="adminMemDetailDetails-box">
            <table>
                <tr>
                    <td>이름</td>
                    <td colspan="2"><input type="text" id="u_name" value="${member.u_name}"></td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td colspan="2"><input type="text" id="u_id" value="${member.u_id}" readonly></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td colspan="2"><input type="text" id="u_pwd" value="${member.u_pwd}"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" id="u_addr1" value="${member.u_addr1}"></td>
                    <td><input type="text" id="u_addr2" value="${member.u_addr2}"></td>
                </tr>
                <tr>
                    <td>휴대폰 번호</td>
                    <td colspan="2"><input type="text" id="u_phone" value="${member.u_phone}"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td colspan="2"><input type="text" id="u_email" value="${member.u_email}"></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td colspan="2"><input type="text" id="u_sex" value="${member.u_sex}"></td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td colspan="2"><input type="text" id="u_bdate" value="${member.u_bdate}"></td>
                </tr>
            </table>
        </div>
        <div class="adminMemDetailActionButtons">
            <button type="button" class="updateButton" onclick="updateMember()">수정</button>
            <button type="button" class="deleteButton" onclick="deleteMember('${member.u_id}')">삭제</button>
        </div>
    </div>
</div>
<script>
    function updateMember() {
        const u_id = document.getElementById("u_id").value;
        const u_name = document.getElementById("u_name").value;
        const u_pwd = document.getElementById("u_pwd").value;
        const u_addr1 = document.getElementById("u_addr1").value;
        const u_addr2 = document.getElementById("u_addr2").value;
        const u_phone = document.getElementById("u_phone").value;
        const u_email = document.getElementById("u_email").value;
        const u_sex = document.getElementById("u_sex").value;
        const u_bdate = document.getElementById("u_bdate").value;

        const form = document.createElement('form');
        form.method = 'post';
        form.action = `${contextPath}/updateMember`;

        const inputs = { u_id, u_name, u_pwd, u_addr1, u_addr2, u_phone, u_email, u_sex, u_bdate };

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

    function deleteMember(u_id) {
        if (confirm("정말로 회원을 삭제하시겠습니까?")) {
            const form = document.createElement('form');
            form.method = 'post';
            form.action = `${contextPath}/deleteMember`;
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'u_id';
            input.value = u_id;
            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        }
    }
</script>
</body>
</html>
