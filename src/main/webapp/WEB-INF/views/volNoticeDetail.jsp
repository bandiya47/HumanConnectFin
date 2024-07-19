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
    <title>Human Connect</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <jsp:include page="nevi.jsp" />
    <div class="volNoticeDetailContainer">
        <div>
                <form id="noticeDetailForm" method="post" enctype="multipart/form-data">
                    <div class="volNoticeDetailDiv">
                        <h2>공지사항 상세페이지</h2>
                        <div class="noticeContainer">
                            <table id="noticeDetailTable" class="noticeDetailTable">
                                <tbody>
                                    <tr height="15%">
                                        <th width="20%">제목</th>
                                        <td id="detailTitle" width="90%">
                                            ${noticeList.nTitle}
                                        </td>
                                    </tr>
                                    <tr height="75%">
                                        <th>내용</th>
                                        <td id="detailContent">
                                           <p id="centerDetailContent" name="nContent">${noticeList.nContent}</p>
                                        </td>
                                    </tr>
                                    <tr height="10%">
                                        <th>첨부 파일</th>
                                        <td id="detailAttach">${noticeList.nAttachPath}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button class="noticeListBtn" type="button" onclick="goNoticeList()">목록</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    <script type="text/javascript">
        function goNoticeList() {
                  window.location.href = "${pageContext.request.contextPath}/volNoticeList.do?userId=${userId}";
        }


    </script>
</body>
</html>