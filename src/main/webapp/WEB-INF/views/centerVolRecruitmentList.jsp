<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Human Connect</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .centerRecListPagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .centerRecListPagination a {
            margin: 0 5px;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            color: #333;
        }
        .centerRecListPagination a:hover {
            background-color: #ddd;
        }
        .centerRecListPagination a.active {
            background-color: #FEAB82;
            color: white;
            border: 1px solid #FEAB82;
        }
    </style>
    <script>
        function showRejectReason(id) {
            document.getElementById('reject-reason-' + id).style.display = 'block';
        }

        function hideRejectReason(id) {
            document.getElementById('reject-reason-' + id).style.display = 'none';
        }
    </script>
</head>
<body class="centerBody">
    <jsp:include page="neviCenter.jsp" />
    <main class="centerMain">
        <section class="centerSection">
            <h2>모집신청내역</h2>
            <div class="centerBox">
                <h3>${recruitmentList[0].title}</h3>
                <table>
                    <thead>
                        <tr>
                            <th width="15%">ID</th>
                            <th width="15%">이름</th>
                            <th width="15%">전화번호</th>
                            <th>봉사상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty recruitmentList}">
                                <tr>
                                    <td colspan="4" class="centerNoData">표시할 데이터가 없습니다</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="vo" items="${recruitmentList}">
                                    <tr>
                                        <td>${vo.userId}</td>
                                        <td>${vo.name}</td>
                                        <td>${vo.phone}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${vo.status == '0'}">
                                                    <div class="centerMainBtnG">
                                                        <form method="post" action="${pageContext.request.contextPath}/centerRecruitList">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="centerId" value="${centerId}">
                                                            <input type="hidden" name="action" value="approve">
                                                            <input type="hidden" name="section" value="recruitment">
                                                            <input type="hidden" name="resNo" value="${vo.resNo}">
                                                            <input type="hidden" name="page" value="${currentPage}">
                                                            <button class="centerMainApprv" type="submit">승인</button>
                                                        </form>
                                                        <form method="post" action="${pageContext.request.contextPath}/centerRecruitList">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="centerId" value="${centerId}">
                                                            <input type="hidden" name="action" value="reject">
                                                            <input type="hidden" name="section" value="recruitment">
                                                            <input type="hidden" name="resNo" value="${vo.resNo}">
                                                            <input type="hidden" name="page" value="${currentPage}">
                                                            <button class="centerMainRej" type="button" onclick="showRejectReason('${vo.userId}_recruitment')">거절</button>
                                                        </form>
                                                    </div>
                                                    <div id="reject-reason-${vo.userId}_recruitment" style="display:none;">
                                                        <form method="post" action="${pageContext.request.contextPath}/centerRecruitList">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="centerId" value="${centerId}">
                                                            <input type="hidden" name="action" value="reject">
                                                            <input type="hidden" name="section" value="recruitment">
                                                            <input type="hidden" name="resNo" value="${vo.resNo}">
                                                            <input type="hidden" name="page" value="${currentPage}">
                                                            <input class="centerMainRR" type="text" name="rejectReason" placeholder="거절 사유를 입력하세요" />
                                                            <button class="centerRR" type="submit">O</button>
                                                            <button class="centerRR" type="button" onclick="hideRejectReason('${vo.userId}_recruitment')">X</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                                <c:when test="${vo.status == '1'}">
                                                    <form method="post" action="${pageContext.request.contextPath}/centerRecruitList">
                                                        <input type="hidden" name="userId" value="${vo.userId}">
                                                        <input type="hidden" name="centerId" value="${centerId}">
                                                        <input type="hidden" name="action" value="complete">
                                                        <input type="hidden" name="section" value="recruitment">
                                                        <input type="hidden" name="resNo" value="${vo.resNo}">
                                                        <input type="hidden" name="page" value="${currentPage}">
                                                        <button class="centerMainVolBtn" type="submit">봉사완료</button>
                                                    </form>
                                                </c:when>
                                                <c:when test="${vo.status == '2'}">
                                                    <div>거절됨: ${vo.rejectReason}</div>
                                                </c:when>
                                                <c:when test="${vo.status == '3'}">
                                                    <div>봉사완료</div>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <div class="centerRecListPagination">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <a href="${pageContext.request.contextPath}/centerRecruitList?centerId=${centerId}&page=${i}"
                           class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
