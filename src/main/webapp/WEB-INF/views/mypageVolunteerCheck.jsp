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
	    <div><img src="./img/sole.png">봉사신청내역</div><!--메뉴마다 수정-->
	     <div class="mainFirstStack">
                    <div class="mainFirstMiddle">
                        <div>
                            <table>
                                    <tr>
                                        <th>보호소</th>
                                        <th>봉사시작일</th>
                                        <th>봉사종료일</th>
                                        <th>역할</th>
                                    </tr>
                                   <c:choose>
                                       <c:when test="${empty myVolunteerList}">
                                          <tr>
                                              <td colspan="4" class="centerNoData">표시할 데이터가 없습니다</td>
                                          </tr>
                                       </c:when>
                                       <c:otherwise>
                                                   <c:forEach var="vo" items="${myVolunteerList}"  begin="0" end="2">
                                                       <tr>
                                                           <td>${vo.c_name}</td>
                                                           <td>${vo.vreg_start_date}</td>
                                                           <td>${vo.vreg_end_date}</td>
                                                           <td>${vo.service_type}</td>
                                                       </tr>
                                                   </c:forEach>
                                   </c:otherwise>
                               </c:choose>
                               </table>
                        </div>
                    </div>

	            <div>

	            <form name="main" method="post" action="${pageContext.request.contextPath}/main">
	                <input type="hidden" name="userId" value="${userId}">
                	<div class="mypagePrivacyCheckBtnC">
                    	<button type="submit" name="main" class="mypagePrivacyCheckBtn">
                            <img src="./img/soleWhite.png">
                            메인으로
                        </button>
               		</div>
            </form>
            </div>
	        </div>

	    </div>
	</div>

</body>
</html