<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
          <!--��μ���. ���߿��������� �ٲ����/ ���͸����� ��� ���͸������� �ٲٱ�-->
       }
    </script>
<!--####################css ��� �ٲٱ�/ img ��� �ٲٱ�####################-->
</head>

<body>

<header>                        <!--���-->
    <div class="neviCenterBack"><img src="./img/imsiback.jpg" alt=""></div>
    <div class="neviCenterFor">
        <div class="neviCenterTop">   <!--�ֻ��-->
            <div>
                
                <button type="button" value="">�α׾ƿ�</button>
                <form action="mypagePrivacyCheck.jsp">
                        <button type="submit" value="">����������</button>
                </form>
                
            
            </div>
        </div>

        <div class="neviCenter">      <!--�׺���̼�-->
            <span>              <!--�ΰ�-->
                <img src="./img/logo.png" alt="" class="" onclick="goMain()"></span>       
            <span>
                <ul>            <!--�׺���̼ǹ�-->
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            
                            <form action="test">
                                <input type="submit" value="�����û">
                            </form>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="������û����">
                            </form>
                        </div>
                        
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="�����û����">
                            </form>
                        </div>    
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="�Ծ����û����">
                            </form>
                        </div> 
                    </li>
                    <li>
                        <div>
                            <img src="./img/soleWhite.png" alt="" class="">
                            <form action="">
                                <input type="submit" value="������">
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