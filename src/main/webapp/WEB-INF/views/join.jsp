<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입 페이지</title>
        <link rel="stylesheet" href="/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script type="text/javascript">
    		 // 동의 체크박스가 체크되면 가입 버튼 활성화
            function toggleSubmitButton() {
                var checkbox = document.getElementById('agree');
                var submitButton = document.getElementById('submitBtn');
                submitButton.disabled = !checkbox.checked;
            }
         // 비밀번호 확인
            function validatePassword() {
                var u_Pwd = document.getElementsByName("u_Pwd")[0].value;
                var u_PwdConfirm = document.getElementsByName("u_PwdConfirm")[0].value;
                var passwordError = document.getElementById("passwordError");

                if (u_Pwd !== u_PwdConfirm) {
                    passwordError.textContent = "※ 비밀번호가 같지 않습니다!";
                    passwordError.style.color = "red";
                    return false;
                } else {
                    passwordError.textContent = "";
                }
                return true;
            }

            // 폼 유효성 검사
            function validateForm() {
                if (!validatePassword()) {
                    return false;
                }

                var u_Name = document.getElementsByName("u_Name")[0].value;
                var u_Sex = document.querySelector('input[name="u_Sex"]:checked'); // Radio 버튼 체크된 값 가져오기
                var u_Bdate = document.getElementsByName("u_Bdate")[0].value;
                var u_Id = document.getElementsByName("u_Id")[0].value;
                var u_Phone = document.getElementsByName("u_Phone")[0].value;
                var u_Email = document.getElementsByName("u_Email")[0].value;

                // 각 필드가 비어있는지 확인하여 경고창 출력
                if (u_Name.trim() === "") {
                    alert("이름을 입력해주세요.");
                    return false;
                }
                if (u_Bdate.trim() === "") {
                    alert("생년월일을 입력해주세요.");
                    return false;
                }
                if (u_Id.trim() === "") {
                    alert("아이디를 입력해주세요.");
                    return false;
                }
                if (u_Phone.trim() === "") {
                    alert("휴대폰번호를 입력해주세요.");
                    return false;
                }
                if (u_Email.trim() === "") {
                    alert("이메일을 입력해주세요.");
                    return false;
                }
                if (u_Sex === null) {
                    alert("성별을 선택해주세요.");
                    return false;
                }

                return true;
            }
        </script>
         <script>
                $(document).ready(function(){
                            $("#u_Id").on("blur", function() {
                                var u_Id = $(this).val();
                                $.ajax({
                                    url: "/checkUserId",
                                    type: "get",
                                    data: { "u_Id": u_Id },
                                    success: function(isAvailable) {
                                        if (isAvailable) {
                                            $("#userIdError").text("사용 가능한 아이디입니다.").css("color", "green");
                                        } else {
                                            $("#userIdError").text("이미 사용 중인 아이디입니다.").css("color", "red");
                                        }
                                    }
                                });
                            });
                        });
            </script>
    </head>
    <body class="joinBody">
        <a href="index">
            <img src="/img/logo.png" class="joinLogo">
        </a>
        <form action="join" method="post" onsubmit="return validateForm()">
            <input type="text" name="u_Name" placeholder="이름 *" class="joinText" required><br>
            <input type="radio" name="u_Sex" value="M" class="joinCheckBox" checked>Male
            <input type="radio" name="u_Sex" value="F" class="joinCheckBox">Female<br>
    
            <input type="text" name="u_Bdate" placeholder="생년월일 *" class="joinText" required><br>
    
            <input type="text" name="u_Id" required class="joinId" placeholder="아이디 *">
            <span id="userIdError"></span><br> <!-- 아이디 중복 여부 메시지 표시 -->
            
            <input type="password" id="u_Pwd" name="u_Pwd" placeholder="비밀번호 *" class="joinText" required><br>
            <input type="password" id="u_PwdConfirm" name="u_PwdConfirm" placeholder="비밀번호 확인 *" class="joinText" required><br>
            <span id="passwordError"></span><br>
            
            <input type="text" name="u_Addr1" placeholder="주소" class="joinText"><br>
            <input type="text" name="u_Email" placeholder="이메일 *" class="joinText" required><br>
            <input type="text" name="u_Phone" placeholder="휴대폰번호 *" class="joinText" required><br>
            
            <div class="joinContainer">
            <h1 class="joinH1">약관 동의</h1>
            <div class="joinTerms">
                <h2>서비스 이용 약관</h2>
                <p>
                    제 1조 = 서비스 목적 =<br>
					이 서비스는 사용자에게 뉴스, 커뮤니티 포럼, 개인화된 콘텐츠, 온라인 쇼핑 등을 제공하기 위한 것입니다.
                </p><br>
                <p>
                    제 2조 = 회원 가입 및 관리 =<br>
					1.사용자는 정확한 정보를 제공하여 계정을 생성해야 하며, 계정 정보의 기밀성을 유지할 책임이 있습니다.<br>
					2.타인의 정보를 도용하는 경우 서비스 이용이 제한될 수 있습니다.
                </p><br>
                <p>
                	제 3조 = 사용자의 의무 =<br>
					사용자는 서비스 이용 시 다음과 같은 행위를 해서는 안 됩니다:<br>

					1.불법적이거나 부적절한 콘텐츠 게시<br>
					2.서비스 운영 방해<br>
					3.타인의 개인정보 침해<br>
					4.지적 재산권 침해
                </p><br>
                <p>
                	제 4조 = 서비스의 제공 및 변경 =<br>
					1.회사는 서비스 제공을 위해 최선을 다하지만, 기술적 문제나 운영상의 이유로 서비스 제공이 일시 중단될 수 있습니다.<br>
					2.회사는 필요에 따라 서비스 내용을 변경할 수 있으며, 주요 변경 사항은 사전에 공지합니다.
                </p><br>
                <p>
                	제 5조 = 개인정보 보호 =<br>
					1.회사는 사용자의 개인정보를 보호하기 위해 최선을 다합니다.<br>
					2.사용자의 개인정보는 서비스 제공, 통계 분석, 맞춤형 콘텐츠 제공을 위해 사용되며, 
					사용자의 동의 없이 제3자에게 제공되지 않습니다.
                </p><br>
                <p>
                	제 6조 = 저작권 및 지적 재산권 =<br>
					1.서비스에 게시된 모든 콘텐츠의 저작권은 회사에 있으며, 사용자는 이를 무단으로 복제, 배포, 변형할 수 없습니다.<br>
					2.사용자가 생성한 콘텐츠의 저작권은 사용자에게 있으며, 회사는 이를 서비스 홍보 및 개선을 위해 사용할 수 있습니다.
                </p><br>
                <p>
                	제 7조 = 책임의 한계 =<br>
					1.회사는 천재지변, 불가항력 등의 사유로 인한 서비스 중단에 대해 책임을 지지 않습니다.<br>
					2.사용자는 자신의 책임 하에 서비스를 이용해야 하며, 서비스 이용 중 발생한 손해에 대해서는 
					회사의 고의 또는 중대한 과실이 없는 한 책임을 지지 않습니다.
                </p><br>
                <p>
                	제 8조 = 이용 약관의 변경 =<br>
					1.회사는 필요에 따라 본 이용 약관을 변경할 수 있으며, 변경 사항은 최소 7일 전에 공지합니다.<br>
					2.사용자가 변경된 약관에 동의하지 않는 경우, 서비스 이용을 중단하고 계정을 삭제할 수 있습니다.
                </p><br>
                <p>
                	제 9조  = 분쟁 해결 =<br>
					1.본 약관과 관련된 분쟁은 대한민국 법률을 준거법으로 합니다.<br>
					2.관할 법원은 회사의 본사 소재지를 관할하는 법원으로 합니다.
                </p><br>
                <p>
                	제 10조 = 기타 사항 =<br>
					1.본 약관에서 정하지 않은 사항과 본 약관의 해석에 관하여는 관련 법령 및 상관례에 따릅니다.<br>
					2.기타 서비스 이용에 필요한 사항은 회사의 공지사항 및 서비스 안내에 따릅니다.
                </p>
            </div>
            <div class="joinCheckbox">
                <label>
                    <input type="checkbox" id="agree" onclick="toggleSubmitButton()"> 약관에 동의합니다.
                </label>
            </div>
            <button type="submit" id="submitBtn" class="joinSubmit-btn" disabled>동의하고 가입하기</button>
        </div>
        </div>
        </form>
    </body>
    </html>