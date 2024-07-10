<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page import="dc.human.gbnb.humanConnect.volunteer.vo.VolunteerListVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HumanConnect</title>

<link rel="stylesheet" href="./css/style.css">
</head>
<body class="volListBody">


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect 봉사신청 리스트</title>

    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script>
       function goMain() {
          window.location.href = "mainRequestTest";
          <!--경로설정. 나중에서블릿으로 바꿔야함/ 센터메인의 경우 센터메인으로 바꾸기-->
       }
    </script>
<!--####################css 경로 바꾸기/ img 경로 바꾸기####################-->
</head>

<body>
    <jsp:include page="nevi.jsp" />
	<!--전체 div-->
   <div class="volunteerListWholeContainer">
      <div>
         <div class="volunteerListVolRecruitList">
            <p>구인 리스트</p>
            <div>
                <table class="volListFTable">
                    <thead>
                        <tr>
                            <th width="6%">번호</th>
                            <th width="25%">봉사명</th>
                            <th width="10%">시작일</th>
                            <th width="10%">종료일</th>
                            <th width="10%">모집시작일</th>
                            <th width="10%">모집마감일</th>
                            <th width="6%">봉사구분</th>
                            <th width="6%">모집인원</th>
                            <th width="6%">신청인원</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${volunteerList}">
                            <tr>
                                <td>
                                    <form method="get" action="${pageContext.request.contextPath}/viewVolunteerDetail.do" encType="UTF-8">
                                        <input type="hidden" name="userId" value="${userId}">
                                        <input type="hidden" name="v_no" value="${item.vNo}">
                                        <input class="vNoInput" type="submit" value="${item.vNo}">
                                    </form>
                                </td>
                                <td>${item.vTitle}</td>
                                <td>${item.vStartDate}</td>
                                <td>${item.vEndDate}</td>
                                <td>${item.vRstartDate}</td>
                                <td>${item.vRendDate}</td>
                                <td>${item.serviceCode}</td>
                                <td>${item.vRegAmnt}명</td>
                                <td>${item.vMaxAmnt}명</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                    <span class="active">1</span>
                    <a href="test?page=2">2</a>
                    <a href="test?page=3">3</a>
                    <a href="test?page=4">4</a>
                    <a href="test?page=5">5</a>
                    <a href="test?page=6">6</a>
                    <a href="test?page=2">다음 &raquo;</a>
             </div>
         </div>
      </div>
   </div>

<script type="text/javascript"  src="${contextPath}/js/volunteerList.js" >
</script>

</body>
</html>