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
    <title>HumanConnect</title>
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

<header>                        <!--헤더-->
    <div class="neviBack"><img src="./img/imsiback.jpg" alt=""></div>
    <div class="neviFor">
        <div class="neviTop">   <!--최상단-->
            <div>
                <form action="logout" method="post">
                   <button type="submit" value="">로그아웃</button>
                </form>
                <form action="mypagePrivacyPw.jsp">
                        <button type="submit" value="">마이페이지</button>
                </form>
            </div>
        </div>
        <div class="nevi">      <!--네비게이션-->
            <span>              <!--로고-->
                <img src="./img/logo.png" alt="" class="" onclick="goMain()"></span>
            <span>
                <ul>            <!--네비게이션바-->
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">

                            <form action="test">
                                <input type="submit" value="봉사신청">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="보호동물">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="보호센터">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="실종/제보">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="고객센터">
                            </form>
                        </div>
                    </li>
                </ul>
            </span>
        </div>
    </div>
</header>


<!--여기부터 아래 내용 정상적용 되는지 확인-->
<div class="main"></div>

</body>
</html>
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
               <td>봉사명 <input name="volSearchInput" type="search"></td>
               <td>센터명 <input name="ctrSearchInput" type="search"></td>
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





<table border="1">
    <thead>
    <tr>
        <th>No</th>
        <th>Title</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Start Time</th>
        <th>Last Time</th>
        <th>Rstart Date</th>
        <th>Rend Date</th>
        <th>Service Code</th>
        <th>Max Amount</th>
        <th>Reg Amount</th>
        <th>State</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${volunteerList}">
        <tr>
            <td>
            <form method="get" action="${pageContext.request.contextPath}/viewVolunteerDetail.do" encType="UTF-8">
            <input type="hidden" name="userId" value="jhjeong">
            <input type="hidden" name="v_no" value="${item.vNo}">
            <input type="submit" value="${item.vNo}">
            </form>
            </td>
            <td>${item.vTitle}</td>
            <td>${item.vStartDate}</td>
            <td>${item.vEndDate}</td>
            <td>${item.vStartTime}</td>
            <td>${item.vLastTime}</td>
            <td>${item.vRstartDate}</td>
            <td>${item.vRendDate}</td>
            <td>${item.serviceCode}</td>
            <td>${item.vMaxAmnt}</td>
            <td>${item.vRegAmnt}</td>
            <td>${item.vState}</td>
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

<script type="text/javascript"  src="/js/volunteerList.js" >
</script>
</body>
</html>

