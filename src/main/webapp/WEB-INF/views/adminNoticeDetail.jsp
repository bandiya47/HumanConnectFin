<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page import="dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Human Connect</title>
    <link rel="stylesheet" href="${contextPath}/css/style.css">
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

        function adminMain() {
            const logoutForm = document.createElement('form');
            logoutForm.method = 'get';
            logoutForm.action = '${contextPath}/adminMain';
            document.body.appendChild(logoutForm);
            logoutForm.submit();
        }

        function showNoticeForm() {
            document.getElementById('noticeReg').style.display = 'block';
            document.getElementById('noticeListForm').style.display = 'none';
        }

        function goNoticeList() {
            window.location.href = "${contextPath}/adminNoticeList.do";
        }

        function enableEditing() {
            const detailTitle = document.getElementById('detailTitle');
            const detailContent = document.getElementById('detailContent');
            detailTitle.removeAttribute('readonly');
            detailTitle.classList.add('editable'); // 수정 모드에서 보더 추가
            detailContent.removeAttribute('readonly');
            detailContent.classList.add('editable'); // 수정 모드에서 보더 추가
            document.getElementById('editButtons').style.display = 'inline-block';
            document.getElementById('editButton').style.display = 'none';
            autoResizeTextarea(detailContent);
            saveScrollPosition();
        }

        function cancelEditing() {
            const detailTitle = document.getElementById('detailTitle');
            const detailContent = document.getElementById('detailContent');
            detailTitle.setAttribute('readonly', true);
            detailTitle.classList.remove('editable'); // 수정 모드에서 보더 제거
            detailContent.setAttribute('readonly', true);
            detailContent.classList.remove('editable'); // 수정 모드에서 보더 제거
            document.getElementById('editButtons').style.display = 'none';
            document.getElementById('editButton').style.display = 'inline-block';
            restoreScrollPosition();
        }

        function saveNotice() {
            const form = document.getElementById('updateNoticeForm');
            form.submit();
        }

        function autoResizeTextarea(textarea) {
            textarea.style.height = 'auto';
            textarea.style.height = textarea.scrollHeight + 'px';
        }

        function saveScrollPosition() {
            sessionStorage.setItem('scrollPosition', window.scrollY);
        }

        function restoreScrollPosition() {
            const scrollPosition = sessionStorage.getItem('scrollPosition');
            if (scrollPosition !== null) {
                window.scrollTo(0, scrollPosition);
            }
        }

        window.addEventListener('DOMContentLoaded', (event) => {
            autoResizeTextarea(document.getElementById('detailContent'));
            restoreScrollPosition();
        });
    </script>
</head>
<body>

<header class="adminNoticeMainHeader">
    <img src="${contextPath}/img/logo.png" alt="로고" onclick="adminMain()">
    <form action="logout" method="post">
       <button class="adminNotBtn" type="submit" value="">로그아웃</button>
    </form>
</header>
<div class="adminMainContainer">
    <div class="adminMainSidebar">
        <h3>관리자<br>페이지</h3>
        <ul>
            <li><a href="${contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li><a href="${contextPath}/adminCenterMem">센터회원정보 조회</a></li>
            <li class="active"><a href="${contextPath}/adminNoticeList.do">공지사항</a></li>
        </ul>
    </div>
    <!--상세 공지글-->
    <div class="noticeDetailBody" id="noticeDetail" style="display:block;">
        <div class="adminNoticeDetailWholeContainer">
            <form id="updateNoticeForm" method="post" action="${contextPath}/updateNoticeDetail">
                <input type="hidden" name="nNumber" value="${noticeList.nNumber}">

                <div class="adminNoticeDetailDiv">
                    <h2>공지사항 상세페이지</h2>
                    <div class="buttonContainer3">
                        <table id="adminNoticeDetailTable" class="adminNoticeDetailTable">
                            <tbody>
                                <tr>
                                    <th width="20%">제목</th>
                                    <td class="tempTd">
                                        <input type="text" id="detailTitle" name="nTitle" value="${noticeList.nTitle}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                        <textarea id="detailContent" name="nContent" rows="10" cols="50" readonly>${noticeList.nContent}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>첨부 파일</th>
                                    <td id="detailAttach">${noticeList.nAttachPath}</td>
                                </tr>
                            </tbody>
                        </table>
                        <button class="aNDBtn" type="button" onclick="goNoticeList()">목록</button>
                        <button class="aNDBtn" type="button" id="editButton" onclick="enableEditing()">수정</button>
                        <div id="editButtons" style="display:none;">
                            <button class="aNDBtn" type="button" onclick="saveNotice()">저장</button>
                            <button class="aNDBtn" type="button" onclick="cancelEditing()">취소</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>