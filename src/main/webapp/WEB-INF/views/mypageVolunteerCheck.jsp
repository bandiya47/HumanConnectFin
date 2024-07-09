<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPage Volunteer Check</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>

        .mypageMain{
            margin: 60px auto 0;
            width: 980px;
        }

        .mypageMainTitle{                             /*큰제목*/
            font-size: 27px;
            font-weight: bold;
            margin-bottom: 10px;                /*큰제목 아래 간격*/
            /*테스트용
            width: 980px;
            border: 1px solid black;*/

            >img{
                width: 27px;
                height: 27px;
            }
        }


        .mypageMainFirstStack{                          /*1층 봉사신청내역*/
           /* display: flex;*/


        }
        .mypageMainFirstMiddle{
            width: 980px;
            border: gray solid 1px;
            border-radius: 5px;
            background-color: white;
            >div>table {
                width: 100%;
                border-collapse: collapse;
                font-family: 'MangoDdobak-B';
                font-size : 20px;
                tbody{
                    >tr>th {
                        background-color : #463933;
                        vertical-align : middle;
                        color : white;
                        font-weight : bold;
                        padding : 15px;
                    }
                    >tr>td {
                    border: none;
                    font-size : 18px;
                    height : 80px;
                    text-align: center;
                    vertical-align : middle;
                    border-bottom : 1px solid #aaa;
                    }
                }
            }
        }


    </style>
</head>
<body>
    <jsp:include page="nevi.jsp" />

    <div class="mypageMain">
        <div class="mypageMainTitle"><img src="./img/sole.png" alt="" class="">봉사신청 전체내역</div>
        <div class="mypageMainFirstStack">
            <div class="mypageMainFirstMiddle">
                <div>
                    <table>
                        <tr>
                            <th>보호소</th>
                            <th>봉사시작일</th>
                            <th>봉사종료일</th>
                            <th>역할</th>
                        </tr>


                        <c:choose>
                            <c:when test="${empty mypageVolunteerList}">
                                <tr>
                                    <td colspan="4" class="centerNoData">표시할 데이터가 없습니다</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="vol" items="${mypageVolunteerList}" >
                                    <tr>
                                        <td>${vol.c_name}</td>
                                        <td>${vol.vreg_start_date}</td>
                                        <td>${vol.vreg_end_date}</td>
                                        <td>${vol.service_type}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table>
                </div>
            </div>
        </div>



    </div>
</body>
</html>