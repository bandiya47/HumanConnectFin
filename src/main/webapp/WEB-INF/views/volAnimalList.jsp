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
        body {
            margin: 0 auto;
        }
        .volAnimalListMain {
            width: 1100px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px;
        }
        .volAnimalListSearch, .volAnimalListList {
            margin-top: 20px;
        }
        .volAnimalListSearch h2 {
            text-align: center;
        }
        .volAnimalListSearch-box {
            display: flex;
            justify-content: center;
        }
        .volAnimalListSearch-table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        .volAnimalListSearch-table td {
            border: 1px solid #000;
            padding: 10px;
            text-align: left;
        }
        .volAnimalListSearch-table .volAnimalListSelected-filters {
            border: 1px solid #000;
            padding: 10px;
        }
        .volAnimalListSearch-table .volAnimalListSelected-filters div {
            margin-bottom: 10px;
        }
        .volAnimalListSearch-table .volAnimalListSelected-filters button {
            margin-left: 10px;
        }
        .volAnimalListAnimal-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .volAnimalListAnimal-card {
            border: 1px solid #000;
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
            height: auto;
            max-height: 200px;
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
        .volAnimalListList {
            margin: 0 auto;
        }
    </style>
</head>
<body>
<jsp:include page="nevi.jsp" />
<div class="volAnimalListContainer">
    <main class="volAnimalListMain">
        <section class="volAnimalListSearch">
            <h2>입양 정보 검색</h2>
            <div class="volAnimalListSearch-box">
                <form id="volAnimalListFilterForm">
                    <table class="volAnimalListSearch-table">
                        <tr>
                            <td>도 선택</td>
                            <td>
                                <select id="volAnimalListSido" name="sido"></select>
                            </td>
                            <td rowspan="3" class="volAnimalListSelected-filters">
                                <div>도: <span id="selectedSido"></span> <button type="button" onclick="removeFilter('sido')">삭제</button></div>
                                <div>지역(구/시): <span id="selectedSigungu"></span> <button type="button" onclick="removeFilter('sigungu')">삭제</button></div>
                                <div>종: <span id="selectedKind"></span> <button type="button" onclick="removeFilter('kind')">삭제</button></div>
                                <button type="submit">검색</button>
                            </td>
                        </tr>
                        <tr>
                            <td>지역(구/시) 선택</td>
                            <td>
                                <select id="volAnimalListSigungu" name="sigungu"></select>
                            </td>
                        </tr>
                        <tr>
                            <td>종 선택</td>
                            <td>
                                <select id="volAnimalListKind" name="kind">
                                    <option value="">선택</option>
                                    <option value="개">개</option>
                                    <option value="고양이">고양이</option>
                                    <option value="기타">기타</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" id="volAnimalListSidoText" name="sidoText">
                    <input type="hidden" id="volAnimalListSigunguText" name="sigunguText">
                    <input type="hidden" id="volAnimalListKindText" name="kindText">
                    <input type="hidden" id="volAnimalListPageNo" name="pageNo" value="1">
                </form>
            </div>
        </section>
        <section class="volAnimalListList">
            <h2>입양 목록 보기</h2>
            <div class="volAnimalListAnimal-list" id="animalList">
                <!-- 동물 카드가 여기에 표시됩니다 -->
            </div>
            <ul id="volAnimalListPagination" class="volAnimalListPagination"></ul>
        </section>
    </main>
</div>
<script>
    function removeFilter(type) {
        switch (type) {
            case 'sido':
                $('#volAnimalListSido').val('');
                $('#selectedSido').text('');
                break;
            case 'sigungu':
                $('#volAnimalListSigungu').val('');
                $('#selectedSigungu').text('');
                break;
            case 'kind':
                $('#volAnimalListKind').val('');
                $('#selectedKind').text('');
                break;
        }
        $('#volAnimalListPageNo').val(1);
        $('#volAnimalListFilterForm').submit();
    }

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
            $('#volAnimalListPageNo').val(page);
            $('#volAnimalListFilterForm').submit();
        });
    }

    $(document).ready(function () {
        // 시도 목록 로드
        $.ajax({
            url: '/sidoList',
            type: 'GET',
            contentType: 'application/json; charset=UTF-8',
            dataType: 'json',
            success: function (response) {
                console.log('Sido List:', response);
                var sidoSelect = $('#volAnimalListSido');
                sidoSelect.append('<option value="">도 선택</option>');
                response.forEach(function (sidoList) {
                    sidoSelect.append('<option value="' + sidoList.code + '">' + sidoList.name + '</option>');
                });
            },
            error: function () {
                console.error('Failed to fetch sido list');
            }
        });

        // 시군구 목록 로드
        $('#volAnimalListSido').change(function () {
            var uprCd = $(this).val();
            var selectedText = $(this).find('option:selected').text();
            $('#selectedSido').text(selectedText);
            $('#volAnimalListSidoText').val(selectedText); // hidden input에 텍스트 값 설정
            $.ajax({
                url: '/sigunguList',
                type: 'GET',
                data: { uprCd: uprCd },
                contentType: 'application/json; charset=UTF-8',
                dataType: 'json',
                success: function (response) {
                    console.log('Sigungu List:', response);
                    var sigunguSelect = $('#volAnimalListSigungu');
                    sigunguSelect.empty();
                    sigunguSelect.append('<option value="">지역(구/시) 선택</option>');
                    response.forEach(function (sigungu) {
                        sigunguSelect.append('<option value="' + sigungu.code + '">' + sigungu.name + '</option>');
                    });
                },
                error: function () {
                    console.error('Failed to fetch sigungu list');
                }
            });
        });

        $('#volAnimalListSigungu').change(function () {
            var selectedText = $(this).find('option:selected').text();
            $('#selectedSigungu').text(selectedText);
            $('#volAnimalListSigunguText').val(selectedText); // hidden input에 텍스트 값 설정
        });

        $('#volAnimalListKind').change(function () {
            var selectedText = $(this).find('option:selected').text();
            $('#selectedKind').text(selectedText);
            $('#volAnimalListKindText').val(selectedText); // hidden input에 텍스트 값 설정
        });

        // 동물 목록 필터 폼 제출
        $('#volAnimalListFilterForm').submit(function (event) {
            event.preventDefault();
            var formData = $(this).serialize();
            $.ajax({
                url: '/animalList',
                type: 'GET',
                data: formData,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: 'json',
                success: function (response) {
                    console.log('Animal List:', response);
                    var animalList = $('#animalList');
                    animalList.empty();
                    response.animalList.forEach(function (animal) {
                        var card = '<div class="volAnimalListAnimal-card">' +
                            '<img src="' + animal.popfile + '" alt="Animal Image">' +
                            '<div>공고번호 : ' + animal.desertionNo + '</div>' +
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
        });

        // 초기 데이터 로드
        $('#volAnimalListFilterForm').submit();
    });
</script>
</body>
</html>
