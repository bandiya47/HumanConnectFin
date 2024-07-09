<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPage Volunteer Check</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>





    </style>
</head>
<body class="mypageBody">
    <jsp:include page="nevi.jsp" />

    <div class="mypageMenuBtn">
        <div class="mypageLine mypageLine1"></div>
        <div class="mypageLine mypageLine2"></div>
        <div class="mypageLine mypageLine3"></div>
    </div>

    <nav class="mypageNav">
        <div class="mypageNavLinks">
            <a href="#" class="mypageLink">마이페이지 메뉴</a>
            <form action="${pageContext.request.contextPath}/showPrivacyPw" method="POST">
                <input type="hidden" name="userId" value="${userId}">
                <button type="submit" value="" class="mypageNavLinksBtn">개인정보</button>
            </form>
             <form action="${pageContext.request.contextPath}/mypageVol" method="GET">
                <input type="hidden" name="userId" value="${userId}">
                <button type="submit" value="" class="mypageNavLinksBtn">나의봉사내역</button>
            </form>
        </div>
    </nav>

    <div class="mypageMain">
        <div class="mypageMainTitle">봉사신청 전체내역</div>
        <div class="mypageMainFirstStack">
            <div class="mypageMainFirstMiddle">
                <div>
                    <table>
                        <tr>
                            <th>보호소</th>
                            <th>봉사시작일</th>
                            <th>봉사종료일</th>
                            <th>역할</th>
                        </tr>

                        <c:choose>
                            <c:when test="${empty mypageVolunteerList}">
                                <tr>
                                    <td colspan="4" class="centerNoData">표시할 데이터가 없습니다</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="vol" items="${mypageVolunteerList}">
                                    <tr>
                                         <td>
                                            <form action="/viewRegVolunteerDetail.do" method="get">
                                            <input type="hidden" name="userId" value="${userId}">
                                            <input type="hidden" name="vReg_no" value="${vol.vreg_no}">
                                                <button type="submit" class="firstStackBtn">${vol.c_name}</button>
                                            </form>
                                        </td>
                                        <td><form action="/viewRegVolunteerDetail.do" method="get">
                                            <input type="hidden" name="userId" value="${userId}">
                                            <input type="hidden" name="vReg_no" value="${vol.vreg_no}">
                                                <button type="submit" class="firstStackBtn">${vol.vreg_start_date}</button>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="/viewRegVolunteerDetail.do" method="get">
                                            <input type="hidden" name="userId" value="${userId}">
                                            <input type="hidden" name="vReg_no" value="${vol.vreg_no}">
                                                <button type="submit" class="firstStackBtn">${vol.vreg_end_date}</button>
                                            </form>

                                        </td>
                                        <td>
                                            <form action="/viewRegVolunteerDetail.do" method="get">
                                            <input type="hidden" name="userId" value="${userId}">
                                            <input type="hidden" name="vReg_no" value="${vol.vreg_no}">
                                                <button type="submit" class="firstStackBtn">${vol.service_type}</button>
                                            </form>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const menuBtn = document.querySelector('.mypageMenuBtn');
            const nav = document.querySelector('.mypageNav');
            const lines = document.querySelectorAll('.mypageLine');
            const link = document.querySelector('.mypageNavLinks');

            menuBtn.addEventListener('click', () => {
                nav.classList.toggle('mypageNav-open');
                lines[0].classList.toggle('cross1');
                lines[1].classList.toggle('cross2');
                lines[2].classList.toggle('cross3');
                link.classList.toggle('fade-in');
            });
        });
    </script>
</body>
</html>