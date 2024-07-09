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
        .mypageMain {
            margin: 60px auto 0;
            width: 980px;
        }

        .mypageMainTitle {
            font-size: 27px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .mypageMainTitle > img {
            width: 27px;
            height: 27px;
        }

        .mypageMainFirstStack {
        }

        .mypageMainFirstMiddle {
            width: 980px;
            border: gray solid 1px;
            border-radius: 5px;
            background-color: white;
        }

        .mypageMainFirstMiddle > div > table {
            width: 100%;
            border-collapse: collapse;
            font-family: 'MangoDdobak-B';
            font-size: 20px;
        }

        .mypageMainFirstMiddle tbody > tr > th {
            background-color: #463933;
            vertical-align: middle;
            color: white;
            font-weight: bold;
            padding: 15px;
        }

        .mypageMainFirstMiddle tbody > tr > td {
            border: none;
            font-size: 18px;
            height: 80px;
            text-align: center;
            vertical-align: middle;
            border-bottom: 1px solid #aaa;
        }

        .mypageNav {
            overflow: hidden;
            position: fixed;
            top: 0;
            right: 0;
            height: 100%;
            width: 300px;
            transform: translateX(300px);
            transition: transform 0.3s ease-in-out;
            background: rgba(255, 255, 255, 0.9);
            z-index: 1;
        }

        .mypageNav.mypageNav-open {
            transform: translateX(0);
        }

        .mypageMenuBtn {
            position: fixed;
            top: 50%;
            right: 20px;
            padding: 10px;
            background: rgba(0, 0, 0, 0.6);
            border-radius: 5px;
            cursor: pointer;
            z-index: 2;
            transform: translateY(-50%);
        }

        .mypageLine {
            width: 30px;
            height: 3px;
            background-color: white;
            margin: 6px 0;
            transition: 0.4s;
        }

        .mypageLine.cross1 {
            transform: rotate(-45deg) translate(-7px, 6px);
        }

        .mypageLine.cross2 {
            opacity: 0;
        }

        .mypageLine.cross3 {
            transform: rotate(45deg) translate(-8px, -8px);
        }

        .mypageNavLinks {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            opacity: 0;
            transition: opacity 0.4s;
        }

        .fade-in {
            opacity: 1;
        }

        .mypageLink {
            margin: 20px 0;
            text-decoration: none;
            font-family: sans-serif;
            color: rgba(0, 0, 0, 0.9);
            font-weight: 700;
            text-transform: uppercase;
            font-size: 1.2rem;
            transition: color 0.3s;
        }

        .mypageLink:hover {
            color: rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
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
                <button type="submit" value="">개인정보</button>
            </form>
             <form action="${pageContext.request.contextPath}/mypageVol" method="GET">
                <input type="hidden" name="userId" value="${userId}">
                <button type="submit" value="">전체보기</button>
            </form>
        </div>
    </nav>

    <div class="mypageMain">
        <div class="mypageMainTitle"><img src="./img/sole.png" alt="">봉사신청 전체내역</div>
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
                                                <button type="submit">${vol.c_name}</button>
                                            </form>
                                        </td>
                                        <td>${vol.vreg_start_date}</td>
                                        <td>${vol.vreg_end_date}</td>
                                        <td>${vol.service_type}</td>
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