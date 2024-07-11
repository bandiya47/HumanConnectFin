<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 결과</title>
    <link rel="stylesheet" href="./css/style.css">
    <script>
        function displayResult(isSuccess) {
                    console.log("isSuccess: " + isSuccess); // 디버깅을 위해 콘솔에 출력
                    if (isSuccess === true || isSuccess === 'true') {
                        document.getElementById("successMessage").style.display = "none";
                        document.getElementById("failureMessage").style.display = "block";
                    } else {
                        document.getElementById("successMessage").style.display = "block";
                        document.getElementById("failureMessage").style.display = "none";
                    }
                }
    </script>
</head>
<body class="resultBody" onload="displayResult(<%= request.getAttribute("isSuccess") %>)">
<a href="index">
    <img src="./img/logo.png" class="resultLogo">
</a>
<div class="resultContainer">
    <h1 class="resultBold">회원가입 결과</h1>

    <div id="successMessage" style="display: none;">
        <p class="resultMessage">회원가입이 성공적으로 완료되었습니다!</p>
        <p class="resultMessage">로그인 페이지로 이동하여 로그인해주세요.</p>
        <a href="login" class="resultButton">로그인</a>
    </div>

    <div id="failureMessage" style="display: none;">
        <p class="resultMessage">회원가입에 실패하였습니다. 다시 시도해주세요.</p>
        <a href="join" class="resultButton">다시 시도</a>
    </div>

</div>
</body>
</html>