<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        function validateForm() {
            var chPw = document.getElementById("chPw").value;
            var chNPw = document.getElementById("chNPw").value;

            if (chPw === "") {
                alert("새로운 비밀번호를 입력해주세요.");
                return false;
            } else if (chNPw === "") {
                alert("비밀번호 확인을 입력해주세요.");
                return false;
            }

            if (chPw !== chNPw) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            return true;
        }

        function checkPasswordMatch() {
            var chPw = document.getElementById("chPw").value;
            var chNPw = document.getElementById("chNPw").value;
            var errorMessage = document.getElementById("reset_error-message");
            var submitButton = document.getElementById("submitButton");

            if (chPw !== chNPw) {
                errorMessage.style.display = "block";
                submitButton.disabled = true;
            } else {
                errorMessage.style.display = "none";
                submitButton.disabled = false;
            }
        }

        window.onload = function() {
            var chPw = document.getElementById("chPw");
            var chNPw = document.getElementById("chNPw");
            chPw.oninput = checkPasswordMatch;
            chNPw.oninput = checkPasswordMatch;
        };

        function goIndex() {
            window.location.href = "index";
        }

        function fn_process(){
            var _findPw = $("#findPw").val();
            var _findName = $("#findName").val();
            var _findEmail = $("#findEmail").val();
            var _findPh = $("#findPh").val();
            alert("찾으려는 유저의 아이디 : " + _findPw);

            $.ajax({
                type: "post",
                async: true,
                url: "${contextPath}/findPw.do",
                dataType: "text",
                data: {
                    userId: _findPw,
                    userName: _findName,
                    userEmail: _findEmail,
                    userPhone: _findPh
                },
                success: function (Result) {
                    if (Result == 'no') {
                        alert("아이디를 찾을수 없습니다.");
                    } else {
                        alert("비밀번호를 입력해주세요.");
                        $('pw').html('<div class="find_PPcontainer">'
                            + '<div class="find_input">'
                            + '<h1 class="find_bold">유저의 ID : ' + Result + '</h1>'
                            + '<form onsubmit="return validateForm()">'
                            + '<input id="chId" type="hidden" value="' + Result + '">'
                            + '<input id="chPw" type="password" class="find_text" placeholder="새로운 비밀번호 *" name="newPwd" required><br><br>'
                            + '<input id="chNPw" type="password" class="find_text" placeholder="새로운 비밀번호 확인 *" name="confirmPwd" required><br>'
                            + '<div id="reset_error-message" class="reset_error-message" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</div>'
                            + '<input class="reset_button" id="submitButton" type="button" value="등록" onClick="fn_process2()" disabled>'
                            + '</form></div></div>');

                        var chPw = document.getElementById("chPw");
                        var chNPw = document.getElementById("chNPw");
                        chPw.oninput = checkPasswordMatch;
                        chNPw.oninput = checkPasswordMatch;
                    }
                },
                error: function(data, textStatus){
                    alert("에러가 발생했습니다.");
                },
                complete: function(data, textStatus){}
            });
        }
        function closePopup() {
                    window.close();
                }
        function fn_process2(){
            var _chId = $("#chId").val();
            var _chPw = $("#chPw").val();
            alert("유저의 아이디 : " +_chId);
            alert("바뀐 유저의 비밀번호 : " + _chPw);

            $.ajax({
                type: "post",
                async: true,
                url: "${contextPath}/rePw.do",
                dataType: "text",
                data: {
                    userId: _chId,
                    userPw: _chPw
                },
                success: function (Result) {
                    if (Result == 'no') {
                        alert("비밀번호 변경 실패");
                    } else {
                        alert("비밀번호 변경을 완료했습니다.");
                        $('id').html('<div class="find_Pcontainer">'
                            + '<div class="find_input">'
                            + '<h1 class="find_tex">' + Result + '님 비밀번호를 변경 완료했습니다.</h1></div>'
                            + '<button onclick="closePopup()" class="find_button">확인</button>');
                    }
                },
                error: function(data, textStatus){
                    alert("에러가 발생했습니다.");
                },
                complete: function(data, textStatus){}
            });
        }
    </script>
    <script>
    const minWidth = 570;
    const minHeight = 820;

    // 팝업 창이 로드되었을 때 크기 조정
    window.onload = function() {
        if (window.innerWidth < minWidth || window.innerHeight < minHeight) {
            window.resizeTo(minWidth, minHeight);
        }
    };
    </script>
</head>
<body class="find">
    <img src="${pageContext.request.contextPath}/img/logo.png" width="450px" alt="로고" onclick="goIndex()">
    <div class="loginContainer">
        <id>
        <pw>
        <div class="find_PPPcontainer">
            <br><h3 class="find_bold">비밀번호 재설정</h3>
            <div class="findContainer">
                <input id="findPw" type="text" name="userId" placeholder="아이디 *" class="find_text">
            </div>
            <div class="findContainer">
                <input id="findName" type="text" name="userName" placeholder="이름 *" class="find_text">
            </div>
            <div class="findContainer">
                <input id="findEmail" type="text" name="userEmail" placeholder="이메일 *" class="find_text">
            </div>
            <div class="findContainer">
                <input id="findPh" type="text" name="userPhone" placeholder="전화번호 *" class="find_text">
            </div>
            <div class="findContainer1">
                <input id="centerRegBtnRM" class="find_button" type="button" value="확인" onClick="fn_process()" />
            </div>
        </div>
        </pw>
        </id>
    </div>
</body>
</html>
