<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page import="dc.human.gbnb.humanConnect.admin.vo.AdminNoticeListVO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect 공지사항</title>
    <link rel="stylesheet" href="./css/style.css">
    <style>
        html, body {
            background-color: white !important;
        }
    </style>
</head>
<body class="noticeListBody">

<body>
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
<header class="adminMainHeader">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고" onclick="logout()">
</header>
<div class="adminMainContainer">
    <div class="adminMainSidebar">
        <h3>관리자<br>페이지</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/adminCenterMem">센터회원정보 조회</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/adminNoticeList.do">고객센터</a></li>
        </ul>
    </div>
    <!--상세 공지글-->
    <c:if test="${noticeDetail == 'ViewNoticeDetail'}">
     <form id="noticeDetailForm" name="viewNoticeDetail" method="post"
            action="${pageContext.request.contextPath}/viewNoticeDetail" encType="UTF-8">
            <p>1234</p>
     </c:if>
        <div class="noticeDetailBody" id="noticeDetail" style="display:block;"
                    action="${pageContext.request.contextPath}/viewNoticeDetail.do" >
            <div class="adminNoticeDetailWholeContainer">
                <form id="noticeDetailForm" method="post" enctype="multipart/form-data">

                    <div class="adminNoticeDetailDiv">
                        <h1>공지사항 상세페이지</h1>
                        <div class="buttonContainer3">
                            <table id="noticeDetailTable" class="noticeDetailTable">
                                <tbody>
                                    <tr height="15%">
                                        <th width="20%">제목</th>
                                        <td id="detailTitle" width="80%">
                                            ${noticeList.nTitle}
                                        </td>
                                    </tr>
                                    <tr height="75%">
                                        <th>내용</th>
                                        <td id="detailContent">${noticeList.nContent}</td>
                                    </tr>
                                    <tr height="10%">
                                        <th>첨부 파일</th>
                                        <td id="detailAttach">${noticeList.nAttachPath}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" onclick="goNoticeList()">목록</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    <script type="text/javascript">

        <!--공지사항 등록 페이지-->
        function showNoticeForm() {
            document.getElementById('noticeReg').style.display = 'block';
            document.getElementById('noticeListForm').style.display = 'none';
        }

        function goNoticeList() {
                  window.location.href = "${pageContext.request.contextPath}/adminNoticeList.do";
        }


    </script>


</body>
</html>

