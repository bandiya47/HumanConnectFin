<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기 결과</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<script type="text/javascript">
    function closeWindow() {
        window.close(); // 현재 창 닫기
    }
</script>
</head>
<body class="find">
    <a href="index.jsp">
        <img src="img/logo.png" class="find_logo">
    </a>
    <br>
    <div class="find_Rcontainer">
        <h1 class="find_bold">아이디 찾기 결과</h1>
        <%@ page import="dc.human.gbnb.humanConnect.login.vo.FindIdVO" %>
        <%
             FindIdVO result = (FindIdVO) request.getAttribute("result");
             String userId = result != null ? result.getU_Id() : null;
             if (userId != null && !userId.isEmpty()) {
        %>
            <p class="find_Text">당신의 아이디는 "<%= userId %>" 입니다!</p>
        <%
            } else {
        %>
            <p class="find_Text">해당 정보로 등록된 아이디가 없습니다.</p>
        <%
            }
        %>
        <a href="findId" class="find_button">다시 시도</a>
        <a href="viewFindPw.do" class="find_button">비밀번호 재설정</a>
        <a href="javascript:closeWindow()" class="find_button">로그인 하기</a>
    </div>
</body>
</html>