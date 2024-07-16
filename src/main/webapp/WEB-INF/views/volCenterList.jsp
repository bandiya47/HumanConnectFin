<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


           <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
           <script type="text/javascript">
           $(document).ready(function() {
                        var job ="${job}";




                      if(job == "Regist"){

                           document.getElementById("volunteerDetailBtnRM").value="등록하기";
                           document.getElementById("volunteerDetailBtnRM").addEventListener("click", fn_reg);

                        }else if(job == "ViewReg"){
                            $( 'mmnt' ).html( '<h1>'+"${volunteerList[0].vMaxAmnt}"+'</h1>' );
                            $( 'file' ).html( '<h1><a href="/volCLDownload?imageFileName=${volunteerList[0].vUploadFilePath}">${volunteerList[0].vUploadFilePath}</a></h1>' );
                            $( 'info' ).html( '<h1 style="text-align:left;">'+"${volunteerList[0].vInfo}"+'</h1>' );

                            $('#vDate').remove();
                            $( 'vDate' ).html( '<h1>${volunteerList[0].vStartDate} ~ ${volunteerList[0].vEndDate}</h1>' );

                            $('#vTime').remove();
                            $( 'vTime' ).html( '<h1>${volunteerList[0].vStartTime} ~ ${volunteerList[0].vLastTime}</h1>' );

                        }else if(job == "Modify"){
                            var vInfo="${volunteerList[0].vInfo}";
                            vInfo = vInfo.replace(/<br>/g, "\n");

                            document.getElementById("startDate").value="${volunteerList[0].vStartDate}";
                            document.getElementById("endDate").value="${volunteerList[0].vEndDate}";
                            document.getElementById("startTime").value="${volunteerList[0].vStartTime}";
                            document.getElementById("endTime").value="${volunteerList[0].vLastTime}";

                            document.getElementById("vMaxAmnt").value ="${volunteerList[0].vMaxAmnt}";
                            document.getElementById("info").value = vInfo;
                            $( 'file' ).html( '<h1>'+"${volunteerList[0].vUploadFilePath}"+'</h1>' );
                            document.getElementById("volunteerDetailBtnRM").addEventListener("click", fn_mod);

                        }

                         function fn_reg(){

                                   var vMaxAmnt=$("#vMaxAmnt").val();

                                   var _file=$("#file").val();
                                   var _info=$("#info").val().replace(/\n/g, "<br>");
                                   document.getElementById("info").value=_info;


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


                                         }
                      function fn_mod(){

                                var vMaxAmnt=$("#vMaxAmnt").val();

                                var _info=$("#info").val().replace(/\n/g, "<br>");
                                document.getElementById("info").value=_info;


                                if(vMaxAmnt=='' ){
                                    alert("모집인원을 입력하세요");
                                    event.preventDefault();
                                    return;
                                }else if(_info=='' ){
                                    _info="없음";
                                    }


                      }


           });
           </script>



<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/style.css">
        <title>Human Connect</title>
    </head>
    <html>
    <body>
	 <jsp:include page="nevi.jsp" />

     <div class="volunteerDetailDiv">
     <c:if test="${job == 'Regist'}">
     <form name="volunteerDetailInsert" method="post" action="${pageContext.request.contextPath}/insertVolCenterList.do" encType="UTF-8">
        <input type="hidden" name="userId" value="${userId}">
        <input type="hidden" name="uId" value="${userId}">
        <input type="hidden" name="cId" value="${careInfo[0].c_id}">

     </c:if>
     <c:if test="${job == 'ViewReg'}">
     <form name="volunteerDetailMod" method="post" action="${pageContext.request.contextPath}/modVolCenterList.do" encType="UTF-8">
     </c:if>
     <c:if test="${job == 'Modify'}">
     <form name="volunteerDetailMod" method="post" action="${pageContext.request.contextPath}/updateVolCenterList.do" encType="UTF-8">
     </c:if>

    <h3>보호소 봉사 등록</h3>
    <div>
        <h2>${careInfo[0].c_name}${volunteerList[0].cName}</h2>
        <table class="volunteerDetailTable">
            <tr>
                <td class="volunteerDetailTh">봉사기간</td>
                <td>
                <div id="vDate">
                        <input id="startDate" type="date" name="vStartDate"><vStartDate></vStartDate>
                        ~
                        <input id="endDate" type="date" name="vEndDate">
                </div><vDate></vDate>
                </td>
            </tr>
            <tr>
                <td class="volunteerDetailTh">봉사시간</td>
                <td>
                <div id="vTime">
                        <input id="startTime" type="time" name="vStartTime">
                        ~
                        <input id="endTime" type="time" name="vLastTime">
                </div><vTime></vTime>
                </td>
            </tr>
            <tr>
                <td class="volunteerDetailTh">신청인원</td>
                <td><mmnt><input id="vMaxAmnt" class="volunteerRegAmnt" name="vMaxAmnt" type="text" placeholder="신청인원을 입력해주세요."></mmnt></td>
            </tr>



            <tr>
                <td class="volunteerDetailTh">첨부파일</td>
                <td colspan="3"><file><input id="file" type="file" name="vUploadFilePath"></file></td>
            </tr>
        </table>
        <div class="volunteerDetailDiv2">
            <info><textarea id="info" name="vInfo" placeholder="상세내용을 입력해주세요."></textarea></info>
        </div>

        </div>

    <div class="button-container" style="border:none">
            <c:if test="${job == 'View'}">
                <form name="volunteerDetailReg" method="post" action="${pageContext.request.contextPath}/regVolunteerDetail.do" encType="UTF-8">
                <input class="volunteerDetailBtn" type="submit" value="신청하기">
                <input type="hidden" name="v_no" value="${careInfo[0].v_no}">
                <input type="hidden" name="userId" value="${userId}">
                </form>
            </c:if>
            <c:if test="${job == 'Regist'}">
                <input id="volunteerDetailBtnRM" class="volunteerDetailBtn" type="submit" value="등록하기">
                <input type="hidden" name="userId" value="${userId}">
                </form>
            </c:if>
            <c:if test="${job == 'ViewReg'}">
                <input class="volunteerDetailBtn" type="submit" value="수정하기">
                <input type="hidden" name="vReg_no" value="${volunteerList[0].vReg_no}">
                <input type="hidden" name="userId" value="${userId}">
                </form>
            </c:if>
            <c:if test="${job == 'Modify'}">
                <input id="volunteerDetailBtnRM" class="volunteerDetailBtn" type="submit" value="수정확인">
                <input type="hidden" name="vReg_no" value="${volunteerList[0].vReg_no}">
                <input type="hidden" name="userId" value="${userId}">
                </form>
            </c:if>
            <form action="/detailCenterList.do" method="GET">
                <button type="submit" class="volunteerDetailBtn">돌아가기</button>
                <input type="hidden" name="userId" value="${userId}">
                <input type="hidden" name="careNm" value="${careInfo[0].c_name}">
            </form>
        </div>
    </div>

</body>
</html>
