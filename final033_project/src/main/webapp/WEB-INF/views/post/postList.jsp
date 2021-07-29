<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="128kb" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="www.TPP.com.board.model.PptForSaleVO"%>


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
            <input type="text" name='searching' value='${criteria.searching}'>
            <button id="btnSearch" class="btn btn-primary">검색</button>
            
            <input type="hidden" name='pageNumber' value='${criteria.pageNumber}'>
			<input type="hidden" name='amount' value='${criteria.amount}'>
         </form>

         <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                  <tr>
                     <th>제목</th>
                     <th>판매수</th>
                     <th>별점</th>
                     <th>등록 및 수정일</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach items="${postList}" var="post">
                     <tr>
                        <td><a class='anchor4post' href="${post.postId}">${post.postName}</a></td>
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
						<c:if test="${criteria.prev}">
							<li class="page-item previous"><a class='page-link'
								href="${criteria.startPage - 1}">&lt;&lt;</a></li>
						</c:if>
						<c:forEach var="num" begin="${criteria.startPage}" end="${criteria.endPage}">
							<li class='page-item ${criteria.pageNumber == num ? "active" : ""}'>
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


<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	var frmList = $('#frmList');
	
	/* 페이징 처리에서 특정 쪽번호를 클릭하였을때 해당 페이지의 정보를 조회하여 목록을 재출력해줌*/
	$('.page-item a').on('click', function(eInfo) {
		eInfo.preventDefault();
		$("input[name='pageNumber']").val($(this).attr('href'));
		frmList.submit();
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
	
	$('#btnSearch').on('click', function(eInfo){
		eInfo.preventDefault();

		if($("input[name='searching']").val().trim() === ''){
			alert('검색어를 입력하세요');
			return;
		}
		$("input[name='pageNumber']").val("1");
		
		frmList.submit();
	});
	
});
</script>