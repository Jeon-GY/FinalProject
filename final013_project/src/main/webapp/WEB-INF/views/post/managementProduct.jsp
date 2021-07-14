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
         <h6 class="m-0 font-weight-bold text-primary">${boardName}</h6>
      </div>
      <div class="card-body">
         <!-- Paging 이벤트에서 서버로 요청 보낼 인자들을 관리합니다. -->
         <form id='frmManagementProduct' action='/post/managementProduct' method='get'>
			<button type="submit" data-oper='register' class="btn btn-primary">상품 등록</button>
            <input type="hidden" name='boardId' value='${boardId}'>
         </form>
         
         <form id='frmModify' action='/post/modifyPost' method='get'>
         	<input type="hidden" name='boardId' value='${boardId}'>
         </form>
         
         <form id='frmSearching' action='/post/postList' method='get'>
			<input type="text" name="searching" value='${criteria.searching}'>
			<button id="btnSearch" class="btn btn-primary">검색</button>
			
			<input type="hidden" name='boardId' value='${boardId}'>
			<input type="hidden" name='pageNumber' value='${criteria.pageNumber}'>
			<input type="hidden" name='amount' value='${criteria.amount}'>
		</form>
		
         <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
               cellspacing="0">
               <thead>
                  <tr>
                     <th>제목</th>
                     <th>판매 수량</th>
                     <th>별점</th>
                     <th>등록 및 수정일</th>
                     <th>수정 및 삭제</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach items="${postListByUserId}" var="post">
                     <tr>
                        <td><a class='anchor4post' href="${post.postId}">${post.postTitle}</a></td>
                        <td>${post.sellCount}</td>
                        <td>${post.rateScore}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${post.updateDate}" /></td>
                        <td><a class='anchor4modify' data-oper='modify' href="${post.postId}">수정 및 삭제</a></td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            <!-- 페이징 처리 -->
				<div class='fa-pull-right'>
					<ul id='ulPagination' class='pagination'>
						<c:if test="${criteria.prev}">
							<li class="page-item previous"><a class='page-link'
								href="${criteria.startPage - 1}">&lt;&lt;</a></li>
						</c:if>
						<c:forEach var="num" begin="${criteria.startPage}"
							end="${criteria.endPage}">
							<li
								class='page-item ${criteria.pageNumber == num ? "active" : ""}'>
								<a class='page-link' href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${criteria.next}">
							<li class="page-item next">
								<a class='page-link'href="${criteria.endPage + 1}">&gt;&gt;</a>
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
	<input type="hidden" name='pageNumber' value='${criteria.pageNumber}'>
	<input type="hidden" name='amount' value='${criteria.amount}'>
</form>

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	var frmManagementProduct = $('#frmManagementProduct');
	var frmModify = $('#frmModify');

	/* 특정 게시글에 대한 상세 조회 처리 */
	$('.anchor4post').on('click', function(e){
		e.preventDefault();
		var postId = $(this).attr('href');
		frmManagementProduct.append("<input name='postId' type='hidden' value='" + postId + "'>");
		frmManagementProduct.attr('action', '/post/readPost');
		frmManagementProduct.attr('method', 'get');
		frmManagementProduct.submit();

	});
	
	$('.anchor4modify').on('click', function(e){
		e.preventDefault();
		var postId = $(this).attr('href');
		frmModify.append("<input name='postId' type='hidden' value='" + postId + "'>");
		frmModify.submit();
	});
	
	$("button").on("click", function(e) {
		//이벤트처리의 전파를 막아서 어떤 미리 개잘 되어있는 이벤트처리를 막는 함수
		e.preventDefault();

		var oper = $(this).data("oper");
		var boardIdInput = frmManagementProduct.find("#boardId");
		if (oper === 'register') {
			frmManagementProduct.attr("action", "/post/registerPost");
			frmManagementProduct.append(boardIdInput);
		}
		frmManagementProduct.submit();
	});
	
	var frmPaging = $('#frmPaging');
	$('.page-item a').on('click', function(eInfo) {
		eInfo.preventDefault();
		$("input[name='pageNumber']").val($(this).attr('href'));
		frmPaging.submit();
	});

	
	$('#btnSearch').on('click', function(eInfo){
		eInfo.preventDefault();

		if($("input[name='searching']").val().trim() === ''){
			alert('검색어를 입력하세요');
			return;
		}
		
		$("input[name='pageNumber']").val("1");

		frmSearching.submit();
	});
});
</script>