<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Human Connect</title>
    <link rel="stylesheet" href="${contextPath}/css/style.css">
     <style>
            html, body {
                background-color: white !important;
                font-family: 'MangoDdobak-B';
            }
     </style>
     <script>
            function resetSearch() {
                const searchQueryInput = document.querySelector('input[name="searchQuery"]');
                searchQueryInput.value = '';
                searchQueryInput.closest('form').submit();
            }
            function adminMain() {
                const logoutForm = document.createElement('form');
                logoutForm.method = 'get';
                logoutForm.action = '${pageContext.request.contextPath}/adminMain';
                document.body.appendChild(logoutForm);
                logoutForm.submit();
            }
    </script>
</head>
<body class="adminNoticeListBody">
<header class="adminMainHeader">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고" onclick="adminMain()">
    <form action="logout" method="post">
       <button class="adminBtn" type="submit" value="">로그아웃</button>
    </form>
</header>
<div class="adminMainContainer">
    <div class="adminMainSidebar">
        <h3>관리자<br>페이지</h3>
        <ul>
            <li ><a href="${pageContext.request.contextPath}/adminMain">봉사회원정보 조회</a></li>
            <li><a href="${pageContext.request.contextPath}/adminCenterMem">센터회원정보 조회</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/adminNoticeList.do">고객센터</a></li>
        </ul>
    </div>
    <div class="adminNoticeListWholeContainer2" id="adminNoticeListWholeContainer2">
        <div class="adminMainSearch-box" id="adminMainSearch-box">
        <h1>공지사항</h1>
            <form action="${pageContext.request.contextPath}/adminMain" method="get">
                <input type="text" name="searchQuery" placeholder="검색어 입력" value="${param.searchQuery}">
                <input type="submit" value="검색">
                <img src="${contextPath}/img/reset.png" alt="초기화" onclick="resetSearch()">
            </form>
        </div>

        <form id="noticeListForm" method="post" enctype="multipart/form-data"
                action="${contextPath}/deleteNotices.do" style="display:block">
        <div class="adminNoticeListDiv">
            <div class="buttonContainer1">
                    <button class="noticeRegButton" name="noticeReg" value="새 글" type="button" onclick="showNoticeForm()">새 글</button>
                    <button class="noticeDelButton" name="noticeDel" value="삭제" type="button" onclick="deleteSelectedNotices()">삭제</button>
            </div>
            <div class="noticeListSomeDiv">
                <table class="adminNoticeListTable">
                   <thead>
                       <tr>
                           <th width="8%">No</th>
                           <th width="62%">제목</th>
                           <th width="10%">작성자</th>
                           <th width="15%">작성일</th>
                           <th width="5%">선택</th>
                       </tr>
                   </thead>
                   <c:forEach var="item" items="${adminNoticeList}">
                       <tbody>
                           <tr>
                              <td>
                                <a href="${contextPath}/viewNoticeDetail.do?nNumber=${item.nNumber}">
                                  ${item.nNumber}
                              </td>
                              <td>
                                <a href="${contextPath}/viewNoticeDetail.do?nNumber=${item.nNumber}">
                                ${item.nTitle}
                              </td>
                              <td>
                                <a href="${contextPath}/viewNoticeDetail.do?nNumber=${item.nNumber}">
                                ${item.uId}
                              </td>
                              <td>
                              <a href="${contextPath}/viewNoticeDetail.do?nNumber=${item.nNumber}">
                                ${item.nDate}
                              </td>
                              <td>
                                <form>
                                    <input type="checkbox" class="deleteCheckbox" name="nNumbers" value="${item.nNumber}">
                                </form>
                              </td>
                           </tr>
                       </tbody>
                    </c:forEach>
                </table>
            </div>
            <div class="adminMainPagination">
                <c:if test="${currentPage > 1}">
                    <a href="${contextPath}/adminNoticeList.do?page=${currentPage - 1}">이전</a>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="active">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${contextPath}/adminNoticeList.do?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="${contextPath}/adminNoticeList.do?page=${currentPage + 1}">다음</a>
                </c:if>
            </div>
       </div>
      </form>
   </div>

    <!--새 글 작성-->
    <div class="adminNoticeListBody" id="noticeReg" style="display:none;">
        <div class="adminNoticeListWholeContainer">
            <form id="noticeRegForm" method="post" enctype="multipart/form-data"
                        action="${contextPath}/addNotice">

                <div class="adminNoticeRegDiv">
                    <h1>공지사항 등록</h1>
                    <div class="buttonContainer2">
                        <table class="noticeRegTable">
                            <tr height="30px">
                                <th>
                                    제목
                                </th>
                                <td colspan="5">
                                    <label for="noticeTitle"></label>
                                    <input type="text" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력 해주세요." required>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    내용
                                </th>
                                <td colspan="5">
                                    <label for="noticeContent"></label>
                                    <textarea id="noticeContent" name="noticeContent" placeholder="공지사항을 입력 해주세요." required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    첨부파일
                                </th>
                                <td colspan="5" background-color="white" class="click_fileUpload">
                                   <label for="nAttachPath" class="click_fileUpload_label">파일 선택</label>
                                   <input type="file" id="nAttachPath" name="nAttachPath" class="hidden_file_input">
                                   <span id="file-name">선택된 파일 없음</span>
                                </td>
                            </tr>
                        </table>
                        <button type="submit" onclick="submitNotice()">등록</button>
                        <button type="button" onclick="goNoticeList()">목록</button>
                    </div>
               </div>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        function showNoticeForm() {
            document.getElementById('noticeReg').style.display = 'block';
            document.getElementById('noticeListForm').style.display = 'none';
            document.getElementById('adminMainSearch-box').style.display = 'none';
            document.getElementById('adminNoticeListWholeContainer2').style.display = 'none';
        }

        function showNoticeDetail() {
            window.location.href = "${contextPath}/viewNoticeDetail.do";
        }

        function goNoticeList() {
            window.location.href = "${contextPath}/adminNoticeList.do";
        }

        function submitNotice() {
            const title = document.getElementById('noticeTitle').value;
            const content = document.getElementById('noticeContent').value.replace(/\n/g, "<br>");
            const file = document.getElementById('nAttachPath').files[0];

            const formData = new FormData();
            formData.append('noticeTitle', title);
            formData.append('noticeContent', content);
            formData.append('nAttachPath', file);

            fetch("${contextPath}/addNotice", {
                method: 'POST',
                body: formData
            })
            .then(response => response.JSON())
            .then(result => {
                if (result === "addNotice_success") {
                    window.location.href = `./viewNoticeDetail.do?nNumber=${result.nNumber}`;
                } else {
                    alert("공지사항 등록 실패");
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }

        function deleteSelectedNotices() {
            const checkboxes = document.querySelectorAll('input[name="nNumbers"]:checked');
            const selectedNumbers = Array.from(checkboxes).map(checkbox => parseInt(checkbox.value));

            console.log("Selected numbers:", selectedNumbers);

            if (selectedNumbers.length > 0) {
                fetch("${contextPath}/deleteNoticesAjax", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({nNumbers: selectedNumbers })
                })
                .then(response => response.text())
                .then(result => {
                    console.log("Server response:", result);
                    if (result === "success") {
                        window.location.reload();
                    } else {
                        alert("공지글 삭제 실패");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
            } else {
                alert("삭제할 공지사항을 선택해주세요.");
            }
        }

        function handleNoticeItemClick(event) {
            const nNumber = event.target.dataset.nNumber;
            const detailUrl = `/detail?nNumber=${nNumber}`;
            window.location.href = detailUrl;
        }

        const noticeList = document.querySelectorAll('.notice-item');
        noticeList.forEach(item => {
            item.addEventListener('click', handleNoticeItemClick);
        });

        document.getElementById('nAttachPath').addEventListener('change', function() {
            var fileName = this.files[0] ? this.files[0].name : '선택된 파일 없음';
            document.getElementById('file-name').textContent = fileName;
        });
    </script>
</body>
</html>