<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<!-- "../product/product.jsp" -->
	<div class="form-group">
		<label>포스트ID</label> <input name="postId" value="${post.postId}" class="id" readonly>
	</div>
	<div class="form-group">
		<label>포스트 Name</label> <input name="postName" value="${post.postName}" class="form-control" readonly>
	</div>
	<div class="form-group">
		<input id="selectLocation" name="locationId">
	</div>
	<div class="form-group">
		<a href="#" class="nav-link dropdown-toggle arrow"
			data-toggle="dropdown">지역 선택
			<ul class="dropdown-menu" id="locationMenu">
				<c:forEach items="${bigLocation}" var="bLoc">
					<li id="${bLoc.locationId}" value="${bLoc.locationId}">${bLoc.locationName}</li>
				</c:forEach>
			</ul>
		</a>
	</div>
	<div>
		<a href="#" class="nav-link dropdown-toggle arrow"
			data-toggle="dropdown">지역 세부 선택
			<ul class="dropdown-menu" id="locationDetail">
			</ul>
		</a>
	</div>
	<div class="form-group">
		<input id="selectProduct" name="productCategoryId" class="form-control" readonly>
	</div>
	<div class="form-group">
		<a href="#" class="nav-link dropdown-toggle arrow"
			data-toggle="dropdown">상품 분류
			<ul class="dropdown-menu" id="productMenu">
				<c:forEach items="${productCategory}" var="product">
					<li id="${product.productCategoryId}"
						value="${product.productCategoryId}">${product.productCategoryName}</li>
				</c:forEach>
			</ul>
		</a>
	</div>
	<div id="pptForSaleList">
		<div class="form-group">
			<label>판매자ID</label> <input name="userId"
				value="${pptForSaleList[0].userId}" class="id" readonly>
		</div>
		<div class="form-group">
			<label>상품ID</label> <input name="pptForSaleId"
				value="${pptForSaleList[0].pptForSaleId}" class="id" readonly>
		</div>
		<div class="form-group">
			<label>상품명</label> <input name="title"
				value="${pptForSaleList[0].title}" class="form-control" readonly>
		</div>
		<div class="form-group">
			<label>중량</label> <input name="weight"
				value="${pptForSaleList[0].weight}" class="form-control" readonly>
		</div>
		<div class="form-group">
			<label>가격</label> <input name="price"
				value="${pptForSaleList[0].price}" class="form-control" readonly>
		</div>
		<div class="form-group">
			<label>상세 정보</label> <input name="content"
				value="${pptForSaleList[0].content}" class="form-control" readonly>
		</div>
	</div>

	<div class="form-group">
		<label>등록시점 : </label>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${post.registrationDate}" />
		<label>, 수정시점 : </label>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${post.updateDate}" />
	</div>
</div>
<script type="text/javascript" src="\resources\js\common.js"></script>

<script type="text/javascript">
	function controlInput(includer) {
		if (includer === '조회') {
			$('#title').attr("readonly", true);
			$('#txaContent').attr("readonly", true);
		}
		if (includer === '등록' || '수정') {
			$('.form-control').attr("readonly", false);
			$('.id').attr("readonly", true);
			$('#title').attr("readonly", false);
			$('#txaContent').attr("readonly", false);
		}
	}
</script>