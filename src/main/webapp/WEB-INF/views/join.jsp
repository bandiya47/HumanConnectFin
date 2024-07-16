<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Human Connect</title>
        <link rel="stylesheet" href="/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">
    		 // 동의 체크박스가 체크되면 가입 버튼 활성화
            function toggleSubmitButton() {
                var checkbox = document.getElementById('agree');
                var submitButton = document.getElementById('submitBtn');
                submitButton.disabled = !checkbox.checked;
            }

            // 폼 유효성 검사
            function validateForm() {


                var u_Name = document.getElementById('u_Name').value.trim();
                // Radio 버튼 체크된 값 가져오기
                var u_Bdate = document.getElementById('u_Bdate').value.trim();
                var u_Id = document.getElementById('u_Id').value.trim();
                var u_Pwd = document.getElementById('inputField2').value.trim();
                var u_PwdConfirm = document.getElementById('confirmPassword').value.trim();
                var u_Phone = document.getElementById('inputField1').value.trim();
                var u_Email = document.getElementById('inputField3').value.trim();

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

                if (u_Pwd !== u_PwdConfirm) {
                    alert("비밀번호가 같지 않습니다");
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

                return true;
            }
        </script>
         <script>
                function checkUserId() {
                    var u_Id = document.getElementById("u_Id").value.trim();

                    if (u_Id === "") {
                        alert("아이디를 입력해주세요.");
                        return;
                    }

                    $.ajax({
                        type: "POST",
                        url: "/checkUserIdDuplicate",
                        data: { u_Id: u_Id },
                        dataType: "json",
                        success: function(response) {
                            console.log(response); // 응답 확인용 콘솔 로그
                            if (response.status === "duplicate") {
                                alert("아이디가 이미 사용 중입니다.");
                            } else if (response.status === "available") {
                                alert("아이디를 사용할 수 있습니다.");
                            } else {
                                alert("오류가 발생했습니다.");
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.error("Error: " + textStatus + ", " + errorThrown); // 오류 상세 정보 출력
                            alert("서버 오류가 발생했습니다: ");
                        }
                    });
                }
            </script>
    </head>
    <body class="joinBody">
        <a href="${pageContext.request.contextPath}/">
            <img src="/img/logo.png" class="joinLogo">
        </a>
        <div class="joinWholeContainer">
        <form action="join" method="post" onSubmit="return validateForm()">
            <div class="joinContainer1">
                <input type="text" id="u_Name" name="u_Name" placeholder="이름 *" class="joinText" >
            </div>
            <div class="joinContainer2">
                <input type="radio" name="u_Sex" value="M" class="joinCheckBox" checked> Male
                <input type="radio" name="u_Sex" value="F" class="joinCheckBox"> Female
            </div>
            <div class="joinContainer1">
                <input type="text" id="u_Bdate" name="u_Bdate" placeholder="생년월일 *" class="joinText" >
            </div>

            <div class="joinContainer3">
                <input type="text" id="u_Id" name="u_Id" class="joinId" placeholder="아이디 *" >
                <button type="button" onclick="checkUserId()" class="join_ChkIdBtn">아이디 중복 검사</button>
            </div>
            <div class="joinContainer1">
                <input id="inputField2" type="password" name="u_Pwd" placeholder="비밀번호 *" class="joinText" >
            </div>
            <div id="hiddenText2" class="hidden-text">비밀번호는 최소 8자 이상이어야 합니다.</div>
            <p id="errorText2" class="hidden-text error"></p>
            <div class="joinContainer1">
                <input type="password" id="confirmPassword" name="u_PwdConfirm" placeholder="비밀번호 확인 *" class="joinText" >
            </div>
            <div id="hiddenText3" class="hidden-text">확인을 위해 새 비밀번호를 다시 입력해주세요.</div>
            <p id="errorText3" class="hidden-text error"></p>
            <div class="joinContainer1">
                <span id="passwordError" class="error-message"></span>
            </div>
            <div class="joinContainer1">
                <input type="text" name="u_Addr1" placeholder="주소" class="joinText">
            </div>
            <div class="joinContainer1">
                <input type="text" name="u_Addr2" placeholder="상세 주소" class="joinText">
            </div>
            <div class="joinContainer1">
                <input id="inputField3" type="text" name="u_Email" placeholder="이메일 *" class="joinText" >
            </div>
            <div id="hiddenText4" class="hidden-text">[test@gmail.com] 형식으로 입력해주세요.</div>
            <p id="errorText4" class="hidden-text error"></p>



            <div class="joinContainer1">
                <input id="inputField1" type="text" name="u_Phone" placeholder="휴대폰번호 *" class="joinText" >

            </div>
            <div id="hiddenText1" class="hidden-text">[010-0000-0000] 형식으로 입력해주세요.</div>
            <p id="errorText1" class="hidden-text error"></p>

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
    <div>
    <script>
        const inputFields = [
          { input: document.getElementById('inputField1'), error: document.getElementById('errorText1'), hiddenText: document.getElementById('hiddenText1') },
          { input: document.getElementById('inputField2'), error: document.getElementById('errorText2'), hiddenText: document.getElementById('hiddenText2') },
          { input: document.getElementById('confirmPassword'), error: document.getElementById('errorText3'), hiddenText: document.getElementById('hiddenText3') },
          { input: document.getElementById('inputField3'), error: document.getElementById('errorText4'), hiddenText: document.getElementById('hiddenText4') }
        ];

        // 입력값을 검사하는 함수들을 정의합니다
        function validatePhoneNumber(input) {
          // 전화번호 형식 검사 (xxx-xxxx-xxxx)
          const pattern = /^\d{3}\d{4}\d{4}$/;
          return pattern.test(input);
        }

        function validatePassword(input) {
          // 비밀번호 길이 검사 (최소 8자 이상)
          return input.length >= 8;
        }

        function validateEmail(input) {
          // 이메일 형식 검사
          const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
          return pattern.test(input);
        }

        // 각 input 필드에 포커스 이벤트를 설정합니다
        inputFields.forEach((field) => {
          const inputField = field.input;
          const errorText = field.error;
          const hiddenText = field.hiddenText;

          inputField.addEventListener('focus', () => {
            // 다른 숨겨진 텍스트 숨기기
            inputFields.forEach((otherField) => {
              if (otherField.hiddenText !== hiddenText) {
                otherField.hiddenText.style.display = 'none';
              }
            });

            hiddenText.style.display = 'block';
          });

          // blur 이벤트로도 처리 (입력 필드를 벗어날 때)
          inputField.addEventListener('blur', () => {
            const inputValue = inputField.value.trim();
            let isValid = false;
            let errorMessage = '';

            // 입력값 유효성 검사
            switch (inputField.id) {
              case 'inputField1':
                isValid = validatePhoneNumber(inputValue);
                errorMessage = '전화번호 형식이 올바르지 않습니다.';
                break;
              case 'inputField2':
                isValid = validatePassword(inputValue);
                errorMessage = '비밀번호는 형식이 올바르지 않습니다.';
                break;
              case 'confirmPassword':
                  // 비밀번호 확인 값과 비교
                  const passwordValue = document.getElementById('inputField2').value.trim();
                  isValid = inputValue === passwordValue;
                  errorMessage = '비밀번호가 일치하지 않습니다.';
                  break;
              case 'inputField3':
                isValid = validateEmail(inputValue);
                errorMessage = '이메일 형식이 올바르지 않습니다.';
                break;
            }

            // 오류 메시지 표시
            if (!isValid) {
              errorText.textContent = errorMessage;
              errorText.style.display = 'block';
            } else {
              errorText.style.display = 'none';
            }
          });
        });

    // 문서의 클릭 이벤트를 처리하여 숨겨진 텍스트를 숨깁니다
    document.addEventListener('click', (event) => {
      const clickedElement = event.target;

      // 다른 작업을 했을 때 숨겨진 텍스트 숨기기
      if (!clickedElement.matches('#inputField1, #inputField2, #confirmPassword, #inputField3')) {
        inputFields.forEach((field) => {
          field.hiddenText.style.display = 'none';
        });
      }
    });
    </script>
</body>
</html>