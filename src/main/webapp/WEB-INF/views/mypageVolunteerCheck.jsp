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
            position: relative;
            transform: translateX(-300px);
            height: 100%;
            width: 400px;
            transition: all 800ms cubic-bezier(.8, 0, .33, 1);
            border-radius: 0% 0% 100% 50%;
        }

        .mypageNav.mypageNav-open {
            transform: translateX(0px);
            border-radius: 0% 0% 0% 0%;
            background: rgba(255, 255, 255, 0.6);
        }

        .mypageMenuBtn {
            position: absolute;
            top: 50%;
            right: 5%;
            padding: 0;
            width: 30px;
            cursor: pointer;
            z-index: 2;
        }

        .mypageLine {
            padding: 0;
            width: 30px;
            background: #fff;
            height: 2px;
            margin: 5px 0;
            transition: all 700ms cubic-bezier(.9, 0, .33, 1);
        }

        .mypageLine--1 {
            width: 30px;
            transform: rotate(0) translateY(0);
        }

        .mypageLine--1.mypageLine-cross {
            width: 30px;
            transform: rotate(45deg) translateY(10px);
            background: rgba(0, 0, 0, 0.6);
        }

        .mypageLine--2 {
            width: 28px;
            transform: translateX(0);
        }

        .mypageLine--2.mypageLine-fade-out {
            width: 28px;
            transform: translate(30px);
            opacity: 0;
        }

        .mypageLine--3 {
            width: 20px;
            transform: rotate(0) translateY(0);
        }

        .mypageLine--3.mypageLine-cross {
            width: 30px;
            transform: rotate(-45deg) translateY(-10px);
            background: rgba(0, 0, 0, 0.6);
        }

        .mypageNavLinks {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transform: translateX(-100px);
            opacity: 0;
            transition: all 900ms cubic-bezier(.9, 0, .33, 1);
        }

        .fade-in {
            opacity: 1;
            transform: translateX(0px);
        }

        .mypageLink {
            margin: 20px 0;
            text-decoration: none;
            font-family: sans-serif;
            color: rgba(0, 0, 0, 0.9);
            font-weight: 700;
            text-transform: uppercase;
            font-size: 1.2rem;
            transition: all 300ms cubic-bezier(.9, 0, .33, 1);
        }

        .mypageLink:hover {
            color: rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
    <jsp:include page="nevi.jsp" />

    <nav class="mypageNav">
        <div class="mypageMenuBtn">
            <div class="mypageLine mypageLine--1"></div>
            <div class="mypageLine mypageLine--2"></div>
            <div class="mypageLine mypageLine--3"></div>
        </div>

        <div class="mypageNavLinks">
            <a href="" class="mypageLink">Home</a>
            <a href="" class="mypageLink">Contact</a>
            <a href="" class="mypageLink">Profile</a>
            <a href="" class="mypageLink">About</a>
        </div>
    </nav>

    <div class="mypageMain">
        <div class="mypageMainTitle"><img src="./img/sole.png" alt="" class="">봉사신청 전체내역</div>
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
                                        <td>${vol.c_name}</td>
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
            const lineOne = document.querySelector('.mypageLine--1');
            const lineTwo = document.querySelector('.mypageLine--2');
            const lineThree = document.querySelector('.mypageLine--3');
            const link = document.querySelector('.mypageNavLinks');

            menuBtn.addEventListener('click', () => {
                nav.classList.toggle('mypageNav-open');
                lineOne.classList.toggle('mypageLine-cross');
                lineTwo.classList.toggle('mypageLine-fade-out');
                lineThree.classList.toggle('mypageLine-cross');
                link.classList.toggle('fade-in');
            });
        });
    </script>
</body>
</html>