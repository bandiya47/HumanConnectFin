<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	function goIndex() {
    		window.location.href = "index";
    	}

    	function fn_process(){
        	               var _findPw=$("#findPw").val();
                           alert(_findPw);

        	               $.ajax({
        	                   type:"post",
        	                   async:true,
        	                   url:"${contextPath}/findPw.do",
        	                   dataType:"text",
        	                   data: {
                                      userId: _findPw

        	                	 },
        	                   success:function (Result){


                                     if(Result == 'no'){
                                           alert("id를 찾을수 없습니다.");
                                       }else{
                                           alert("pw를 입력해주세요.");
                                            $( 'pw' ).html( '<div class="loginInput">'
                                            +'<h1>'+Result+'</h1>'
                                            +'<input id="chId" type="hidden" value="'+Result+'">'
                                            +'<input id="chPw" type="text" name="userPw">'
                                            +'<input class="centerRegBtn" type="button" value="등록" onClick="fn_process2()" /></div>' );
                                       }



        	                   },
        	                   error:function(data,textStatus){
        	                      alert("에러가 발생했습니다.");
        	                   },
        	                   complete:function(data,textStatus){
        	                   }
        	             });

                 	}


            	function fn_process2(){
            	                   var _chId=$("#chId").val();
                	               var _chPw=$("#chPw").val();
                	               alert(_chId);
                                   alert(_chPw);

                	               $.ajax({
                	                   type:"post",
                	                   async:true,
                	                   url:"${contextPath}/rePw.do",
                	                   dataType:"text",
                	                   data: {
                	                          userId: _chId,
                                              userPw: _chPw
                	                	 },
                	                   success:function (Result){


                                             if(Result == 'no'){
                                                   alert("pw 변경 실패");
                                               }else{
                                                   alert("pw 변경 완료했습니다.");
                                                    $( 'id' ).html( '<div class="loginInput">'
                                                    +'<h1>'+Result+'님 비밀번호를 변경 완료했습니다.</h1></div>' );
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
<body class="loginBody">
	<main class="loginMain">
		<img src="${pageContext.request.contextPath}/img/logo.png" width="450px" alt="로고" onclick="goIndex()">
		<div class="loginContainer">
		        <id>
                <pw>
		        <div class="loginInput">
                        <input id="findPw" type="text" name="userId">

                     <input id="centerRegBtnRM" class="centerRegBtn" type="button" value="확인" onClick="fn_process()" />

		       	</div>
		       	</pw>
		       	</id>


		      </div>
	    </main>
</body>
</html>