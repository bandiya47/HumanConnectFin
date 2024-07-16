<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <title>Human Connect</title>
</head>
<body>
<jsp:include page="nevi.jsp" />
<div class="volunteerDetailDiv">
    <h3>보호센터 리스트</h3>
    <div class="centerListBox">
        <table class="volunteerDetailTable">
            <thead>
                <tr>
                    <th class="volunteerDetailTh">보호소명</th>
                    <th class="volunteerDetailTh">주소</th>
                    <th class="volunteerDetailTh" width="25%">대표번호</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="careInfoMap" items="${careInfo}">
                    <tr>
                        <td class="volunteerDetailTd">
                            <form method="get" action="${pageContext.request.contextPath}/detailCenterList.do" encType="UTF-8">
                                <input type="hidden" name="userId" value="${userId}">
                                <input type="hidden" name="careNm" value="${careInfoMap.careNm}">
                                <input type="submit" value="${careInfoMap.careNm}" class="volunteerDetailInput">
                            </form>
                        </td>
                        <td class="volunteerDetailTd">${careInfoMap.careAddr}</td>
                        <td class="volunteerDetailTd">${careInfoMap.careTel}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="pagination" style="text-align : center;display: flex; justify-content: center;">
    <c:set var="startPage" value="${pageNo - ((pageNo - 1) % 10)}" />
    <c:set var="endPage" value="${startPage + 9}" />

    <c:if test="${startPage > 1}">
        <a href="viewCenterList.do?pageNo=${startPage - 10}&numOfRows=${numOfRows}&userId=${userId}">« 이전</a>
    </c:if>
    <c:forEach begin="${startPage}" end="${endPage}" var="i">
        <c:if test="${i <= totalPages}">
            <c:choose>
                <c:when test="${i == pageNo}">
                    <span class="active">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="viewCenterList.do?pageNo=${i}&numOfRows=${numOfRows}&userId=${userId}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:if>
    </c:forEach>
    <c:if test="${endPage < totalPages}">
        <a href="viewCenterList.do?pageNo=${startPage + 10}&numOfRows=${numOfRows}&userId=${userId}">다음 »</a>
    </c:if>
</div>
</body>
</html>
