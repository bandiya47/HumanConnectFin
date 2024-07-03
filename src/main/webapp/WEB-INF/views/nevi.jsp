

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script>
       function goMain() {
          window.location.href = "mainRequestTest";
          <!--경로설정. 나중에서블릿으로 바꿔야함/ 센터메인의 경우 센터메인으로 바꾸기-->
       }
    </script>
<!--####################css 경로 바꾸기/ img 경로 바꾸기####################-->
</head>

<body>

<header>                        <!--헤더-->
    <div class="neviBack"><img src="./img/back.jpg" alt=""></div>
    <div class="neviFor">
        <div class="neviTop">   <!--최상단-->
            <div>

                <form action="logout" method="post">
                   <button type="submit" value="">로그아웃</button>
                </form>
                 <form action="${pageContext.request.contextPath}/privacyList" method="GET">
                             <input type="hidden" name="userId" value="${userId}">
                           <button type="submit" value="">마이페이지</button>
                  </form>


            </div>
        </div>

        <div class="nevi">      <!--네비게이션-->
            <span>              <!--로고-->
                <img src="./img/logo.png" alt="" class="" onclick="goMain()"></span>
            <span>
                <ul>            <!--네비게이션바-->
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">

                            <form action="test">
                                <input type="submit" value="봉사신청">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="보호동물">
                            </form>
                        </div>

                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="보호센터">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="실종/제보">
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