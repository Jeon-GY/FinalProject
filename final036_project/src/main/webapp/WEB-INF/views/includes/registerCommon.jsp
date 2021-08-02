<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<!-- "../product/product.jsp" -->
	<div class="form-group">
		<input name="postId" type="hidden" value="${post.postId}" class="id" readonly>
	</div>
	<div class="form-group">
		<input type="hidden" id="selectLocation" name="locationId" readonly>
	</div>
	<div class="form-group">
		<select name="Loc" id="locationMenu">
		    <option value="">지역 선택</option>
				<c:forEach items="${bigLocation}" var="bLoc">
					<option id="${bLoc.locationId}" value="${bLoc.locationId}">${bLoc.locationName}</option>
				</c:forEach>
		</select>
		<select name="detailLoc" id="locationDetail">
		    <option value="">세부 지역 선택</option>
		</select>
	</div>
	<div class="form-group">
		<input type="hidden" id="selectProduct" name="productCategoryId" readonly>
	</div>
	<div class="form-group">
		<select name="Product" id="productMenu">
		    <option value="">상품 분류</option>
				<c:forEach items="${productCategory}" var="product">
					<option id="${product.productCategoryId}"
						value="${product.productCategoryId}">${product.productCategoryName}</option>
				</c:forEach>
		</select>
	</div>
	<div id="pptForSaleList">
		<div class="form-group">
			<label>판매자ID</label> <input name="userId" 
				value="${pptForSaleList[0].userId}" class="id" readonly>
		</div>
		<div class="form-group">
			<input name="pptForSaleId" type="hidden"
				value="${pptForSaleList[0].pptForSaleId}" class="id" readonly>
		</div>
		<div class="form-group">
			<label>게시글 제목</label> <input name="postName" value="${post.postName}" class="form-control" readonly>
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