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
    </style>
    <script>
        function resetSearch() {
            const searchQueryInput = document.querySelector('input[name="searchQuery"]');
            searchQueryInput.value = '';
            searchQueryInput.closest('form').submit();
        }
        function logout() {
            const logoutForm = document.createElement('form');
            logoutForm.method = 'post';
            logoutForm.action = '${pageContext.request.contextPath}/logout';
            document.body.appendChild(logoutForm);
            logoutForm.submit();
        }
    </script>
</head>
<body class="adminCenterMemBody">
<header class="adminCenterMemHeader">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고" onclick="logout()">
</header>
<div class="adminCenterMemContainer">
    <div class="adminCenterMemSidebar">
        <h3>관리자<br>페이지</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/adminCenterMem">센터회원정보 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/adminNoticeList.do">고객센터</a></li>
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
