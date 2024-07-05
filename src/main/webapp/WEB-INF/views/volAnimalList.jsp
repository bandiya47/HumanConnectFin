<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Human_Connect</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .volAnimalListMain {
            width: 1100px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px;
        }
        .volAnimalListList {
            margin-top: 20px;
        }
        .volAnimalListList h2 {
            border-bottom: 1px solid black;
            padding: 5px;
            font-size: 40px;
            font-weight: bold;
            margin: 10px auto;
            font-family: 'NEXONFootballGothicBA1';
        }
        .volAnimalListAnimal-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .volAnimalListAnimal-card {
            background-color: white;
            font-family: 'MangoDdobak-B';
            font-size: 15px;
            border: 1px solid #000;
            border-radius: 5px;
            width: 24%;
            margin-bottom: 20px;
            padding: 10px;
            box-sizing: border-box;
            text-align: left;
            height: 350px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .volAnimalListAnimal-card img {
            max-width: 100%;
            height: 150px;
            border-radius: 5px;
        }
        .volAnimalListPagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto;
            list-style: none;
            padding: 0;
        }
        .volAnimalListPagination li {
            display: inline-block;
            margin: 0 5px;
        }
        .volAnimalListPagination a {
            text-decoration: none;
            color: black;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: inline-block;
            box-sizing: border-box;
        }
        .volAnimalListPagination a:hover {
            background-color: #ddd;
        }
        .volAnimalListPagination .active a {
            background-color: #FEAB82;
            color: white;
            border-radius: 5px;
        }
        .volAnimalListPagination a.disabled {
            color: #ddd;
            pointer-events: none;
        }
    </style>
</head>
<body>
<jsp:include page="nevi.jsp" />
<div class="volAnimalListContainer">
    <main class="volAnimalListMain">
        <section class="volAnimalListList">
            <h2>입양 목록 보기</h2>
            <div class="volAnimalListAnimal-list" id="animalList">
                <!-- 입양동물 리스트 -->
            </div>
            <ul id="volAnimalListPagination" class="volAnimalListPagination"></ul>
        </section>
    </main>
</div>
<script>
    function renderPagination(currentPage, totalPage) {
        const pagination = $('#volAnimalListPagination');
        pagination.empty();

        const pageLimit = 10; // 한 번에 표시할 페이지 수
        const startPage = Math.floor((currentPage - 1) / pageLimit) * pageLimit + 1;
        const endPage = Math.min(startPage + pageLimit - 1, totalPage);

        if (currentPage > 1) {
            pagination.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (currentPage - 1) + '">&laquo;</a></li>');
        }

        for (let i = startPage; i <= endPage; i++) {
            pagination.append('<li class="page-item ' + (i === currentPage ? 'active' : '') + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>');
        }

        if (currentPage < totalPage) {
            pagination.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (currentPage + 1) + '">&raquo;</a></li>');
        }

        // 페이지 클릭 이벤트 처리
        $('.page-link').on('click', function (e) {
            e.preventDefault();
            const page = $(this).data('page');
            loadAnimalList(page);
        });
    }

    function loadAnimalList(pageNo = 1) {
        $.ajax({
            url: '/animalList',
            type: 'GET',
            data: { pageNo: pageNo, numOfRows: 12 }, // numOfRows 값을 적절히 설정하세요
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            dataType: 'json',
            success: function (response) {
                console.log('Animal List:', response);
                var animalList = $('#animalList');
                animalList.empty();
                response.animalList.forEach(function (animal) {
                    var card = '<div class="volAnimalListAnimal-card">' +
                        '<img src="' + animal.popfile + '" alt="Animal Image">' +
                        '<div>공고번호 : ' + animal.noticeNo + '</div>' +
                        '<div>품종 : ' + animal.kindCd + '</div>' +
                        '<div>색상 : ' + animal.colorCd + '</div>' +
                        '<div>성별 : ' + animal.sexCd + '</div>' +
                        '<div>지역 : ' + animal.careAddr + '</div>' +
                        '</div>';
                    animalList.append(card);
                });
                renderPagination(response.currentPage, response.totalPage);
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
