<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>센터 메인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function showRejectReason(id) {
            document.getElementById('reject-reason-' + id).style.display = 'block';
        }

        function hideRejectReason(id) {
            document.getElementById('reject-reason-' + id).style.display = 'none';
        }

        function submitForm(action, userId, section) {
            var form = document.createElement('form');
            form.method = 'post';
            form.action = action;

            var hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = 'userId';
            hiddenField.value = userId;

            var hiddenSection = document.createElement('input');
            hiddenSection.type = 'hidden';
            hiddenSection.name = 'section';
            hiddenSection.value = section;

            form.appendChild(hiddenField);
            form.appendChild(hiddenSection);
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body class="centerBody">
    <jsp:include page="neviCenter.jsp" />
    <main class="centerMain">
        <section class="centerSection">
            <h2>모집신청내역</h2>
            <div class="centerBox">
                <h3>${latestRecruitmentTitle}</h3>
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
                                                        <form method="post" action="${pageContext.request.contextPath}/centerMain">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="action" value="approve">
                                                            <button class="centerMainApprv" type="submit">승인</button>
                                                        </form>
                                                        <form method="post" action="${pageContext.request.contextPath}/centerMain">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="action" value="reject">
                                                            <button class="centerMainRej" type="button" onclick="showRejectReason('${vo.userId}_recruitment')">거절</button>
                                                        </form>
                                                    </div>
                                                    <div id="reject-reason-${vo.userId}_recruitment" style="display:none;">
                                                        <form method="post" action="${pageContext.request.contextPath}/centerMain">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="action" value="reject">
                                                            <input class="centerMainRR" type="text" name="rejectReason" placeholder="거절 사유를 입력하세요" />
                                                            <button class="centerRR" type="submit">O</button>
                                                            <button class="centerRR" type="button" onclick="hideRejectReason('${vo.userId}_recruitment')">X</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                                <c:when test="${vo.status == '1'}">
                                                    <form method="post" action="${pageContext.request.contextPath}/centerMain">
                                                        <input type="hidden" name="userId" value="${vo.userId}">
                                                        <input type="hidden" name="action" value="complete">
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
                <div class="centerlistViewAllCont">
                    <form name="viewall" method="post" action="${pageContext.request.contextPath}/recruitlist" encType="utf-8">
                        <button type="submit" class="centerlistViewAll">전체보기&gt;</button>
                    </form>
                </div>
            </div>
            <form name="recruitmentRegister" method="post" action="${pageContext.request.contextPath}/centerReg.jsp" encType="utf-8">
                <button type="submit" class="centerMainRegisterButton">등 록</button>
            </form>
        </section>

        <section class="centerSection">
            <h2>봉사신청내역</h2>
            <div class="centerBox">
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
                            <c:when test="${empty volunteerList}">
                                <tr>
                                    <td colspan="5" class="centerNoData">표시할 데이터가 없습니다</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="vo" items="${volunteerList}">
                                    <tr>
                                        <td onclick="submitForm('${pageContext.request.contextPath}/VolunteerMain.jsp', '${vo.userId}')">${vo.userId}</td>
                                        <td onclick="submitForm('${pageContext.request.contextPath}/VolunteerMain.jsp', '${vo.userId}')">${vo.name}</td>
                                        <td onclick="submitForm('${pageContext.request.contextPath}/VolunteerMain.jsp', '${vo.userId}')">${vo.phone}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${vo.status == '0'}">
                                                    <div class="centerMainBtnG">
                                                        <form method="post" action="${pageContext.request.contextPath}/centerMain">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="action" value="approve">
                                                            <input type="hidden" name="section" value="volunteer">
                                                            <button class="centerMainApprv" type="submit">승인</button>
                                                        </form>
                                                        <form method="post" action="${pageContext.request.contextPath}/centerMain">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="action" value="reject">
                                                            <input type="hidden" name="section" value="volunteer">
                                                            <button class="centerMainRej" type="button" onclick="showRejectReason('${vo.userId}_volunteer')">거절</button>
                                                        </form>
                                                    </div>
                                                    <div id="reject-reason-${vo.userId}_volunteer" style="display:none;">
                                                        <form method="post" action="${pageContext.request.contextPath}/centerMain">
                                                            <input type="hidden" name="userId" value="${vo.userId}">
                                                            <input type="hidden" name="action" value="reject">
                                                            <input type="hidden" name="section" value="volunteer">
                                                            <input class="centerMainRR" type="text" name="rejectReason" placeholder="거절 사유를 입력하세요" />
                                                            <button class="centerRR" type="submit">O</button>
                                                            <button class="centerRR" type="button" onclick="hideRejectReason('${vo.userId}_volunteer')">X</button>
                                                        </form>
                                                    </div>
                                                </c:when>
                                                <c:when test="${vo.status == '1'}">
                                                    <form method="post" action="${pageContext.request.contextPath}/centerMain">
                                                        <input type="hidden" name="userId" value="${vo.userId}">
                                                        <input type="hidden" name="action" value="complete">
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
                <div class="centerlistViewAllCont">
                    <form name="viewall" method="post" action="${pageContext.request.contextPath}/봉사모집리스트" encType="utf-8">
                        <button type="submit" class="centerlistViewAll">전체보기&gt;</button>
                    </form>
                </div>
            </div>
        </section>

        <section class="centerSection">
            <h2>입양상담신청내역</h2>
            <div class="centerBox">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>이름</th>
                            <th>전화번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty adoptionList}">
                                <tr>
                                    <td colspan="4" class="centerNoData">표시할 데이터가 없습니다</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="vo" items="${adoptionList}">
                                    <tr>
                                        <td>${vo.userId}</td>
                                        <td>${vo.name}</td>
                                        <td>${vo.phone}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <div class="centerlistViewAllCont">
                    <form name="viewall" method="post" action="${pageContext.request.contextPath}/봉사모집리스트" encType="utf-8">
                        <button type="submit" class="centerlistViewAll">전체보기&gt;</button>
                    </form>
                </div>
            </div>
        </section>
    </main>
</body>
</html>