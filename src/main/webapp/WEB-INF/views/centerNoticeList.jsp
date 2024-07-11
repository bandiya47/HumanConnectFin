<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page import="dc.human.gbnb.humanConnect.center.vo.CenterNoticeListVO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect 공지사항</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<jsp:include page="neviCenter.jsp" />
<body>
    <!-- 공지사항 목록 및 삭제 -->
    <div class="centerNoticeListWholeContainer">
        <form id="noticeListForm" method="post" enctype="multipart/form-data"
                action="${pageContext.request.contextPath}/deleteNotices.do" style="display:block">
            <div class="centerNoticeListDiv">
                <h2>공지사항</h2>
                <div class="noticeListSomeDiv">
                    <table class="centerNoticeListTable">
                        <thead>
                            <tr>
                                <th width="10%">No</th>
                                <th width="53%">제목</th>
                                <th width="10%">작성자</th>
                                <th width="20%">작성일</th>
                            </tr>
                        </thead>
                        <c:forEach var="item" items="${centerNoticeList}">
                            <tbody>
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/viewVolNoticeDetail.do?nNumber=${item.nNumber}&userId=${userId}">
                                        ${item.nNumber}
                                      </td>
                                      <td>
                                        <a href="${pageContext.request.contextPath}/viewVolNoticeDetail.do?nNumber=${item.nNumber}&userId=${userId}">
                                        ${item.nTitle}
                                      </td>
                                      <td>
                                        <a href="${pageContext.request.contextPath}/viewVolNoticeDetail.do?nNumber=${item.nNumber}&userId=${userId}">
                                        ${item.uId}
                                      </td>
                                      <td>
                                        <a href="${pageContext.request.contextPath}/viewVolNoticeDetail.do?nNumber=${item.nNumber}&userId=${userId}">
                                        ${item.nDate}
                                      </td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
                <div class="paginationNotice">
                    <c:if test="${currentPage > 1}">
                        <a href="${contextPath}/centerNoticeList.do?centerId=${centerId}&page=${currentPage - 1}">&laquo; 이전</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span class="active">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${contextPath}/centerNoticeList.do?centerId=${centerId}&page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="${contextPath}/centerNoticeList.do?centerId=${centerId}&page=${currentPage + 1}">다음 &raquo;</a>
                    </c:if>
                </div>
            </div>
        </form>
    </div>

    <script type="text/javascript">

        <!-- 공지사항 등록 페이지 -->
        function showNoticeForm() {
            document.getElementById('noticeReg').style.display = 'block';
            document.getElementById('noticeListForm').style.display = 'none';
        }

        function showNoticeDetail() {
                window.location.href = "${pageContext.request.contextPath}/viewCenterNoticeDetail.do";
        }

        function goNoticeList() {
            window.location.href = "${pageContext.request.contextPath}/centerNoticeList.do?centerId=${centerId}";
        }

        function handleNoticeItemClick(event) {
            const nNumber = event.target.dataset.nNumber;
            const detailUrl = `/detail?nNumber=${nNumber}`;
            window.location.href = detailUrl;
        }

        const noticeList = document.querySelectorAll('.notice-item');
        noticeList.forEach(item => {
            item.addEventListener('click', handleNoticeItemClick);
        });

        document.getElementById('nAttachPath').addEventListener('change', function() {
            var fileName = this.files[0] ? this.files[0].name : '선택된 파일 없음';
            document.getElementById('file-name').textContent = fileName;
        });

    </script>

</body>
</html>