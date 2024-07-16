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

        function validatePassword() {
            console.log("validatePassword 호출됨"); // 함수 호출 여부 확인용 로그
            const password = document.getElementById("c_pwd").value;
            const confirmPassword = document.getElementById("confirmPwd").value;
            if (password !== confirmPassword) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<jsp:include page="neviCenter.jsp" />
<form name="centerSavePrivacy" method="post" action="centerSavePrivacy" onsubmit="return validatePassword()">
    <input type="hidden" name="centerId" value="${centerId}">
    <!--여기부터 아래 내용 메인-->
    <div class="mypage">
        <div>개인정보수정</div>
        <div class="mypagePrivacyEdit">
            <div>
                <div>
                    <table class="mypagePrivacyEditTable">
                        <tr>
                            <th>성명</th>
                            <td>${CMyinfo.c_name}</td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td>${CMyinfo.c_id}</td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" id="c_pwd" name="c_pwd" value="${CMyinfo.c_pwd}"></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input type="password" id="confirmPwd" name="confirmPwd" value="${CMyinfo.c_pwd}"></td>
                        </tr>
                        <tr>
                            <th rowspan="2">주소</th>
                            <td><input type="text" name="c_addr1" value="${CMyinfo.c_addr1}"></td>
                        </tr>
                        <tr>
                            <td>상세주소. 표 확인해보기</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="text" name="c_email" value="${CMyinfo.c_email}"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name="c_phone" value="${CMyinfo.c_phone}"></td>
                        </tr>
                    </table>
                </div>
                <div class="mypagePrivacyEditBtnC">
                    <button type="submit" name="action" action="centerSavePrivacy" class="mypagePrivacyEditBtn" >


                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>