<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<!-- "../product/product.jsp" -->
	<div class="form-group">
		<label>포스트ID</label> 
		<input name="postId" value="${post.postId}" class="id" readonly>
	</div>
	<div class="form-group">
		<label>지역ID</label> 
		<input name="locationId" value="${location.locationId}" class="id" readonly>
	</div>
	<div class="form-group">
		<label>지역이름</label> 
		<input name="locationName" value="${location.locationName}" class="form-control" readonly>
	</div>
	<div class="form-group">
		<label>판매자ID</label> 
		<input name="sellerId" value="${post.sellerId}" class="id" readonly>
	</div>
	<div class="form-group">
		<label>상품ID</label> 
		<input name="productId" value="${product.productId}" class="id" readonly>
	</div>
	<div class="form-group">
		<label>게시글 제목</label> 
		<input name="postTitle" value="${post.postTitle}" class="form-control" readonly>
	</div>
	<div class="form-group">
		<label>상품명</label> 
		<input name="productName" value="${product.productName}" class="form-control" readonly>
	</div>
	<div class="form-group">
		<label>중량</label> 
		<input id="productAmount" name="productAmount" value="${product.productAmount}" class="form-control" readonly>
	</div>
	<div class="form-group">
		<label>갯수</label> 
		<input id="productCount" name="productCount" value="${product.productCount}" class="form-control" readonly>
	</div>
	<div class="form-group">
		<label>가격</label>
		<input id="productPrice" name="productPrice" value="${product.productPrice}" class="form-control" readonly>
	</div>
	<div class="form-group">
		<label>첨부 이미지</label> 
		<input name="image" value="${post.image}" class="form-control" readonly>
	</div>
	<div class="form-group">
		<label>상세 정보</label>
		<input id="postInfoContent" name="postInfoContent" value="${postInfoList.postInfoContent}" class="form-control" readonly>
	</div>

	<div class="form-group">
	<label>등록시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post.registrationDate}" />
	<label>, 수정시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post.updateDate}" />
</div>
</div>
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