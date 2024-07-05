<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 상세 정보</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .adminMemDetailBody {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
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
            width: 20%;
            height: 100vh;
            border-right: 1px solid #000;
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
        }

        .adminMemDetailContent h1 {
            font-size: 24px;
            font-weight: bold;
            margin: 10px auto;
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
    </style>
</head>
<body class="adminMemDetailBody">
<header class="adminMemDetailHeader">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고">
</header>
<div class="adminMemDetailContainer">
    <div class="adminMemDetailSidebar">
        <h3>관리자 페이지</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li><a href="#">센터회원정보 조회</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>
    </div>
    <div class="adminMemDetailContent">
        <h1>회원 상세 정보</h1>
        <div class="adminMemDetailDetails-box">
            <table>
                <tr>
                    <td>이름</td>
                    <td colspan="2"><input type="text" value="${member.u_name}"></td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td colspan="2"><input type="text" value="${member.u_id}" readonly></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td colspan="2"><input type="text" value="${member.u_pwd}"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" value="${member.u_addr1}"></td>
                    <td><input type="text" value="${member.u_addr2}"></td>
                </tr>
                <tr>
                    <td>휴대폰 번호</td>
                    <td colspan="2"><input type="text" value="${member.u_phone}"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td colspan="2"><input type="text" value="${member.u_email}"></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td colspan="2"><input type="text" value="${member.u_sex}"></td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td colspan="2"><input type="text" value="${member.u_bdate}"></td>
                </tr>
            </table>
        </div>
        <div class="adminMemDetailActionButtons">
            <button onclick="window.history.back()">뒤로</button>
        </div>
    </div>
</div>
</body>
</html>
