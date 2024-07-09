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
         <div class="volunteerListCategoryContainer">
            <button onclick="addFilter('청소/배식')">청소/배식</button>
            <button onclick="addFilter('산책')">산책</button>
            <button onclick="addFilter('목욕')">목욕</button>
            <button onclick="addFilter('사진')">사진</button>
            <button onclick="addFilter('미용')">미용</button>
            <button onclick="addFilter('이동')">이동</button>
            <button onclick="addFilter('의료')">의료</button>
         </div>
         <div id="volunteerListFilterContainer"></div>

         <table class="volunteerListFilterInput">
            <tr>
               <td>봉사기간 <input name="wantDay" type="date"></td>
               <td>봉사명 <input name="volSearchInput" type="search" placeholder="봉사명을 입력하세요"></td>
               <td>센터명 <input name="ctrSearchInput" type="search" placeholder="센터명을 입력하세요"></td>
               <td>지역 <select onchange="selectRegion(this)">
                     <option>행정구역 선택</option>
                     <option value="all">전체</option>
                     <option value="seoul">서울특별시</option>
                     <option value="kyungki">경기도</option>
                     <option value="chungnam">충청남도</option>
                     <option value="chungbuk">충청북도</option>
                     <option value="kangwon">강원도</option>
                     <option value="jeonnam">전라남도</option>
                     <option value="jeonbuk">전라북도</option>
                     <option value="kyungnam">경상남도</option>
                     <option value="kyungbuk">경상북도</option>
                     <option value="jeju">제주시</option>
               </select> <select id="volunteerListSelectCity">
                     <option>도시 선택</option>
               </select>
               </td>
            </tr>
         </table>

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