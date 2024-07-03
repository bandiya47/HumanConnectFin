<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>



<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<jsp:include page="neviCenter.jsp" />
<div class="volunteerDetailDiv">
    <h3>보호센터 상세</h3>
        <table class="volunteerDetailTable">


    <c:set var="careInfo" value="${requestScope.careInfo}" />
    <c:forEach var="careInfoMap" items="${careInfo}">
        <tr>
            <td class="volunteerDetailTd">보호소 명</td>
            <td>${careInfoMap.careNm}</td>
        <tr>

        <tr>
            <td class="volunteerDetailTd">주소</td>
            <td>${careInfoMap.careAddr}</td>
        <tr>

        <tr>
            <td class="volunteerDetailTd">대표번호</td>
            <td>${careInfoMap.careTel}</td>
        </tr>
        <tr>
            <td class="volunteerDetailTd">구조대상동물</td>
            <td>${careInfoMap.saveTrgtAnimal}</td>
        </tr>
        </c:forEach>
    </table>
    </div>
    <div id="map" style="width:500px;height:400px;"></div>


    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28e5917c9e3ed76a6b445116b2d205a7&libraries=services"></script>
    	<script>
    		var mapContainer = document.getElementById('map'),
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667),
                    level: 3
                };


            var map = new kakao.maps.Map(mapContainer, mapOption);


            var geocoder = new kakao.maps.services.Geocoder();


            geocoder.addressSearch("${requestScope.careInfo[0].careAddr}", function(result, status) {


                 if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);


                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });


                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">${requestScope.careInfo[0].careNm}</div>'
                    });
                    infowindow.open(map, marker);


                    map.setCenter(coords);
                }
            });
    	</script>
</body>
</html>