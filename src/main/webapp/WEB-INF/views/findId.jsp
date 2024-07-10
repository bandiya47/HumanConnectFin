<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>
   <link rel="stylesheet" type="text/css" href="/css/style.css">
   <script>


    // 이름,이메일 누락시 알림
        function validateForm() {
            var u_name = document.getElementById("u_Name").value;
            var u_email = document.getElementById("u_Email").value;
            if (u_name === "") {
                alert("이름을 입력해주세요.");
                return false;
            } else if (u_email === "") {
            	alert("이메일을 입력해주세요.");
            	return false;
            }
            return true;
        }
    </script>
</head>
<body class="find">
    <a href="index.jsp">
        <img src="img/logo.png" class="find_logo">
    </a>
    <br>
    <div class="find_container">
        <h1 class="find_bold">아이디 찾기</h1>
        <form action="findId" method="post">
            <label for="name" class="find_label">이름</label>
            <input type="text" id="u_name" name="u_Name" class="find_input" required>
            
            <label for="email" class="find_label">이메일</label>
            <input type="text" id="u_email" name="u_Email" class="find_input" required>
            
            <button type="submit" class="find_button">아이디 찾기</button>
        </form>
    </div>
</body>
</html>