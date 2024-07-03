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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>


<body>
<jsp:include page="nevi.jsp" />
	<div class="mypage">
	    <div><img src="./img/sole.png">개인정보확인</div><!--메뉴마다 수정-->
	    <div class="mypagePrivacyCheck">
	        <div>
	            <div>
	                <table class="mypagePrivacyCheckTable">
	                    <tr>
	                        <th>성명</th>
	                        <td>${myinfo.u_name}</td>
	                    </tr>
	                    <tr>
	                        <th>아이디</th>
	                        <td>${myinfo.u_id}</td>
	                    </tr>

	                    <tr>
	                       <th rowspan="2">주소</th>
                           <td>${myinfo.u_addr1}</td>
	                    </tr>
	                    <tr>
	                         <td>상세주소</td>
	                    </tr>
	                    <tr>
	                       <th>이메일</th>
                           <td>${myinfo.u_email}</td>
	                    </tr>
	                     <tr>
                            <th>전화번호</th>
                            <td>${myinfo.u_phone}</td>
                        </tr>
	                </table>
	            </div>

	            <div>
	            <form name="privacyEdit" method="post" action="${pageContext.request.contextPath}/myprivacyEdit">
                	<div class="mypagePrivacyCheckBtnC">
                    	<button type="submit" name="edit" class="mypagePrivacyCheckBtn">
                            <img src="./img/soleWhite.png">
                            수정
                        </button>
               		</div>
            </form></div>
	        </div>

	    </div>
	</div>

</body>
</html