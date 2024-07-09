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
                <button type="submit" value="">나의봉사내역</button>
            </form>
        </div>
    </nav>



    <form name="savePrivacy" method="post" action="savePrivacy" onsubmit="return validatePassword()">
    <input type="hidden" name="u_id" value="${myinfo.u_id}">
    <!--여기부터 아래 내용 메인-->
    <div class="mypage">
        <div><img src="./img/sole.png">개인정보수정</div><!--메뉴마다 수정-->
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
                        <img src="./img/soleWhite.png">
                        확인
                    </button>
                </div>
                </form>
                <div>

                    <input type="button" value="탈퇴" name="action" class="mypagePrivacyEditWithdraw">
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