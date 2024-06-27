<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="/css/style.css">
        <style>


        </style>
           <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
           <script type="text/javascript">
           $(document).ready(function() {
                                var job ="${job}";

                              if(job == "view"){


                                   var v_no = "${centerList[0].v_no}";
                                   var vTitle = "${centerList[0].vTitle}";
                                   var vStartDate = "${centerList[0].vStartDate}";
                                   var vEndDate = "${centerList[0].vEndDate}";
                                   var vStartTime = "${centerList[0].vStartTime}";
                                   var vLastTime = "${centerList[0].vLastTime}";
                                   var vRStartDate = "${centerList[0].vRStartDate}";
                                   var vREndDate = "${centerList[0].vREndDate}";
                                   var vWorkingDay = "${centerList[0].vWorkingDay}";
                                   var vServiceCode = "${centerList[0].vServiceType}";
                                   var vServiceCode2 ="${centerList[0].vServiceCode}";
                                   var vRegAmnt = "${centerList[0].vRegAmnt}";
                                   var vUploadFilePath = "${centerList[0].vUploadFilePath}";
                                   var vInfo = "${centerList[0].vInfo}";



                                   $( 'h2' ).html( '<h1>'+vTitle+'</h1>' );

                                   $('#vDate').remove();
                                   $( 'vDate' ).html( '<h1>' + vStartDate + ' ~ ' + vEndDate + '</h1>' );

                                   $('#vTime').remove();
                                   $( 'vTime' ).html( '<h1>' + vStartTime + ' ~ ' + vLastTime + '</h1>' );

                                   $('#rDate').remove();
                                   $( 'rDate' ).html( '<h1>' + vRStartDate + ' ~ ' + vREndDate + '</h1>' );

                                   $('#work').remove();
                                   $( 'work' ).html( '<h1>' + vWorkingDay + '</h1>' );

                                   $('#vRegAmnt').remove();
                                   $( 'vRegAmnt' ).html( '<h1>' + vRegAmnt + '</h1>' );

                                   $('#serviceCode').remove();
                                   $( 'serviceCode' ).html( '<h1>' + vServiceCode + '</h1>' );

                                   $('#file').remove();
                                   $( 'file' ).html( '<h1>' + vUploadFilePath + '</h1>' );

                                   $('#info').remove();
                                   if( vInfo == "없음" ){
                                   $( 'info' ).html( '<h1>' + vInfo + '</h1>' );
                                   }else{
                                   $( 'info' ).html( '<h1 style="text-align : left">' + vInfo + '</h1>' );
                                   }



                              }

                              if(job == "modify"){

                                       	                                       var v_no = "${centerList[0].v_no}";

                                                                                 var vTitle = "${centerList[0].vTitle}";

                                                                                 var vStartDate = "${centerList[0].vStartDate}";
                                                                                 var vEndDate = "${centerList[0].vEndDate}";
                                                                                 var vStartTime = "${centerList[0].vStartTime}";
                                                                                 var vLastTime = "${centerList[0].vLastTime}";
                                                                                 var vRStartDate = "${centerList[0].vRStartDate}";
                                                                                 var vREndDate = "${centerList[0].vREndDate}";
                                                                                 var vWorkingDay = "${centerList[0].vWorkingDay}";
                                                                                 var vServiceCode = "${centerList[0].vServiceType}";
                                                                                 var vServiceCode2 ="${centerList[0].vServiceCode}";
                                                                                 var vRegAmnt = "${centerList[0].vRegAmnt}";
                                                                                 var vUploadFilePath = "${centerList[0].vUploadFilePath}";
                                                                                 var vInfo = "${centerList[0].vInfo}";


                                          	               document.getElementById("title").value = vTitle;
                                          	               document.getElementById("startDate").value = vStartDate;
                                          	               document.getElementById("endDate").value = vEndDate;
                                          	               document.getElementById("startTime").value = vStartTime;
                                          	               document.getElementById("endTime").value = vLastTime;
                                          	               document.getElementById("rStartDate").value = vRStartDate;
                                          	               document.getElementById("rEndDate").value = vREndDate;


                                                            var wokr1 = vWorkingDay.indexOf("월");
                                                            var wokr2 = vWorkingDay.indexOf("화");
                                                            var wokr3 = vWorkingDay.indexOf("수");
                                                            var wokr4 = vWorkingDay.indexOf("목");
                                                            var wokr5 = vWorkingDay.indexOf("금");
                                                            var wokr6 = vWorkingDay.indexOf("토");
                                                            var wokr7 = vWorkingDay.indexOf("일");

                                                            if(wokr1!=-1){
                                                                document.getElementById("work1").checked = true;
                                                            }
                                                            if(wokr2!=-1){
                                                                document.getElementById("work2").checked = true;
                                                            }
                                                            if(wokr3!=-1){
                                                                document.getElementById("work3").checked = true;
                                                            }
                                                            if(wokr4!=-1){
                                                               document.getElementById("work4").checked = true;
                                                            }
                                                            if(wokr5!=-1){
                                                               document.getElementById("work5").checked = true;
                                                            }
                                                            if(wokr6!=-1){
                                                               document.getElementById("work6").checked = true;
                                                            }
                                                            if(wokr7!=-1){
                                                               document.getElementById("work7").checked = true;
                                                            }


                                                            vInfo=vInfo.replace(/<br>/g, "\n");



                                          	               document.getElementById("vRegAmnt").value = vRegAmnt;
                                          	               document.getElementById("serviceCode").value = vServiceCode2;

                                          	               document.getElementById("info").value = vInfo;



                                       	}

                          });
           </script>
           <script type="text/javascript">



	           function fn_process(){
                   var _uId = "${centerId}";
	               var _title=$("#title").val();
	               var _startDate=$("#startDate").val();
	               var _endDate=$("#endDate").val();
	               var _startTime=$("#startTime").val();
	               var _endTime=$("#endTime").val();
	               var _rStartDate=$("#rStartDate").val();
	               var _rEndDate=$("#rEndDate").val();


	               var _vWorkingDay = "";
	               var _work1=$("#work1").prop("checked");
	               var _work2=$("#work2").prop("checked");
	               var _work3=$("#work3").prop("checked");
	               var _work4=$("#work4").prop("checked");
	               var _work5=$("#work5").prop("checked");
	               var _work6=$("#work6").prop("checked");
	               var _work7=$("#work7").prop("checked");
	               if(_work1==1){
	                    _vWorkingDay +=$("#work1").val();
	                    _vWorkingDay +=" ";
	               }
	               if(_work2==1){
	                    _vWorkingDay +=$("#work2").val();
	                    _vWorkingDay +=" ";
	               }
	               if(_work3==1){
                        _vWorkingDay +=$("#work3").val();
                        _vWorkingDay +=" ";
	               }
	               if(_work4==1){
                        _vWorkingDay +=$("#work4").val();
                        _vWorkingDay +=" ";
	               }
	               if(_work5==1){
                        _vWorkingDay +=$("#work5").val();
                        _vWorkingDay +=" ";
	               }
	               if(_work6==1){
                        _vWorkingDay +=$("#work6").val();
                        _vWorkingDay +=" ";
	               }
	               if(_work7==1){
                        _vWorkingDay +=$("#work7").val();
                        _vWorkingDay +=" ";
                   }

	               var _vRegAmnt=$("#vRegAmnt").val();
	               var _serviceCode=$("#serviceCode").val();
	               var _file=$("#file").val();
	               var _info=$("#info").val().replace(/\n/g, "<br>");


	               if(_title==''){
	                     alert("제목을 입력하세요");
	                     return;
	               }else if(_startDate=='' || _endDate=='' ){
	                   alert("봉사시간을 입력하세요");
	                   return;
	               }else if(_startTime=='' || _endTime=='' ){
	                   alert("봉사시간을 입력하세요");
	                   return;
	               }else if(_rStartDate=='' || _rEndDate=='' ){
	                   alert("모집기간을 입력하세요");
	                   return;
	               }else if(_vWorkingDay==''){
	                   alert("봉사요일을 체크하세요");
	                   return;
	               }else if(_vRegAmnt=='' ){
	                   alert("모집인원을 입력하세요");
	                   return;
	               }else if(_serviceCode=='' ){
	                   alert("봉사분야를 체크하세요");
	                   return;
	               }else if(_file){
	                   var formData = new FormData();
                       var inputFile = $("input[name='vUploadFilePath']");
                       var files = inputFile[0].files;
                       formData.append("uploadFile", files[0]);

                       if(_info=='' ){
                           _info="없음";
                       }

                       $.ajax({
                             url: "${contextPath}/upload",
                             type: "POST",
                             data: formData,
                             contentType: false,
                             processData: false,
                             success:function (data,textStatus){
                               alert("파일 업로드에 성공했습니다.");
                             },
                             error:function(data,textStatus){
                                 alert("파일 업로드에 실패했습니다.");
                             },
                       });

	               }else if(_file=='' ){
	            	   _file="없음";
	            	   if(_info=='' ){
	            		   _info="없음";
	            	   }
	               }else if(_info=='' ){
	            	   _info="없음";
	            	   }

	               $.ajax({
	                   type:"post",
	                   async:true,
	                   url:"${contextPath}/addCenterReg.do",
	                   dataType:"json",
	                   data: {
                              vTitle: _title,
                              vStartDate: _startDate,
                              vEndDate: _endDate,
                              vStartTime: _startTime,
                              vLastTime: _endTime,
                              vRStartDate: _rStartDate,
                              vREndDate: _rEndDate,
                              vWorkingDay: _vWorkingDay,
                              vRegAmnt: _vRegAmnt,
                              vServiceCode: _serviceCode,
                              vUploadFilePath: _file,
                              vInfo: _info,
                              uId: _uId
	                	 },
	                   success:function (data,textStatus){
	                        var v_no = data[0].v_no;
                            var vTitle = data[0].vTitle;
                            var vStartDate = data[0].vStartDate;
                            var vEndDate = data[0].vEndDate;
                            var vStartTime = data[0].vStartTime;
                            var vLastTime = data[0].vLastTime;
                            var vRStartDate = data[0].vRStartDate;
                            var vREndDate = data[0].vREndDate;
                            var vWorkingDay = data[0].vWorkingDay;
                            var vServiceCode = data[0].vServiceType;
                            var vRegAmnt = data[0].vRegAmnt;
                            var vUploadFilePath = data[0].vUploadFilePath;
                            var vInfo = data[0].vInfo;


                            document.getElementById("centerRegBtnCN").value = "확인";
                            document.getElementById("centerRegBtnRM").value = "수정";
                            document.getElementById("centerRegBtnRM").type="submit";

                            $( 'hidden' ).html( '<input type="hidden" name="v_no" value="'+v_no+'"/>' );

                            $( 'h2' ).html( '<h1>'+vTitle+'</h1>' );

                            $('#vDate').remove();
                            $( 'vDate' ).html( '<h1>' + vStartDate + ' ~ ' + vEndDate + '</h1>' );

                            $('#vTime').remove();
                            $( 'vTime' ).html( '<h1>' + vStartTime + ' ~ ' + vLastTime + '</h1>' );

                            $('#rDate').remove();
                            $( 'rDate' ).html( '<h1>' + vRStartDate + ' ~ ' + vREndDate + '</h1>' );

                            $('#work').remove();
                            $( 'work' ).html( '<h1>' + vWorkingDay + '</h1>' );

                            $('#vRegAmnt').remove();
                            $( 'vRegAmnt' ).html( '<h1>' + vRegAmnt + '</h1>' );

                            $('#serviceCode').remove();
                            $( 'serviceCode' ).html( '<h1>' + vServiceCode + '</h1>' );

                            $('#file').remove();
                            $( 'file' ).html( '<h1>' + vUploadFilePath + '</h1>' );

                            $('#info').remove();
                            if( vInfo == "없음" ){
                            $( 'info' ).html( '<h1>' + vInfo + '</h1>' );
                            }else{
                            $( 'info' ).html( '<h1 style="text-align : left">' + vInfo + '</h1>' );
                            }

	                   },
	                   error:function(data,textStatus){
	                      alert("에러가 발생했습니다.");
	                   },
	                   complete:function(data,textStatus){
	                   }
	             });

         	}



           </script>
    </head>
    <html>
	    <body>
	    <jsp:include page="neviCenter.jsp" />
		        <div class="centerRegDiv">

            					<h3>모집요강 등록</h3>

		        <div>
		        <h2><input class="centerRegTitle" id="title" type="text" name="vTitle" placeholder="제목을 입력해주세요."></h2>
		        <table class="centerRegTable">
		            <tr>
		                <td class="centerRegTd">봉사기간</td>
		                <td>
		                <div id="vDate">
		                    <input id="startDate" class="centerRegDateLeft" type="date" name="vStartDate"><vStartDate></vStartDate>
		                    ~
		                    <input id="endDate" class="centerRegDateRight" type="date" name="vEndDate">
                        </div><vDate></vDate>
		                </td>
		                <td class="centerRegTd">봉사시간</td>
		                <td>
		                <div id="vTime">
		                    <input id="startTime" class="centerRegDateLeft" type="time" name="vStartTime">
		                    ~
		                    <input id="endTime" class="centerRegDateRight" type="time" name="vLastTime">
		                </div><vTime></vTime>
		                </td>
		            </tr>
		            <tr>
		                <td class="centerRegTd">모집기간</td>
		                <td>
		                <div id="rDate">
		                    <input id="rStartDate" class="centerRegDateLeft" type="date" name="vRStartDate">
		                    ~
		                    <input id="rEndDate" class="centerRegDateRight" type="date" name="vREndDate">
		                </div><rDate></rDate>
		                </td>
		                <td class="centerRegTd">활동요일</td>
		                <td><div id="work">
		                    <input id="work1" type="checkbox" name="vWorkingDay1" value="월">월
		                    <input id="work2" type="checkbox" name="vWorkingDay2" value="화">화
		                    <input id="work3" type="checkbox" name="vWorkingDay3" value="수">수
		                    <input id="work4" type="checkbox" name="vWorkingDay4" value="목">목
		                    <input id="work5" type="checkbox" name="vWorkingDay5" value="금">금
		                    <input id="work6" type="checkbox" name="vWorkingDay6" value="토">토
		                    <input id="work7" type="checkbox" name="vWorkingDay7" value="일">일
		                    </div>
							<work></work>
		                </td>
		            </tr>
		            <tr>
		                <td class="centerRegTd">모집인원</td>
		                <td><input class="centervRegAmnt" id="vRegAmnt" type="text" name="vRegAmnt" placeholder="모집인원을 입력해주세요."><vRegAmnt></vRegAmnt></td>
		                <td class="centerRegTd">봉사분야</td>
		                <td>
		                <select id="serviceCode"  name="vServiceCode">
		                        <option value="">선택</option>
		                        <option value="1">청소/배식</option>
		                        <option value="2">산책</option>
		                        <option value="3">목욕</option>
		                        <option value="4">사진</option>
		                        <option value="5">미용</option>
		                        <option value="6">이동</option>
		                        <option value="7">의료</option>
		                    </select>
		                    <serviceCode></serviceCode>
		                </td>
		            </tr>
		            <tr>
		               <td class="centerRegTd">센터명</td>
		                <td>
		                    ${centerList2[0].cName}
		                </td>
		                <td class="centerRegTd">봉사장소</td>
		                <td>
		                    ${centerList2[0].cAddr1} ${centerList2[0].cAddr2}
		                </td>
		            </tr>
		            <tr>
		                <td class="centerRegTd">첨부파일</td>
		                <td colspan="3"><input id="file" type="file" name="vUploadFilePath" multiple="multiple"><file></file></td>
		            </tr>
		        </table>
		        <div class="centerRegDiv2">
		            <textarea id="info" name="vInfo"  placeholder="자격요건, 주의사항, 상세내용, 등을 입력해주세요."></textarea><info></info>
		        </div>
		        </div>

                    <div class="button-container">

                    <c:set var="v_no" value="${centerList[0].v_no}" />
                    <c:choose>
                    <c:when test="${ v_no > 0}">
                        <form name="recruitmentRegister" method="get" action="${pageContext.request.contextPath}/centerMain" encType="utf-8">
                            <input type="hidden" name="userId" value="${centerId}">
                            <input id="centerRegBtnCN" type="submit"  class="centerRegBtn" value="목록" />
                        </form>
                        <form name="recruitmentRegister" method="get" action="${pageContext.request.contextPath}/updateCenterReg.do" encType="utf-8">
                            <input id="centerRegBtnRM" class="centerRegBtn" type="submit" value="수정" />
                            <input type="hidden" name="centerId" value="${centerId}"/>
                            <input type="hidden" name="v_no" value="${v_no}"/>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form name="recruitmentRegister" method="get" action="${pageContext.request.contextPath}/centerMain" encType="utf-8">
                            <input type="hidden" name="userId" value="${centerId}">
                            <input id="centerRegBtnCN" type="submit"  class="centerRegBtn" value="취소" />
                        </form>
                        <form name="recruitmentRegister" method="get" action="${pageContext.request.contextPath}/viewCenterReg.do" encType="utf-8">
                            <input id="centerRegBtnRM" class="centerRegBtn" type="button" value="등록" onClick="fn_process()" />
                            <input type="hidden" name="centerId" value="${centerId}"/>
                            <hidden></hidden>
                        </form>
                    </c:otherwise>

                    </c:choose>
                    </div>

		    </div>

		</body>
    </html>
</html>