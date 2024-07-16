<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Human Connect</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="centerRecBody">
    <jsp:include page="neviCenter.jsp" />
    <main class="centerRecMain">
        <section class="centerRecSection">
            <h2>내가 올린 모집</h2>
            <div class="centerRecBox">
                <table>
                    <thead>
                        <tr>
                            <th width="7%">No</th>
                            <th width="50%">제목</th>
                            <th width="20%">신청 인원</th>
                            <th>등록날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty recruitmentList}">
                                <tr>
                                    <td colspan="4" class="centerRecNoData">표시할 데이터가 없습니다</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="dto" items="${recruitmentList}">
                                    <tr>
                                        <td>${dto.rNum}</td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/viewCenterReg.do" method="get">
                                                <input type="hidden" name="v_no" value="${dto.rNum}">
                                                <input type="hidden" name="centerId" value="${centerId}">
                                                <input type="submit" value="${dto.rTitle}" style="font-family: 'MangoDdobak-B';border: none; background: none; cursor:pointer;font-size:18px;">
                                            </form>
                                        </td>
                                        <td>${dto.rRegiAmnt}</td>
                                        <td>${dto.rRegiDate}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
</body>
</html>