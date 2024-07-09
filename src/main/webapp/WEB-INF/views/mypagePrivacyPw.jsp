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

    </style>
</head>
<body class="mypageBody">
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
                     <button type="submit" value="" class="mypageNavLinksBtn">개인정보</button>
                 </form>
                  <form action="${pageContext.request.contextPath}/mypageVol" method="GET">
                     <input type="hidden" name="userId" value="${userId}">
                     <button type="submit" value="" class="mypageNavLinksBtn">나의봉사내역</button>
                 </form>
             </div>
         </nav>

    <!-- 개인정보 확인 컨텐츠 -->
    <div class="mypage">
        <div  class="mypageMainTitle">개인정보확인</div>
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