<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* 여기에 mypageVolunteerCheck.jsp의 슬라이딩 메뉴 관련 CSS를 붙여넣으세요 */
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

    <!-- 슬라이딩 메뉴 버튼 -->
    <div class="mypageMenuBtn">
        <div class="mypageLine mypageLine1"></div>
        <div class="mypageLine mypageLine2"></div>
        <div class="mypageLine mypageLine3"></div>
    </div>

    <!-- 슬라이딩 네비게이션 메뉴 -->
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

    <!-- 개인정보 확인 컨텐츠 -->
    <div class="mypage">
        <div> <img src="./img/sole.png">개인정보확인</div>
        <div class="mypagePrivacyPw">
            <div class="mypagePrivacyPwNoti">
                <div>개인정보 수정을 위해 <br> 비밀번호 확인이 필요합니다.</div>
                <form action="checkPrivacyPw" method="post">
                    <input type="hidden" name="userId" value="${userId}">

                    <div class="mypagePrivacyPwInputPW2">
                        <input type="password" name="u_pwd" required>
                        <label>password</label>
                        <span></span>
                    </div>
                    <button type="submit" id="" class="mypagePrivacyPwCheckBtn1">
                        <img src="./img/soleWhite.png" alt="Submit">
                        <span>제출</span>
                    </button>
                    <!--맵핑 필요 : myPrivacyCheck-->
                    <c:if test="${not empty error}">
                        <div class="error">${error}</div>
                    </c:if>
                </form>
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