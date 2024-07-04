<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Human_Connect</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="centerRecBody">
    <jsp:include page="nevi.jsp" />
    <main class="">
        <section class="">
            <h2>입양 정보 검색</h2>
        </section>
        <section class="volAnimalListSection">
            <h2>입양 목록 보기</h2>
            <div class="">
                <table>
                    <thead>
                        <tr>
                            <tr>이미지</tr>
                            <tr>공고번호 : ${공고번호}</tr>
                            <tr>이름 : ${이름}</tr>
                            <tr>품종 : ${품종}</tr>
                            <tr>성별 : ${성별}</tr>
                            <tr>지역 : ${지역}</tr>
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
                                            <form action="${pageContext.request.contextPath}/volunteerDetail" method="get">
                                                <input type="hidden" name="v_no" value="${dto.rNum}">
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