
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body class="mainBody">
    <jsp:include page="nevi.jsp" />


    <div class="main">
        <div class="mainTitle"><img src="./img/sole.png" alt="" class="">봉사 신청내역</div>
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
                                           <c:forEach var="vo" items="${myVolunteerList}">
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
        </div>


        <div class="mainAllBtn">
            <form action="mypageVolunteerRecruitlist.html" method="post">
            <button type="submit" value="">전체보기></button>
            </form>
        </div>
        <div class="mainTitle"><img src="./img/sole.png" alt="" class="">입양 신청내역</div>
        <div class="mainSecondStack">
            <div class="mainSecondMiddle">
                <table>
                    <tr>
                        <th>보호소</th>
                        <th>날짜</th>
                        <th>시간</th>
                    </tr>
                    <tr>
                        <td>보호소</td>
                        <td>날짜</td>
                        <td>시간</td>
                    </tr>
                </table>

            </div>
            <div>

            </div>
        </div>

        <div class="mainAllBtn">
            <form action="mypageAdoptlist.html" method="post">
                <button type="submit" value="">전체보기></button>
                </form>
        </div>






        <div class="mainTitle"><img src="./img/sole.png" alt="" class="">보호동물 목록</div>
        <div class="mainThirdStack">
            <div class="mainThirdMiddle">
                    <div class="mainSlideContainer">
                        <span>버튼</span>
                        <div></div>
                        <div></div>
                        <div></div>
                        <span>버튼</span>
                    </div>

            </div>

        </div>
        <div class="mainAllBtn">

            <form action="" method="post">
            <button type="submit" value="">전체보기></button>
            </form>
        </div>




        <div class="mainTitle"><img src="./img/sole.png" alt="" class="">모집마감일이 임박한 봉사정보</div>
        <div class="mainFourthStack">
            <div class="MainFourthMiddle">

                <div class="mainVolistContainer">
                        <c:forEach var="avo" items="${approachVolList}" begin="0" end="2">
                            <form name="main" method="post" action="volunteerDetail" encType="UTF-8">
                                 <div class="mainVolist">
                                       <table>
                                            <input type="hidden" name="v_no" value="${avo.v_no }" />
                                            <tr>

                                                <th>
                                                    글 제목 :
                                                </th>
                                                <th>
                                                    <button type="submit">${avo.v_title} </button>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    모집마감일 :
                                                </td>
                                                <td>
                                                    ${avo.v_rend_date}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    봉사시작일 :
                                                </td>
                                                <td>
                                                    ${avo.vreg_start_date}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    봉사 장소 :
                                                </td>
                                                <td>
                                                    ${avo.c_addr1}
                                                </td>
                                            </tr>
                                       </table>
                                 </div>
                            </form>
                        </c:forEach>
                </div>

            </div>
        </div>


        <div class="mainAllBtn">
            <form action="" method="post">
            <button type="submit" value="">전체보기></button>
            </form>
        </div>


    </div>

    </body>
    </html>