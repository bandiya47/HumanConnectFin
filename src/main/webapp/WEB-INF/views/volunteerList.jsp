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
                            <th width="22%">봉사명</th>
                            <th width="12%">시작일</th>
                            <th width="12%">종료일</th>
                            <th width="12%">모집시작일</th>
                            <th width="12%">모집마감일</th>
                            <th width="10%">봉사</th>
                            <th width="8%">모집</th>
                            <th width="8%">신청</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${volunteerList}">
                            <tr>
                                <td class="volListNo">
                                    <a href="${pageContext.request.contextPath}/viewVolunteerDetail.do?userId=${userId}&v_no=${item.vNo}">${item.vNo}</a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/viewVolunteerDetail.do?userId=${userId}&v_no=${item.vNo}">${item.vTitle}</a>
                                </td>
                                <td>${item.vStartDate}</td>
                                <td>${item.vEndDate}</td>
                                <td>${item.vRstartDate}</td>
                                <td>${item.vRendDate}</td>
                                <td class="volListSer">
                                    <c:choose>
                                        <c:when test="${item.serviceCode == 1}">청소/배식</c:when>
                                        <c:when test="${item.serviceCode == 2}">산책</c:when>
                                        <c:when test="${item.serviceCode == 3}">목욕</c:when>
                                        <c:when test="${item.serviceCode == 4}">사진촬영</c:when>
                                        <c:when test="${item.serviceCode == 5}">미용</c:when>
                                        <c:when test="${item.serviceCode == 6}">이동</c:when>
                                        <c:when test="${item.serviceCode == 7}">의료</c:when>
                                        <c:otherwise>알 수 없음</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${item.vRegAmnt}명</td>
                                <td>${item.vMaxAmnt}명</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
         </div>
         <div class="pagination">
             <c:forEach var="page" begin="1" end="${totalPages}">
                 <a href="?userId=${userId}&page=${page}&size=10" class="${currentPage == page ? 'active' : ''}">${page}</a>
             </c:forEach>
         </div>
      </div>
   </div>

<script type="text/javascript"  src="${contextPath}/js/volunteerList.js" >
</script>

</body>
</html>