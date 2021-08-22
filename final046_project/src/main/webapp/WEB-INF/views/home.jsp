<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./includes/header.jsp"%>

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

<!-- Start Slider -->
<div id="slides-shop" class="cover-slides">
	<ul class="slides-container">
		<li class="text-center"><img
			src="/resources/images/banner-01.jpg" alt="">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="m-b-20">
							<strong>특산물 판매점에 오신걸 <br> 환영합니다
							</strong>
						</h1>
						<p class="m-b-40">
							Welcome to the specialty store<br>
						</p>
						<p>
							<a class="btn hvr-hover" href="#">Shop New</a>
						</p>
					</div>
				</div>
			</div></li>
		<li class="text-center"><img
			src="/resources/images/banner-02.jpg" alt="">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="m-b-20">
							<strong>특산물 판매점에 오신걸 <br> 환영합니다
							</strong>
						</h1>
						<p class="m-b-40">
							Welcome to the specialty store<br>
						</p>
						<p>
							<a class="btn hvr-hover" href="#">Shop New</a>
						</p>
					</div>
				</div>
			</div></li>
		<li class="text-center"><img
			src="/resources/images/banner-03.jpg" alt="">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="m-b-20">
							<strong>특산물 판매점에 오신걸 <br> 환영합니다
							</strong>
						</h1>
						<p class="m-b-40">
							Welcome to the specialty store<br>
						</p>
						<p>
							<a class="btn hvr-hover" href="#">Shop New</a>
						</p>
					</div>
				</div>
			</div></li>
	</ul>
	<div class="slides-navigation">
		<a href="#" class="next"><i class="fa fa-angle-right"
			aria-hidden="true"></i></a> <a href="#" class="prev"><i
			class="fa fa-angle-left" aria-hidden="true"></i></a>
	</div>
</div>
<!-- End Slider -->

<!-- Start Categories  -->
<div class="categories-shop">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="shop-cat-box">
					<img class="img-fluid" src="/resources/images/충청북도 충주-사과2.jpg" alt="" /> <a class="btn hvr-hover" href="#">충청북도 충주 사과</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="shop-cat-box">
					<img class="img-fluid" src="/resources/images/충청남도 청양-구기자.jpg" alt="" /> <a class="btn hvr-hover" href="#">충청남도 청양 구기자</a>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="shop-cat-box">
					<img class="img-fluid" src="/resources/images/전라북도 고창-수박2.jpg" alt="" /> <a class="btn hvr-hover" href="#">전라북도 고창 수박</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Categories -->

<!--  Start Products  -->
<div class="products-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="title-all text-center">
					<h1>광고</h1>
					<p>뭐라써야할지모르겠다.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="special-menu text-center">
					<div class="button-group filter-button-group">
						<button class="active" data-filter="*">All</button>
						<button data-filter=".top-featured">추천상품</button>
						<button data-filter=".best-seller">인기상품</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row special-list">
		<!-- 상품 start / 필요data : sale, new, 이미지, postId -->
			<c:forEach items="${postList}" var="post" varStatus="status">
				<div class="col-lg-3 col-md-6 special-grid best-seller">
					<div class="products-single fix">
						<div class="box-img-hover">
							<div class="type-lb">
								<p class="sale">Sale</p>
							</div>
							<img src="" class="img-fluid" name="${post.pptForSaleList[0].listAttachInStringFormat}" id="${status.index}" alt="Image">
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
							<h4><a class='anchor4post' href="${post.postId}">${post.postName}</a></h4>
							<h5>${post.pptForSaleList[0].price} won</h5>
							<p>sell count : ${post.sellCount}</p>
							<p>rate : ${post.rateScore}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		<!-- 상품 end -->
		</div>
	</div>
</div>
<!-- End Products  -->

<!-- Start Blog  -->
<div class="latest-blog">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="title-all text-center">
					<h1>여기에 광고 넣는게 어떨까</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
						sit amet lacus enim.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-4 col-xl-4">
				<div class="blog-box">
					<div class="blog-img">
						<img class="img-fluid" src="/resources/images/blog-img.jpg" alt="" />
					</div>
					<div class="blog-content">
						<div class="title-blog">
							<h3>Fusce in augue non nisi fringilla</h3>
							<p>Nulla ut urna egestas, porta libero id, suscipit orci.
								Quisque in lectus sit amet urna dignissim feugiat. Mauris
								molestie egestas pharetra. Ut finibus cursus nunc sed mollis.
								Praesent laoreet lacinia elit id lobortis.</p>
						</div>
						<ul class="option-blog">
							<li><a href="#"><i class="far fa-heart"></i></a></li>
							<li><a href="#"><i class="fas fa-eye"></i></a></li>
							<li><a href="#"><i class="far fa-comments"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 col-xl-4">
				<div class="blog-box">
					<div class="blog-img">
						<img class="img-fluid" src="/resources/images/blog-img-01.jpg"
							alt="" />
					</div>
					<div class="blog-content">
						<div class="title-blog">
							<h3>Fusce in augue non nisi fringilla</h3>
							<p>Nulla ut urna egestas, porta libero id, suscipit orci.
								Quisque in lectus sit amet urna dignissim feugiat. Mauris
								molestie egestas pharetra. Ut finibus cursus nunc sed mollis.
								Praesent laoreet lacinia elit id lobortis.</p>
						</div>
						<ul class="option-blog">
							<li><a href="#"><i class="far fa-heart"></i></a></li>
							<li><a href="#"><i class="fas fa-eye"></i></a></li>
							<li><a href="#"><i class="far fa-comments"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 col-xl-4">
				<div class="blog-box">
					<div class="blog-img">
						<img class="img-fluid" src="/resources/images/blog-img-02.jpg"
							alt="" />
					</div>
					<div class="blog-content">
						<div class="title-blog">
							<h3>Fusce in augue non nisi fringilla</h3>
							<p>Nulla ut urna egestas, porta libero id, suscipit orci.
								Quisque in lectus sit amet urna dignissim feugiat. Mauris
								molestie egestas pharetra. Ut finibus cursus nunc sed mollis.
								Praesent laoreet lacinia elit id lobortis.</p>
						</div>
						<ul class="option-blog">
							<li><a href="#"><i class="far fa-heart"></i></a></li>
							<li><a href="#"><i class="fas fa-eye"></i></a></li>
							<li><a href="#"><i class="far fa-comments"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Blog  -->
<%@include file="./includes/footer.jsp"%>
<input type="hidden" name='total' value='${criteria.total}'>
<script type="text/javascript">
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
});
</script>