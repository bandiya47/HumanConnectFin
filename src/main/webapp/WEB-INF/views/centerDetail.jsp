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
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
      <style>
      body{
            background-color: #FDECCB;
      }
      </style>
</head>
<body>
<jsp:include page="nevi.jsp" />
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
    <div class="volunteerDetailDiv2">
                <div id="map" style="width:930px;height:400px;margin-bottom:20px"></div>
                <input id="findRoad" style="width:450px;height:45px;" type="text" placeholder=" 출발지 주소를 입력해주세요">
                <button class="volunteerDetailBtn" id="map-btn">길찾기</button>


    </div>
    <div class="button-container" style="border:none">
    <c:if test="${disable != 0}">
    <form method="post" action="${pageContext.request.contextPath}/volCenterList.do" encType="UTF-8">
        <input type="hidden" name="userId" value="${userId}">
        <input type="hidden" name="careNm" value="${requestScope.careInfo[0].careNm}">
        <button type="submit" class="volunteerDetailBtn" style="margin:10px;" >봉사 신청</button></form>
    </c:if>
    <c:if test="${disable == 0}">
        <button class="volunteerDetailBtn" style="background-color:gray;" >봉사 신청</button>
    </c:if>
        <button class="volunteerDetailBtn" data-toggle="modal" data-target="#myModal" style="margin:10px;" >입양 상담신청</button>

    </div>
    </div>


  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">


        <div class="modal-header">
          <h4 class="modal-title">입양상담 신청</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/adoptCenterList.do" encType="UTF-8">
        <div class="modal-body">
          방문일자 : <input name="visit_date" type="date"> 방문시간 : <input name="visit_time" type="time">
        </div>
        <div class="modal-footer">
        <input type="hidden" name="userId" value="${userId}">
        <input type="hidden" name="u_id" value="${userId}">
        <input type="hidden" name="c_name" value="${requestScope.careInfo[0].careNm}">
          <button type="submit" class="btn btn-secondary">신청</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    </div>
  </div>


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
                    		var mapbtn = document.getElementById('map-btn');
                    		mapbtn.addEventListener("click", function() {
                    		var findRoad = $("#findRoad").val();
                    			window.location = "https://map.kakao.com/?target=car&eName=${requestScope.careInfo[0].careAddr}&sName="+findRoad;
                    		})


    	</script>

</body>
</html>