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

</head>


<body>
<jsp:include page="neviCenter.jsp" />
	<div class="mypage">
	    <div>개인정보확인</div><!--메뉴마다 수정-->
	    <div class="mypagePrivacyCheck">
	        <div>
	            <div>
	                <table class="mypagePrivacyCheckTable">
	                    <tr>
	                        <th>성명</th>
	                        <td>
	                            ${CMyinfo.c_name}
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>아이디</th>
	                        <td>
	                            ${CMyinfo.c_id}
	                        </td>
	                    </tr>

	                    <tr>
	                       <th rowspan="2">주소</th>
                           <td>
                                ${CMyinfo.c_addr1}
                           </td>
	                    </tr>
	                    <tr>
	                         <td>상세주소</td>
	                    </tr>
	                    <tr>
	                       <th>이메일</th>
                           <td>
                                ${CMyinfo.c_email}
                           </td>
	                    </tr>
	                     <tr>
                            <th>전화번호</th>
                            <td>
                                ${CMyinfo.c_phone}
                            </td>
                        </tr>
	                </table>
	            </div>

	            <div>

                    <form name="updateCenterPrivacy" method="post" action="${pageContext.request.contextPath}/centerUpdatePrivacy">
                        <input type="hidden" name="centerId" value="${centerId}">
                        <div class="mypagePrivacyCheckBtnC">
                            <button type="submit" name="edit" class="mypagePrivacyCheckBtn">수정</button>
                        </div>
                    </form>


                </div>
	        </div>

	    </div>
	</div>
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
</body>
</html