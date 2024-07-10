
            function validatePassword() {
                var password = document.getElementById("u_pwd").value;
                var confirmPassword = document.getElementById("confirmPwd").value;

                if (password != confirmPassword) {
                    alert("비밀번호가 일치하지 않습니다.");
                    return false;
                }
                return true;
            }
