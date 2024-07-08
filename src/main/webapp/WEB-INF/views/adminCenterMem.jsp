<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>센터회원 정보 조회</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        html, body {
            background-color: white !important;
        }
        .adminCenterMemBody {
            font-family: Arial, sans-serif;
            margin: 0 auto;
            padding: 0;
            background: white;
            width: 1250px;
        }

        .adminCenterMemHeader {
            display: flex;
            justify-content: center;
            border-bottom: 1px solid #000;
            align-items: center;
            padding: 10px 0;
        }

        .adminCenterMemHeader img {
            width: 280px; /* 로고 크기 */
            height: 100px;
            cursor: pointer;
        }

        .adminCenterMemContainer {
            display: flex;
            width: 100%;
            margin: 0 auto;
        }

        .adminCenterMemSidebar {
            width: 180px;
            height: 100vh;
            border-right: 1px solid #000;
            border-left: 1px solid #000;
            padding: 20px 0;
            box-sizing: border-box;
        }

        .adminCenterMemSidebar h3 {
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            font-size: 30px;
        }

        .adminCenterMemSidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .adminCenterMemSidebar li {
            margin: 0 auto;
            padding: 20px 0;
            border-top: 1px solid #ccc;
            text-align: center;
        }

        .adminCenterMemSidebar li a {
            text-decoration: none;
            color: #000;
            display: block;
        }
        .adminCenterMemSidebar li:last-child {
            border-bottom: 1px solid #ccc;
        }
        .adminCenterMemSidebar li:hover, .adminCenterMemSidebar li.active {
            background-color: #e0e0e0;
        }

        .adminCenterMemSidebar .adminCenterMemSubmenu {
            background-color: #fff;
            margin: 0 auto;
            padding: 0;
            border: none;
        }

        .adminCenterMemSidebar .adminCenterMemSubmenu li {
            background-color: #f0f0f0;
            margin: 0;
            padding: 10px;
            border: none;
            border-bottom: 1px solid #ccc;
        }

        .adminCenterMemSidebar .adminCenterMemSubmenu li:last-child {
            border-bottom: none;
        }

        .adminCenterMemSidebar .adminCenterMemSubmenu li a {
            text-decoration: none;
            color: #000;
            display: block;
        }

        .adminCenterMemContent {
            flex: 1;
            padding: 10px;
            border-right: 1px solid #000;
        }

        .adminCenterMemContent h1 {
            font-size: 24px;
            font-weight: bold;
        }

        .adminCenterMemSearch-box {
            text-align: right;
            margin-bottom: 20px;
        }

        .adminCenterMemSearch-box input[type="text"] {
            padding: 5px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .adminCenterMemSearch-box input[type="submit"] {
            padding: 5px 10px;
            border: none;
            background-color: #204160;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .adminCenterMemSearch-box input[type="submit"]:hover {
            background-color: #102a40;
        }

        .adminCenterMemSearch-box img {
            width: 20px;
            cursor: pointer;
            vertical-align: middle;
        }

        .adminCenterMemTableContainer {
            width: 100%;
            overflow-x: auto; /* 가로 스크롤 추가 */
            border: 1px solid #000;
        }

        .adminCenterMemTableContainer table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .adminCenterMemTableContainer table, .adminCenterMemTableContainer th, .adminCenterMemTableContainer td {
            border: 1px solid #000;
        }
        .adminCenterMemTableContainer th {
            background-color: #2b5d7c;
            vertical-align: middle;
            color: white;
            font-weight: bold;
            padding: 15px;
        }
        .adminCenterMemTableContainer th, .adminCenterMemTableContainer td {
            padding: 10px;
            text-align: center;
            word-break: break-word;
        }
        .adminCenterMemTableContainer td a {
            text-decoration: none;
            color: #000;
            display: block;
        }
        .adminCenterMemTableContainer td:nth-child(5) {
            font-size: 11px;
        }
        .adminCenterMemTableContainer tbody tr:nth-child(even) {
            background-color: #d9e2ec;
        }

        .adminCenterMemTableContainer tbody tr:nth-child(odd) {
            background-color: #f4f8fb;
        }

        .adminCenterMemTableContainer tbody tr:hover {
            background-color: #d3e0ea;
            cursor: pointer;
        }

        .adminCenterMemPagination {
            text-align: center;
            margin-top: 20px;
        }

        .adminCenterMemPagination a {
            margin: 0 5px;
            padding: 5px 10px;
            text-decoration: none;
            border: 1px solid #000;
            border-radius: 5px;
            color: #204160;
        }

        .adminCenterMemPagination a.active {
            background-color: #204160;
            color: #fff;
        }

        .adminCenterMemPagination a:hover {
            background-color: #102a40;
            color: white;
        }

        .adminCenterMemActionButtons {
            text-align: center;
            margin-top: 20px;
        }

        .adminCenterMemActionButtons button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 10px;
            background-color: #204160;
            color: white;
        }

        .adminCenterMemActionButtons button:hover {
            background-color: #102a40;
        }

    </style>
    <script>
        function resetSearch() {
            const searchQueryInput = document.querySelector('input[name="searchQuery"]');
            searchQueryInput.value = '';
            searchQueryInput.closest('form').submit();
        }
    </script>
</head>
<body class="adminCenterMemBody">
<header class="adminCenterMemHeader">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고">
</header>
<div class="adminCenterMemContainer">
    <div class="adminCenterMemSidebar">
        <h3>관리자<br>페이지</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/adminCenterMem">센터회원정보 조회</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>
    </div>
    <div class="adminCenterMemContent">
        <h1>센터회원 정보 조회</h1>
        <div class="adminCenterMemSearch-box">
            <form action="${pageContext.request.contextPath}/adminCenterMem" method="get">
                <input type="text" name="searchQuery" placeholder="검색어 입력" value="${param.searchQuery}">
                <input type="submit" value="검색">
                <img src="${pageContext.request.contextPath}/img/reset.png" alt="초기화" onclick="resetSearch()">
            </form>
        </div>
        <div class="adminCenterMemTableContainer">
            <table>
                <thead>
                    <tr>
                        <th width="5%">No</th>
                        <th width="10%">이름</th>
                        <th width="10%">아이디</th>
                        <th width="15%">전화번호</th>
                        <th width="15%">주소</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="member" items="${centerMemberList}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td><a href="centerMemberDetail?c_id=${member.c_id}">${member.c_name}</a></td>
                            <td>${member.c_id}</td>
                            <td>${member.c_phone}</td>
                            <td>${member.c_addr1} ${member.c_addr2}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="adminCenterMemPagination">
            <c:forEach var="page" begin="1" end="${totalPages}">
                <a href="?page=${page}&searchQuery=${param.searchQuery}&size=20" class="${currentPage == page ? 'active' : ''}">${page}</a>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
