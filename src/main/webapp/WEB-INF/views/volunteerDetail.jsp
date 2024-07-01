<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


           <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
           <script type="text/javascript">
           $(document).ready(function() {
                        var job ="${job}";
                        alert("${job}");



                      if(job == "View"){


                              $( 'mmnt' ).html( '<h1>'+"${volunteerList[0].vMaxAmnt}"+'</h1>' );
                              $( 'file' ).html( '<h1>'+"${volunteerList[0].vUploadFilePath}"+'</h1>' );
                              $( 'info' ).html( '<h1>'+"${volunteerList[0].vInfo}"+'</h1>' );




                        }else if(job == "Regist"){

                           document.getElementById("volunteerDetailBtnRM").value="등록하기";
                           document.getElementById("volunteerDetailBtnRM").addEventListener("click", fn_reg);

                        }
                          });
           </script>
           <script type="text/javascript">
           function fn_reg(){




                	               var vMaxAmnt=$("#vMaxAmnt").val();

                	               var _file=$("#file").val();
                	               var _info=$("#info").val().replace(/\n/g, "<br>");


                	               if(vMaxAmnt=='' ){
                	                   alert("모집인원을 입력하세요");
                	                   event.preventDefault();
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
                                             url: "${contextPath}/uploadVolunteerDetail",
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
                                 $( 'mmnt' ).html( '<h1>'+"${volunteerList[0].vMaxAmnt}"+'</h1>' );
                                 $( 'file' ).html( '<h1>'+"${volunteerList[0].vUploadFilePath}"+'</h1>' );
                                 $( 'info' ).html( '<h1>'+"${volunteerList[0].vInfo}"+'</h1>' );

                                         }


           </script>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/style.css">
        <style>

        </style>
    </head>
    <html>
    <body>
	 <jsp:include page="neviCenter.jsp" />


     <c:if test="${job == 'Regist'}">
     <form name="volunteerDetailInsert" method="post" action="${pageContext.request.contextPath}/insertVolunteerDetail.do" encType="UTF-8">
     </c:if>
        <div class="volunteerDetailDiv">
        <input type="hidden" name="v_no" value="${volunteerList[0].v_no}">
        <input type="hidden" name="uId" value="${userId}">
        <input type="hidden" name="cId" value="${volunteerList[0].cId}">
        <input type="hidden" name="vStartDate" value="${volunteerList[0].vStartDate}">
        <input type="hidden" name="vEndDate" value="${volunteerList[0].vEndDate}">
        <input type="hidden" name="vStartTime" value="${volunteerList[0].vStartTime}">
        <input type="hidden" name="vLastTime" value="${volunteerList[0].vLastTime}">
        <input type="hidden" name="vRStartDate" value="${volunteerList[0].vRStartDate}">
        <input type="hidden" name="vREndDate" value="${volunteerList[0].vREndDate}">
        <input type="hidden" name="vServiceCode" value="${volunteerList[0].vServiceCode}">

    <h3>봉사 상세</h3>
    <div>
        <h2>${volunteerList[0].vTitle}</h2>
        <table class="volunteerDetailTable">
            <tr>
                <td class="volunteerDetailTd">봉사기간</td>
                <td>${volunteerList[0].vStartDate} ~ ${volunteerList[0].vEndDate}</td>
                <td class="volunteerDetailTd">봉사시간</td>
                <td>${volunteerList[0].vStartTime} ~ ${volunteerList[0].vLastTime}</td>
            </tr>
            <tr>
                <td class="volunteerDetailTd">모집기간</td>
                <td>${volunteerList[0].vRStartDate} ~ ${volunteerList[0].vREndDate}</td>
                <td class="volunteerDetailTd">활동요일</td>
                <td>${volunteerList[0].vWorkingDay}</td>
            </tr>
            <tr>
                <td class="volunteerDetailTd">모집인원</td>
                <td>${volunteerList[0].vRegAmnt}명</td>
                <td class="volunteerDetailTd">신청인원</td>
                <td><mmnt><input id="vMaxAmnt" class="volunteerRegAmnt" name="vMaxAmnt" type="text" placeholder="신청인원을 입력해주세요."></mmnt></td>
            </tr>
            <tr>
                <td class="volunteerDetailTd">봉사분야</td>
                <td>${volunteerList[0].vServiceType}</td>
                <td class="volunteerDetailTd">센터명</td>
                <td>${volunteerList[0].cName}</td>
            </tr>

            <tr>
                <td class="volunteerDetailTd">봉사장소</td>
                <td colspan="3">${volunteerList[0].cAddr1} ${volunteerList[0].cAddr2}</td>
            </tr>
            <tr>
                <td class="volunteerDetailTd">첨부파일</td>
                <td colspan="3"><file><input id="file" type="file" name="vUploadFilePath"></file></td>
            </tr>
        </table>
        <div class="volunteerDetailDiv2">
            <info><textarea id="info" name="vInfo" placeholder="상세내용을 입력해주세요."></textarea></info>
        </div>

        </div>
        	    <c:set var="userType" value="${userType}" />
        	    <c:set var="job" value="${job}" />
        <c:if test="${userType == 1}">
            <c:if test="${job == 'View'}">
                <form name="volunteerDetailReg" method="post" action="${pageContext.request.contextPath}/regVolunteerDetail.do" encType="UTF-8">
                <input class="volunteerDetailBtn" type="submit" value="신청하기">
                <input type="hidden" name="v_no" value="${volunteerList[0].v_no}">
                <input type="hidden" name="userId" value="${userId}">
                </form>
            </c:if>
            <c:if test="${job == 'Regist'}">
                <input id="volunteerDetailBtnRM" class="volunteerDetailBtn" type="submit" value="등록하기">
                <input type="hidden" name="userId" value="${userId}">
                </form>
            </c:if>
        </c:if>


   		<c:if test="${userType ==2}">
        	<button type="button" class="volunteerDetailBtn"  value="목록으로" onClick="location.href='recruitlist'">목록으로</button>
    	</c:if>






    </div>


</body>
    </html>
</html>