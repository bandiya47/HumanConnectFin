<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>



<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<jsp:include page="neviCenter.jsp" />
<div class="volunteerDetailDiv">
    <h3>보호센터 리스트</h3>
        <table class="volunteerDetailTable">


    <c:set var="careInfo" value="${requestScope.careInfo}" />

        <tr>
            <td class="volunteerDetailTd">보호소 명</td>
            <td class="volunteerDetailTd">주소</td>
            <td class="volunteerDetailTd">대표번호</td>
        <tr>
        <c:forEach var="careInfoMap" items="${careInfo}">
        <tr>
            <td>
            <form method="get" action="${pageContext.request.contextPath}/detailCenterList.do" encType="UTF-8">
            <input type="hidden" name="userId" value="${userId}">
            <input type="hidden" name="careNm" value="${careInfoMap.careNm}">
            <input type="submit" value="${careInfoMap.careNm}">
            </form>

            </td>
            <td>${careInfoMap.careAddr}</td>
            <td>${careInfoMap.careTel}</td>
        </tr>
        </c:forEach>
    </table>
    </div>
    		        <div class="pagination" style="margin-left:400px">
                            <span class="active">1</span>
                            <a href="test?page=2">2</a>
                            <a href="test?page=3">3</a>
                            <a href="test?page=4">4</a>
                            <a href="test?page=5">5</a>
                            <a href="test?page=6">6</a>
                            <a href="test?page=2">다음 &raquo;</a>
    		         </div>
</body>
</html>