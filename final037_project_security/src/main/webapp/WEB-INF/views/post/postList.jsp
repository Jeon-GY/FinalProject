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
								<select class="selectpicker show-tick form-control" onchange="getPostList(this.value)">
									<option value="none">Select Order</option>
									<option value="0">Recently</option>
									<option value="1">Best Selling</option>
									<option value="2">Best Rate</option>
								</select> <input type="hidden" name='boardId' value='${boardId}'>
							</div>
							<p>Showing all ${criteria.total} results</p>
						</div>
						<div class="col-12 col-sm-4 text-center text-sm-right">
							<ul class="nav nav-tabs ml-auto">
								<li><a class="nav-link active" href="#grid-view"
									data-toggle="tab"> <i class="fa fa-th"></i>
								</a></li>
								<li><a class="nav-link" href="#list-view" data-toggle="tab">
										<i class="fa fa-list-ul"></i>
								</a></li>
							</ul>
						</div>
					</div>

					<div class="product-categorie-box">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active" id="grid-view">
								<div class="row">
									<c:forEach items="${postList}" var="post" varStatus="status">
										<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
											<div class="products-single fix">
												<div class="box-img-hover">
													<img src="" class="img-fluid" name="${post.pptForSaleList[0].listAttachInStringFormat}" id="${status.index}">
													<div class="type-lb">
														<p class="sale">Sale</p>
													</div>
													<div class="mask-icon">
														<ul>
															<li><a href="#" data-toggle="tooltip" data-placement="right" title="View">
															<i class="fas fa-eye"></i></a></li>
															<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
															<i class="fas fa-sync-alt"></i></a></li>
															<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist">
															<i class="far fa-heart"></i></a></li>
														</ul>
														<a class="cart" href="#">Add to Cart</a>
													</div>
												</div>
												<div class="why-text">
													<h4>
														<a class='anchor4post' href="${post.postId}">${post.postName}</a>
													</h4>
													<h5>${post.pptForSaleList[0].price} won</h5>
													<p>sell count : ${post.sellCount}</p>
													<p>rate : ${post.rateScore}</p>
													date : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.updateDate}" />
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
			<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
				<div class="product-categori">
					<div class="search-product">
						<form action="#">
							<input class="form-control" placeholder="Search here..."
								type="text">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
					<div class="filter-sidebar-left">
						<div class="title-left">
							<h3>Categories</h3>
						</div>
						<div
							class="list-group list-group-collapse list-group-sm list-group-tree"
							id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a class="list-group-item list-group-item-action"
									href="#sub-men1" data-toggle="collapse" aria-expanded="true"
									aria-controls="sub-men1">Fruits & Drinks <small
									class="text-muted">(100)</small>
								</a>
								<div class="collapse show" id="sub-men1"
									data-parent="#list-group-men">
									<div class="list-group">
										<a href="#"
											class="list-group-item list-group-item-action active">Fruits
											1 <small class="text-muted">(50)</small>
										</a> <a href="#" class="list-group-item list-group-item-action">Fruits
											2 <small class="text-muted">(10)</small>
										</a> <a href="#" class="list-group-item list-group-item-action">Fruits
											3 <small class="text-muted">(10)</small>
										</a> <a href="#" class="list-group-item list-group-item-action">Fruits
											4 <small class="text-muted">(10)</small>
										</a> <a href="#" class="list-group-item list-group-item-action">Fruits
											5 <small class="text-muted">(20)</small>
										</a>
									</div>
								</div>
							</div>
							<div class="list-group-collapse sub-men">
								<a class="list-group-item list-group-item-action"
									href="#sub-men2" data-toggle="collapse" aria-expanded="false"
									aria-controls="sub-men2">Vegetables <small
									class="text-muted">(50)</small>
								</a>
								<div class="collapse" id="sub-men2"
									data-parent="#list-group-men">
									<div class="list-group">
										<a href="#" class="list-group-item list-group-item-action">Vegetables
											1 <small class="text-muted">(10)</small>
										</a> <a href="#" class="list-group-item list-group-item-action">Vegetables
											2 <small class="text-muted">(20)</small>
										</a> <a href="#" class="list-group-item list-group-item-action">Vegetables
											3 <small class="text-muted">(20)</small>
										</a>
									</div>
								</div>
							</div>
							<a href="#" class="list-group-item list-group-item-action">
								Grocery <small class="text-muted">(150) </small>
							</a> <a href="#" class="list-group-item list-group-item-action">
								Grocery <small class="text-muted">(11)</small>
							</a> <a href="#" class="list-group-item list-group-item-action">
								Grocery <small class="text-muted">(22)</small>
							</a>
						</div>
					</div>
					<div class="filter-price-left">
						<div class="title-left">
							<h3>Price</h3>
						</div>
						<div class="price-box-slider">
							<div id="slider-range"></div>
							<p>
								<input type="text" id="amount" readonly
									style="border: 0; color: #fbb714; font-weight: bold;">
								<button class="btn hvr-hover" type="submit">Filter</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Shop Page -->

<!-- 페이징 처리 -->
<div class='fa-pull-right'>
	<ul id='ulPagination' class='pagination'>
		<c:if test="${criteria.prev}">
			<li class="page-item previous"><a class='page-link'
				href="${criteria.startPage - 1}">&lt;&lt;</a></li>
		</c:if>
		<c:forEach var="num" begin="${criteria.startPage}"
			end="${criteria.endPage}">
			<li class='page-item ${criteria.pageNumber == num ? "active" : ""}'>
				<a class='page-link' href="${num}">${num}</a>
			</li>
		</c:forEach>
		<c:if test="${criteria.next}">
			<li class="page-item next"><a class='page-link'
				href="${criteria.endPage + 1}">&gt;&gt;</a></li>
		</c:if>
	</ul>
</div>

<form id='frmList' action='/post/postList' method='get'>
	<input type="hidden" name='boardId' value='${boardId}'>
	<input type="hidden" name='searching' value='${criteria.searching}'>
	<input type="hidden" name='order' value='${criteria.order}'>
	<input type="hidden" name='pageNumber' value='${criteria.pageNumber}'>
	<input type="hidden" name='amount' value='${criteria.amount}'>
	<input type="hidden" name='total' value='${criteria.total}'>
</form>
								
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">

function getPostList(val) {
	if(val == 'none')
		return;
	$("input[name='order']").val(val);
	frmList.submit();
}

function setsrc(total) {
	for(var i=0; i<total; i++){
		var imgtag = $("#" + i);
		var fileCallPath = imgtag.attr('name');
		if(fileCallPath == null || fileCallPath.length < 20){
			imgtag.attr('src', '/resources/images/logo.png');
		} else {
			var path = encodeURI(fileCallPath.substring(1, fileCallPath.length-1));
			imgtag.attr('src', '/uploadFiles/display?fileName=' + path);
		}
	}
}

$(document).ready(function(){
	var total = $("input[name=total]").val();
	setsrc(total);
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