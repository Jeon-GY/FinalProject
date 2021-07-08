<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmPost" method="post" action="/post/registerPost">
				<button id="btnRegisterPost" type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-secondary">초기화</button>
				<input type="hidden" name="boardId" value="5"> <input
					type="hidden" name="sellerId" value="2">
			</form>

			<button data-oper='category' class="btn btn-primary">카테고리</button>
			<button data-oper='best' class="btn btn-primary">베스트</button>
			<button data-oper='live' class="btn btn-primary">라이브쇼</button>
			<button data-oper='search' class="btn btn-primary">검색창</button>
			<button data-oper='cart' class="btn btn-primary">장바구니</button>
		</div>
		<div>
			<!-- "../product/product.jsp" -->
			<div class="form-group">
				<label>지역</label> <input name="location"
					value="${productList[0].locationId}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>상품명</label> <input name="productName"
					value="${productList[0].productName}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>중량</label> <input id="productAmount" name="productAmount"
					value="${productList[0].productAmount}" class="form-control"
					readonly>
			</div>
			<div class="form-group">
				<label>갯수</label> <input id="productCount" name="productCount"
					value="${productList[0].productCount}" class="form-control"
					readonly>
			</div>
			<div class="form-group">
				<label>가격</label> <input id="productPrice" name="productPrice"
					value="${productList[0].productPrice}" class="form-control"
					readonly>
			</div>
			<div class="form-group">
				<label>판매수</label> <input id="sellCount" name="sellCount"
					value="${post.sellCount}" readonly> <label>별점</label> <input
					id="rateScore" name="rateScore" value="${post.rateScore}" readonly>
			</div>

			<button data-oper='buy' class="btn btn-primary">즉시 구매</button>
			<button data-oper='addCart' class="btn btn-primary">장바구니 담기</button>
		</div>

		<!-- "../post/postInfo.jsp" -->
		<body>
			<div>
				<button onclick="fnMove('ProductInfo')" data-oper='productInfo'
					class="btn btn-primary">상품 설명</button>
				<button onclick="fnMove('ProductDetail')" data-oper='productDetail'
					class="btn btn-primary">상세 정보</button>
				<button onclick="fnMove('QnA')" data-oper='QnA'
					class="btn btn-primary">상품 문의</button>
				<button onclick="fnMove('Review')" data-oper='review'
					class="btn btn-primary">상품 후기</button>
			</div>

			<div id="divProductInfo">
				<!-- "../postDetail/productDetailCommon.jsp" -->
				<div class="form-group">
					<label>상품정보</label>
					<textarea id="txaContent" name="content" class="form-control"
						rows="3" readonly>${postInfoList[0].postInfoContent}</textarea>
				</div>

				<div id="divProductDetail">
					<!-- "../postDetail/productDetailCommon.jsp" -->
					<div class="form-group">
						<label>상세정보</label>
						<textarea id="txaContent" name="content" class="form-control"
							rows="3" readonly>${postInfoList[0].postInfoContent}</textarea>
					</div>
				</div>
			</div>

			<div id="divQnA">
				<!-- "../product/product.jsp" -->
				<div class="form-group">
					<label>아이디</label> <input name="id" value="" readonly>
				</div>
				<div class="form-group">
					<label>문의 내용</label> <input id="title" name="title" value="" readonly>
				</div>
			</div>

			<div id="divReview">
				<!-- "../product/product.jsp" -->
				<!-- "../product/product.jsp" -->
				<div class="form-group">
					<label>아이디</label> <input name="id" value="" readonly>
				</div>
				<div class="form-group">
					<label>후기</label> <input id="title" name="title" value=""
						class="form-control" readonly>
				</div>
			</div>
		</body>
	</div>
</div>
<div class="form-group">
	<label>등록시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post.registrationDate}" />
	<label>, 수정시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post.updateDate}" />
</div>
<!-- End of Main Content -->


<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		controlInput('등록');
	});
	
	function controlInput(includer) {
		if (includer === '조회') {
			$('#title').attr("readonly", true);
			$('#txaContent').attr("readonly", true);
		}
		if (includer === '등록') {
			$('.form-control').attr("readonly", false);
			$('#title').attr("readonly", false);
			$('#txaContent').attr("readonly", false);
		}
	}
	
	function fnMove(seq) {
		var offset = $("#div" + seq).offset();
		$('html, body').animate({
			scrollTop : offset.top}, 400);
	}
</script>


