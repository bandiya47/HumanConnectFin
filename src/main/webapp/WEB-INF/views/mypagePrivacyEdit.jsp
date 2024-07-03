<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="dc.human.gbnb.humanConnect.dto.UserDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    
</head>
<body>
<jsp:include page="nevi.jsp" />
    <form name="privacyEdit" method="post" action="${contextPath}/mypagePrivacyCheck.do">
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
                            <td><input type="text" name="u_pwd"></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input type="text" name="u_pwdCheck"></td>
                        </tr>
                        <tr>
                            <th rowspan="2">주소</th> <!--이거 확인해보기 표 보더 만들어서-->
                            <td>주소DB</td>                     
                        </tr>
    
                        <tr>                        
                            <td>상세주소. 표 확인해보기</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="text" name="u_email" value="${privacyList[0].u_email}"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name="u_phone" value="${privacyList[0].u_phone}"></td>
                        </tr>
                    </table>
                </div>
                <div><input type="button" value="탈퇴" name="action" class="mypagePrivacyEditWithdraw"></div>
                <div class="mypagePrivacyEditBtnC">
                    <button type="submit" name="action" class="mypagePrivacyEditBtn">
                        <img src="./img/soleWhite.png">
                        확인
                    </button>
                </div>   
            </div>
            
        </div>
    </div>
    </form>
    </body>
    </html>