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
                        <td>${post.sellerId}</td>
                        <td>${post.sellCount}</td>
                        <td>${post.rateScore}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${post.updateDate}" /></td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            
            	<!-- 페이징 처리 -->
				<div class='fa-pull-right'>
					<ul id='ulPagination' class='pagination'>
						<c:if test="${pagination.prev}">
							<li class="page-item previous"><a class='page-link'
								href="${pagination.startPage - 1}">&lt;&lt;</a></li>
						</c:if>
						<c:forEach var="num" begin="${pagination.startPage}"
							end="${pagination.endPage}">
							<li
								class='page-item ${pagination.pageNumber == num ? "active" : ""}'>
								<a class='page-link' href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item next">
								<a class='page-link'href="${pagination.endPage + 1}">&gt;&gt;</a>
							</li>
						</c:if>
					</ul>
				</div>
            
         </div>
      </div>
   </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Paging 이벤트에서 서버로 요청 보낼 인자들을 관리합니다. -->
<form id='frmPaging' action='/post/postList' method='get'>
	<input type="hidden" name='boardId' value='${boardId}'>
	<input type="hidden" name='pageNumber' value='${pagination.pageNumber}'>
	<input type="hidden" name='amount' value='${pagination.amount}'>
</form>

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	var frmList = $('#frmList');
	/* 페이징 처리에서 특정 쪽번호를 클릭하였을때 해당 페이지의 정보를 조회하여 목록을 재출력해줌*/
	var frmPaging = $('#frmPaging');
	$('.page-item a').on('click', function(eInfo) {
		eInfo.preventDefault();
		$("input[name='pageNumber']").val($(this).attr('href'));
		frmPaging.submit();
	});

	/* 특정 게시글에 대한 상세 조회 처리 */
	$('.anchor4post').on('click', function(e){
		e.preventDefault();
		var postId = $(this).attr('href');
		var postInfoId = $(this).attr('href');
		frmList.append("<input name='postId' type='hidden' value='" + postId + "'>");
		frmList.attr('action', '/post/readPost');
		frmList.attr('method', 'get');

		frmList.submit();
	});
});
</script>