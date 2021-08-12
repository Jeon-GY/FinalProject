<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Start Top Search -->
<div class="top-search">
	<div class="container">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-search"></i></span>
			<input type="text" class="form-control" placeholder="Search">
			<span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
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
					<button id="btnRegister" hidden>상품 등록</button>
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
													<br><a hidden class='anchor4modify' data-oper='modify' href="${post.postId}">수정 및 삭제</a>
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
				<!-- 페이징 처리 -->
				<div class='fa-pull-right'>
					${criteria.pagingDiv}
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Shop Page -->
<script type="text/javascript">
	function listInput(includer) {
		if (includer === '조회') {
		}
		if (includer === '관리') {
			$('#btnRegister').attr("hidden", false);
			$('.anchor4modify').attr("hidden", false);
		}
	}
</script>