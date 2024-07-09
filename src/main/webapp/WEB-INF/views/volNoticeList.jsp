<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page import="dc.human.gbnb.humanConnect.volunteer.vo.VolNoticeListVO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HumanConnect 공지사항</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<jsp:include page="nevi.jsp" />
<!--공지사항 목록 및 삭제-->
    <div class="adminNoticeListWholeContainer">
    <form id="noticeListForm" method="post" enctype="multipart/form-data"
            action="${pageContext.request.contextPath}/deleteNotices.do" style="display:block">
        <div class="adminNoticeListDiv">
            <h1>공지사항</h1>
            <div class="noticeListSomeDiv">
                <table class="noticeListTable">
                   <thead>
                       <tr>
                           <th width="10%">No</th>
                           <th width="53%">제목</th>
                           <th width="10%">작성자</th>
                           <th width="20%">작성일</th>
                       </tr>
                   </thead>
                   <c:forEach var="item" items="${volNoticeList}">
                       <tbody>
                           <tr>
                              <td>
                                <a href="${pageContext.request.contextPath}/viewVolNoticeDetail.do?nNumber=${item.nNumber}&userId=${userId}">
                                  ${item.nNumber}
                              </td>
                              <td>${item.nTitle}</td>
                              <td>${item.uId}</td>
                              <td>${item.nDate}</td>
                           </tr>
                       </tbody>
                    </c:forEach>
                </table>
            </div>
            <div class="paginationNotice">
               <span class="active">1</span>
               <a href="test?page=2">2</a>
               <a href="test?page=3">3</a>
               <a href="test?page=4">4</a>
               <a href="test?page=5">5</a>
               <a href="test?page=6">6</a>
               <a href="test?page=2">다음 &raquo;</a>
            </div>
       </div>
      </form>
   </div>

    <script type="text/javascript">

        <!--공지사항 등록 페이지-->
        function showNoticeForm() {
            document.getElementById('noticeReg').style.display = 'block';
            document.getElementById('noticeListForm').style.display = 'none';
        }

        function showNoticeDetail() {
                window.location.href = "${pageContext.request.contextPath}/viewVolNoticeDetail.do";
            }

        function goNoticeList() {
                          window.location.href = "${pageContext.request.contextPath}/volNoticeList.do?userId=${userId}";
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