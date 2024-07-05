<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자용 페이지</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .adminMainBody {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: white;
        }

        .adminMainHeader {
            display: flex;
            justify-content: center;
            border-bottom: 1px solid #000;
            align-items: center;
            padding: 10px 0;
        }

        .adminMainHeader img {
            width: 280px; /* 로고 크기 */
            height: 100px;
            cursor: pointer;
        }

        .adminMainContainer {
            display: flex;
            width: 100%;
            margin: 0 auto;
        }

        .adminMainSidebar {
            width: 180px;
            height: 100vh;
            border-right: 1px solid #000;
            padding: 20px 0;
            box-sizing: border-box;
        }

        .adminMainSidebar h3 {
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            font-size: 30px;
        }

        .adminMainSidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .adminMainSidebar li {
            margin: 0 auto;
            padding: 20px 0;
            border-top: 1px solid #ccc;
            text-align: center;
        }

        .adminMainSidebar li a {
            text-decoration: none;
            color: #000;
            display: block;
        }
        .adminMainSidebar li:last-child {
            border-bottom: 1px solid #ccc;
        }
        .adminMainSidebar li:hover, .adminMainSidebar li.active {
            background-color: #e0e0e0;
        }

        .adminMainSidebar .adminMainSubmenu {
            background-color: #fff;
            margin: 0 auto;
            padding: 0;
            border: none;
        }

        .adminMain1Sidebar .submenu li {
            background-color: #f0f0f0;
            margin: 0;
            padding: 10px;
            border: none;
            border-bottom: 1px solid #ccc;
        }

        .adminMainSidebar .adminMainSubmenu li:last-child {
            border-bottom: none;
        }

        .adminMainSidebar .adminMainSubmenu li a {
            text-decoration: none;
            color: #000;
            display: block;
        }

        .adminMainContent {
            flex: 1;
            padding: 10px;
        }

        .adminMainContent h1 {
            font-size: 24px;
            font-weight: bold;
        }

        .adminMainSearch-box {
            text-align: right;
            margin-bottom: 20px;
        }

        .adminMainSearch-box input[type="text"] {
            padding: 5px;
            width: 200px;
        }

        .adminMainSearch-box input[type="submit"] {
            padding: 5px 10px;
        }

        .adminMainTableContainer {
            width: 100%;
            overflow-x: auto; /* 가로 스크롤 추가 */
            border: 1px solid #000;
        }

        .adminMainTableContainer table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .adminMainTableContainer table, .adminMainTableContainer th, .adminMainTableContainer td {
            border: 1px solid #000;
        }
        .adminMainTableContainer th {
            background-color : #204160;
            vertical-align : middle;
            color : white;
            font-weight : bold;
            padding : 15px;
        }
        .adminMainTableContainer th, .adminMainTableContainer td {
            padding: 10px;
            text-align: center;
            word-break: break-word;
        }

        .adminMainPagination {
            text-align: center;
            margin-top: 20px;
        }

        .adminMainPagination a {
            margin: 0 5px;
            padding: 5px 10px;
            text-decoration: none;
            border: 1px solid #000;
        }

        .adminMainPagination a.active {
            background-color: #000;
            color: #fff;
        }
    </style>
</head>
<body class="adminMainBody">
<header class="adminMainHeader">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고">
</header>
<div class="adminMainContainer">
    <div class="adminMainSidebar">
        <h3>관리자<br>페이지</h3>
        <ul>
            <li class="active"><a href="#">봉사회원정보 조회</a></li>
            <li><a href="#">센터회원정보 조회</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>
    </div>
    <div class="adminMainContent">
        <h1>봉사회원 정보 조회</h1>
        <div class="adminMainSearch-box">
            <form action="adminMainSearchMember" method="get">
                <input type="text" name="searchQuery" placeholder="검색어 입력">
                <input type="submit" value="검색">
            </form>
        </div>
        <div class="adminMainTableContainer">
            <table>
                <thead>
                    <tr>
                        <th width="5%">No</th>
                        <th width="10%">이름</th>
                        <th width="10%">아이디</th>
                        <th width="15%">휴대폰 번호</th>
                        <th width="15%">이메일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="member" items="${memberList}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td><a href="adminMemDetail?u_id=${member.u_id}">${member.u_name}</td>
                            <td>${member.u_id}</td>
                            <td>${member.u_phone}</td>
                            <td>${member.u_email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="adminMainPagination">
            <c:forEach var="page" begin="1" end="${totalPages}">
                <a href="?page=${page}" class="${currentPage == page ? 'active' : ''}">${page}</a>
            </c:forEach>
        </div>
        <div class="adminMainActionButtons">
            <button onclick="updateMembers()">수정</button>
            <button onclick="deleteMembers()">삭제</button>
        </div>
    </div>
</div>
<script>
    function updateMembers() {
        // 회원 수정 로직
    }

    function deleteMembers() {
        // 회원 삭제 로직
    }
</script>
</body>
</html>
