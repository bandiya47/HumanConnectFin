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
    <title>HumanConnect</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
        <script>
            var msg = '${msg}';
            if(msg === '비밀번호를 다시 확인해 주세요.') {
                alert("비밀번호를 다시 확인해 주세요.");
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



    <form name="savePrivacy" method="post" action="savePrivacy" onsubmit="return validatePassword()">
    <input type="hidden" name="u_id" value="${myinfo.u_id}">
    <!--여기부터 아래 내용 메인-->
    <div class="mypage">
        <div  class="mypageMainTitle">개인정보수정</div>
        <div class="mypagePrivacyEdit">
            <div>
                <div>
                    <table class="mypagePrivacyEditTable">
                        <tr>
                            <th>성명</th>
                            <td>${myinfo.u_name}</td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td>
                                ${myinfo.u_id}
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" id="u_pwd" name="u_pwd" value="${myinfo.u_pwd}"</td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input type="password" id="confirmPwd" name="confirmPwd" value="${myinfo.u_pwd}"></td>
                        </tr>
                        <tr>
                            <th rowspan="2">주소</th>
                            <td><input type="text" name="u_addr1" value="${myinfo.u_addr1}"></td>
                        </tr>

                        <tr>
                            <td>상세주소. 표 확인해보기</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="text" name="u_email" value="${myinfo.u_email}"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name="u_phone" value="${myinfo.u_phone}"></td>
                        </tr>
                    </table>
                </div>

                <div class="mypagePrivacyEditBtnC">
                    <button type="submit" name="action" class="mypagePrivacyEditBtn">
                         확인
                    </button>
                </div>
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