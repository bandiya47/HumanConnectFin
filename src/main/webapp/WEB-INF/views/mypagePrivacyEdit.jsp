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
        <script type="text/javascript">
            function validatePassword() {
                var password = document.getElementById("u_pwd").value;
                var confirmPassword = document.getElementById("confirmPwd").value;

                if (password != confirmPassword) {
                    alert("비밀번호가 일치하지 않습니다.");
                    return false;
                }
                return true;
            }
        </script>
</head>
<body>
<jsp:include page="nevi.jsp" />
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

    </body>
    </html>