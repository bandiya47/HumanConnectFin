<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Human Connect</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
 <script type="text/javascript">
        function confirmDelete() {
            return confirm("정말 삭제하시겠습니까?");
        }
    </script>
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


	<div class="mypage">
	    <div class="mypageMainTitle">개인정보확인</div>
	    <div class="mypagePrivacyCheck">
	        <div>
	            <div>
	                <table class="mypagePrivacyCheckTable">
	                    <tr>
	                        <th>성명</th>
	                        <td>${myinfo.u_name}
	                            ${myinfo.c_name}
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>아이디</th>
	                        <td>${myinfo.u_id}
	                            ${myinfo.c_id}
	                        </td>
	                    </tr>

	                    <tr>
	                       <th rowspan="2">주소</th>
                           <td>${myinfo.u_addr1}
                                ${myinfo.c_addr1}
                           </td>
	                    </tr>
	                    <tr>

	                         <td>상세주소</td>
	                    </tr>
	                    <tr>
	                       <th>이메일</th>
                           <td>${myinfo.u_email}
                                ${myinfo.c_email}
                           </td>
	                    </tr>
	                     <tr>
                            <th>전화번호</th>
                            <td>${myinfo.u_phone}
                                ${myinfo.c_phone}
                            </td>
                        </tr>
	                </table>
	            </div>

	            <div class="mypageChkBtnContainer">
                    <form name="privacyEdit" method="post" action="${pageContext.request.contextPath}/updatePrivacy">
                        <input type="hidden" name="userId" value="${userId}">
                        <button type="submit" name="edit" class="mypagePrivacyCheckBtn">수정</button>
                    </form>
                    <form name="removePrivacy" method="post" action="${pageContext.request.contextPath}/removePrivacy" onsubmit="return confirmDelete();">
                        <input type="hidden" name="userId" value="${userId}">
                        <button type="submit" name="edit" class="mypagePrivacyCheckBtn">삭제</button>
                    </form>
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
</html