<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <style>
        .mainVolistContainer {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .mainVolist {
            width: 230px;
            height: 230px;
            border: gray solid 1px;
            margin: 5px 5px 5px 5px;
            border radius: 5px;
        }

        .mainAnimalListAnimal-card {
            background-color: white;
            font-family: 'MangoDdobak-B';
            font-size: 15px;
            border: 1px solid #000;
            border-radius: 5px;
            width: 350px;
            margin: 0 auto;
            padding: 10px;
            box-sizing: border-box;
            text-align: left;
            height: 350px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .mainAnimalListAnimal-card img {
            max-width: 100%;
            height: 150px;
            border-radius: 5px;
        }

        .slider {
            width: 80%;
            margin: 0 auto;
        }

        .slick-prev:before, .slick-next:before {
            color: black;
        }

        .slider-container {
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid #000;
            padding: 20px;
            box-sizing: border-box;
            position: relative;
        }

        .arrow {
            font-size: 24px;
            cursor: pointer;
        }

        .arrow-left {
            position: absolute;
            left: 10px;
            z-index: 1;
        }

        .arrow-right {
            position: absolute;
            right: 10px;
            z-index: 1;
        }
    </style>
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
                                <c:forEach var="vo" items="${myVolunteerList}" begin="0" end="2">
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
             <form action="${pageContext.request.contextPath}/mypageVol" method="GET">
                                <input type="hidden" name="userId" value="${userId}">
                                <button type="submit" value="">전체보기</button>
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
                    <c:choose>
                        <c:when test="${empty myAdoptList}">
                            <tr>
                                <td colspan="3" class="centerNoData">표시할 데이터가 없습니다</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="advo" items="${myAdoptList}">
                                <tr>
                                    <td>${advo.c_name}</td>
                                    <td>${advo.visit_date}</td>
                                    <td>${advo.visit_time}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
        </div>



        <div class="mainTitle"><img src="./img/sole.png" alt="" class="">보호동물 목록</div>
        <div class="mainThirdStack">
            <div class="mainThirdMiddle">
                <div class="slider-container">
                    <span class="arrow arrow-left">&lt;</span>
                    <div class="slider" id="animalList">
                        <!-- 동물 카드가 여기에 표시됩니다 -->
                    </div>
                    <span class="arrow arrow-right">&gt;</span>
                </div>
            </div>
        </div>

        <div class="mainAllBtn">
            <form action="" method="post">
                <button type="submit" value="">전체보기</button>
            </form>
        </div>

        <div class="mainTitle"><img src="./img/sole.png" alt="" class="">모집마감일이 임박한 봉사정보</div>
        <div class="mainFourthStack">
            <div class="MainFourthMiddle">
                <div class="mainVolistContainer">
                    <c:choose>
                        <c:when test="${empty approachVolList}">
                            <div class="mainvoListNoData">표시할 데이터가 없습니다</div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="avo" items="${approachVolList}" begin="0" end="2">
                                <form name="main" method="post" action="volunteerDetail" encType="UTF-8">
                                    <div class="mainVolist">
                                        <table>
                                            <input type="hidden" name="v_no" value="${avo.v_no}" />
                                            <tr>
                                                <th>글 제목 :</th>
                                                <th><button type="submit">${avo.v_title}</button></th>
                                            </tr>
                                            <tr>
                                                <td>모집마감일 :</td>
                                                <td>${avo.v_rend_date}</td>
                                            </tr>
                                            <tr>
                                                <td>봉사시작일 :</td>
                                                <td>${avo.vreg_start_date}</td>
                                            </tr>
                                            <tr>
                                                <td>봉사 장소 :</td>
                                                <td>${avo.c_addr1}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </form>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="mainAllBtn">
            <form action="" method="post">
                <button type="submit" value="">전체보기</button>
            </form>
        </div>
    </div>

    <script>
        function loadAnimalList() {
            $.ajax({
                url: '/animalList',
                type: 'GET',
                data: { pageNo: 1, numOfRows: 12 }, // 한 페이지에 12개의 동물만 가져옴
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: 'json',
                success: function (response) {
                    console.log('Animal List:', response);
                    var animalList = $('#animalList');
                    animalList.empty();
                    response.animalList.forEach(function (animal) {
                        var card = '<div class="mainAnimalListAnimal-card">' +
                            '<img src="' + animal.popfile + '" alt="Animal Image">' +
                            '<div>공고번호 : ' + animal.noticeNo + '</div>' +
                            '<div>품종 : ' + animal.kindCd + '</div>' +
                            '<div>색상 : ' + animal.colorCd + '</div>' +
                            '<div>성별 : ' + animal.sexCd + '</div>' +
                            '<div>지역 : ' + animal.careAddr + '</div>' +
                            '</div>';
                        animalList.append(card);
                    });
                    $('#animalList').slick({
                        slidesToShow: 3,
                        slidesToScroll: 3,
                        dots: true,
                        infinite: true,
                        arrows: true,
                        autoplay: true,          // 자동 슬라이드 활성화
                        autoplaySpeed: 2000,
                        prevArrow: $('.arrow-left'),
                        nextArrow: $('.arrow-right'),
                    });
                },
                error: function () {
                    console.error('Failed to fetch animal list');
                }
            });
        }

        $(document).ready(function () {
            // 초기 데이터 로드
            loadAnimalList();
        });
    </script>
</body>
</html>
