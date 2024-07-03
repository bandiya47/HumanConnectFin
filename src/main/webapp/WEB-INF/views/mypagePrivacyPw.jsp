
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
    <link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<title>Human Connect</title>

<body>
<jsp:include page="nevi.jsp" />

<div class="mypage">
    <div> <img src="./img/sole.png">개인정보확인</div>
    <div class="mypagePrivacyPw">
        <div class="mypagePrivacyPwNoti">
            <div>개인정보 수정을 위해 <br> 비밀번호 확인이 필요합니다.</div>
            <form action="MypagePw" method="post" action="${contextPath}/mypagePrivacyCheck.do">

                <%-- *********폼 방식 페이지 맵핑: 다음 페이지 : mypagePrivacyCheck.do*********** --%>

                <div class="mypagePrivacyPwInputPW2">
                    <input type="password" name="password" required>
                    <label>password</label>
                    <span></span>
                </div>
                <button type="submit" id="" class="mypagePrivacyPwCheckBtn1">
                    <img src="./img/soleWhite.png" alt="Submit">
                    <span>제출</span>
                </button>
                <!--맵핑 필요 : myPrivacyCheck-->
            </form>
        </div>

    </div>
</div>

</body>
</html>