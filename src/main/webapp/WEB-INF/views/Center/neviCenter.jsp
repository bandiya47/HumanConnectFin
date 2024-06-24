<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script>
       function goMain() {
          window.location.href = "centerMain";
          <!--��μ���. ���߿��������� �ٲ����/ ���͸����� ��� ���͸������� �ٲٱ�-->
       }
    </script>
<!--####################css ��� �ٲٱ�/ img ��� �ٲٱ�####################-->
</head>

<body>

<header>                        <!--���-->
    <div class="neviCenterBack"><img src="/image/back.jpg" alt=""></div>
    <div class="neviCenterFor">
        <div class="neviCenterTop">   <!--�ֻ��-->
            <div>

                <form action="logout" method="post">
                   <button type="submit" value="">로그아웃</button>
                </form>
                <form action="mypagePrivacyCheck.jsp">
                        <button type="submit" value="">마이페이지</button>
                </form>


            </div>
        </div>

        <div class="neviCenter">      <!--�׺���̼�-->
            <span>              <!--�ΰ�-->
                <img src="/image/logo.png" alt="" class="" onclick="goMain()"></span>
            <span>
                <ul>            <!--�׺���̼ǹ�-->
                    <li>
                        <div>
                            <img src="/image/soleWhite.png" alt="" class="">

                            <form action="test">
                                <input type="submit" value="봉사등록">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="/image/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="모집신청내역">
                            </form>
                        </div>

                    </li>
                    <li>
                        <div>
                            <img src="/image/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="봉사신청내역">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="/image/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="입양상담신청내역">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="/image/soleWhite.png" alt="" class="">
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


<!--������� �Ʒ� ���� �������� �Ǵ��� Ȯ��-->
<div class="main"></div>




</body>
</html>