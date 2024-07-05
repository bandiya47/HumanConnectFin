<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script>
       function goMain() {
          window.location.href = "centerMain";
          <!--경로설정. 나중에서블릿으로 바꿔야함/ 센터메인의 경우 센터메인으로 바꾸기-->
       }
    </script>
<!--####################css 경로 바꾸기/ img 경로 바꾸기####################-->
</head>

<body>

<header>                        <!--헤더-->
    <div class="neviCenterBack"><img src="${pageContext.request.contextPath}/img/imsiback.jpg" alt=""></div>
    <div class="neviCenterFor">
        <div class="neviCenterTop">   <!--최상단-->
            <div>

                <form action="logout" method="post">
                   <button type="submit" value="">로그아웃</button>
                </form>
               <form action="${pageContext.request.contextPath}/showCenterPrivacyPw" method="post" >
                       <input type="hidden" name="centerId" value="${centerId}">
                       <button type="submit" value="">마이페이지</button>
               </form>
            </div>
        </div>

        <div class="neviCenter">      <!--네비게이션-->
            <span>              <!--로고-->
                <img src="./img/logo.png" alt="" class="" onclick="goMain()"></span>
            <span>
                <ul>            <!--네비게이션바-->
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form name="recruitmentRegister" method="get" action="${pageContext.request.contextPath}/centerReg.do" encType="utf-8">
                                <input type="hidden" name="userId" value="${userId}">
                                <input type="hidden" name="centerId" value="${centerId}">
                                <input type="submit" value="봉사등록">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form name="viewall" method="post" action="/recruitlist" encType="utf-8">
                                <input type="hidden" name="centerId" value="${centerId}">
                                <input type="submit" value="모집신청내역">
                            </form>
                        </div>

                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="봉사신청내역">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="입양상담신청내역">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="고객센터">
                            </form>
                        </div>
                    </li>
                </ul>
            </span>
        </div>
    </div>
</header>


<!--여기부터 아래 내용 정상적용 되는지 확인-->
<div class="main"></div>




</body>
</html>