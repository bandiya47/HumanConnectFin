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
<body class="adminMainBody">
<header class="adminMainHeader">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고" onclick="logout()">
</header>
<div class="adminMainContainer">
    <div class="adminMainSidebar">
        <h3>관리자<br>페이지</h3>
        <ul>
            <li class="active"><a href="${pageContext.request.contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/adminCenterMem">센터회원정보 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/adminNoticeList.do">고객센터</a></li>
        </ul>
    </div>
    <div class="adminMainContent">
        <h1>봉사회원 정보 조회</h1>
        <div class="adminMainSearch-box">
            <form action="${pageContext.request.contextPath}/adminMain" method="get">
                <input type="text" name="searchQuery" placeholder="검색어 입력" value="${param.searchQuery}">
                <input type="submit" value="검색">
                <img src="${pageContext.request.contextPath}/img/reset.png" alt="초기화" onclick="resetSearch()">
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
                            <td><a href="adminMemDetail?u_id=${member.u_id}">${member.u_name}</a></td>
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
                <a href="?page=${page}&searchQuery=${param.searchQuery}" class="${currentPage == page ? 'active' : ''}">${page}</a>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
