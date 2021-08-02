<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="128kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="www.TPP.com.board.model.PptForSaleVO"%>


<%@include file="../includes/header.jsp"%>
<!-- Start Top Search -->
<div class="top-search">
	<div class="container">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-search"></i></span> <input
				type="text" class="form-control" placeholder="Search"> <span
				class="input-group-addon close-search"><i class="fa fa-times"></i></span>
		</div>
	</div>
</div>
<!-- End Top Search -->

<!-- Start All Title Box -->
<div class="all-title-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>Shop</h2>
				<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Shop</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End All Title Box -->

		
<!-- Start Shop Page  -->
<div class="shop-box-inner">
	<div class="container">
		<div class="row">
			<div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
				<div class="right-product-box">
					<div class="product-item-filter row">
						<div class="col-12 col-sm-8 text-center text-sm-left">
							<div class="toolbar-sorter-right">
								<span>Sort by</span>
								<select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
									<option data-display="Select">Nothing</option>
									<option value="0">Recently</option>
									<option value="1">Best Selling</option>
									<option value="2">Best Rate</option>
								</select>
							</div>
							<p>Showing all ${criteria.total} results</p>
						</div>
						<div class="col-12 col-sm-4 text-center text-sm-right">
							<ul class="nav nav-tabs ml-auto">
								<li><a class="nav-link active" href="#grid-view"
									data-toggle="tab"> <i class="fa fa-th"></i>
								</a></li>
								<li><a class="nav-link" href="#list-view"
									data-toggle="tab"> <i class="fa fa-list-ul"></i>
								</a></li>
							</ul>
						</div>
					</div>

					<div class="product-categorie-box">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active"
								id="grid-view">
								<div class="row">
									<c:forEach items="${postList}" var="post">
										<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
											<div class="products-single fix">
												<div class="box-img-hover">
													<div class="type-lb">
														<p class="sale">Sale</p>
													</div>
														<img src="/resources/images/logo.png" class="img-fluid">
														<!-- 
													<c:forEach items="${post.pptForSaleList}" var="ppt">
														<c:if test="${ppt.listAttach[0].fileCallPath} == null">
														</c:if>
														<img src='/uploadFiles/display?fileName=${ppt.listAttach[0].fileCallPath}' class="img-fluid">
													</c:forEach>
													 -->
													<div class="mask-icon">
														<ul>
															<li><a href="#" data-toggle="tooltip"
																data-placement="right" title="View"><i
																	class="fas fa-eye"></i></a></li>
															<li><a href="#" data-toggle="tooltip"
																data-placement="right" title="Compare"><i
																	class="fas fa-sync-alt"></i></a></li>
															<li><a href="#" data-toggle="tooltip"
																data-placement="right" title="Add to Wishlist"><i
																	class="far fa-heart"></i></a></li>
														</ul>
														<a class="cart" href="#">Add to Cart</a>
													</div>
												</div>
												<div class="why-text">
													<h4>
														<a class='anchor4post' href="${post.postId}">${post.postName}</a>
													</h4>
													<h5>가격미정</h5>
													<p>판매수 : ${post.sellCount}</p>
													<p>별점 : ${post.rateScore}</p>
													등록일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.updateDate}" />
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Shop Page -->

<form id='frmList' action='/post/postList' method='get'>
	<input type="hidden" name='boardId' value='${boardId}'>
	<input type="hidden" name='searching' value='${criteria.searching}'>
	<input type="hidden" name='order' value='${criteria.order}'>
	<input type="hidden" name='pageNumber' value='${criteria.pageNumber}'>
	<input type="hidden" name='amount' value='${criteria.amount}'>
</form>	

<!-- 페이징 처리 -->
<div class='fa-pull-right'>
	<ul id='ulPagination' class='pagination'>
		<c:if test="${criteria.prev}">
			<li class="page-item previous"><a class='page-link' href="${criteria.startPage - 1}">&lt;&lt;</a></li>
		</c:if>
		<c:forEach var="num" begin="${criteria.startPage}" end="${criteria.endPage}">
			<li class='page-item ${criteria.pageNumber == num ? "active" : ""}'>
				<a class='page-link' href="${num}">${num}</a>
			</li>
		</c:forEach>
		<c:if test="${criteria.next}">
			<li class="page-item next"><a class='page-link' href="${criteria.endPage + 1}">&gt;&gt;</a></li>
		</c:if>
	</ul>
</div>

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
	
	/* 
	$('#btnSearch').on('click', function(eInfo){
		eInfo.preventDefault();

		if($("input[name='searching']").val().trim() === ''){
			alert('검색어를 입력하세요');
			return;
		}
		$("input[name='pageNumber']").val("1");
		
		frmList.submit();
	});
	
	$('#btnOrder1').on('click', function(e) {
		e.preventDefault();
		$("input[name='order']").val($(this).val());
		frmList.submit();
	});
	
	$('#btnOrder2').on('click', function(e) {
		e.preventDefault();
		$("input[name='order']").val($(this).val());
		frmList.submit();
	});
	
	$('#btnOrder3').on('click', function(e) {
		e.preventDefault();
		$("input[name='order']").val($(this).val());
		frmList.submit();
	});
	*/
});
</script>