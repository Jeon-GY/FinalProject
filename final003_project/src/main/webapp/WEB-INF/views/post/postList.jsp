<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="www.TPP.com.board.model.PostVO"%>


<%@include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">


   <!-- DataTales Example -->
   <div class="card shadow mb-4">
      <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">${boardName}목록</h6>
      </div>
      <div class="card-body">
         <!-- Paging 이벤트에서 서버로 요청 보낼 인자들을 관리합니다. -->
         <form id='frmList' action='/post/postList' method='get'>
            <input type="hidden" name='boardId' value='${boardId}'>
            <input type="submit">
         </form>

         <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
               cellspacing="0">
               <thead>
                  <tr>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>판매수</th>
                     <th>별점</th>
                     <th>등록 및 수정일</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach items="${postList}" var="post">
                     <tr>
                        <td><a class='anchor4post' href="${post.postId}">${post.postTitle}</a></td>
                        <td>${post.seller.userName}</td>
                        <td>${post.sellCount}</td>
                        <td>${post.rate}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${post.updateDate}" /></td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
   </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>