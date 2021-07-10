<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="container-fluid">

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
			<form  id="frmPost" action="/post/modifyPost" method="post">
				<div>
					<!-- "../product/product.jsp" -->
					<div class="form-group">
						<label>포스트ID</label> 
						<input name="postId" value="${post[0].postId}" class="form-control" readonly>
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
						<input name="sellerId" value="${post[0].sellerId}" class="id" readonly>
					</div>
					<div class="form-group">
						<label>상품ID</label> 
						<input name="productId" value="${productList[0].productId}" class="id" readonly>
					</div>
					<div class="form-group">
						<label>게시글 제목</label> 
						<input name="postTitle" value="${post[0].postTitle}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>상품명</label> 
						<input name="productName" value="${productList[0].productName}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>중량</label> 
						<input id="productAmount" name="productAmount" value="${productList[0].productAmount}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>갯수</label> 
						<input id="productCount" name="productCount" value="${productList[0].productCount}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>가격</label>
						<input id="productPrice" name="productPrice" value="${productList[0].productPrice}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>첨부 이미지</label> 
						<input name="image" value="${post[0].image}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>상세 정보 ID</label>
						<input id="postInfoId" name="postInfoId" value="${postInfoList[0].postInfoId}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label>상세 정보</label>
						<input id="postInfoContent" name="postInfoContent" value="${postInfoList[0].postInfoContent}" class="form-control" readonly>
					</div>
				
					<div class="form-group">
					<label>등록시점 : </label>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${post[0].registrationDate}" />
					<label>, 수정시점 : </label>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${post[0].updateDate}" />
				</div>
				
				<button type="submit" data-oper='modify' class="btn btn-primary">수정 완료</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
				<button type="submit" data-oper='list' class="btn btn-secondary">목록으로</button>
				
				<input id="boardId" type="hidden" name="boardId" value="${boardId}">
			</form>
		</div>
	</div>

</div>

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	controlInput('수정');
	
	var frmPost = $("#frmPost");
	
	//처리 우선 순위가 있고 script가 html에 등록되어있는 것보다 앞선다.
	$("button").on("click", function(eventInfo){
		eventInfo.preventDefault();
		
		var oper = $(this).data("oper");
		if(oper === 'remove'){
			frmPost.attr("action", "/post/removePost");
		}else if(oper === 'list'){
			var boardIdInput = frmPost.find("#boardId");
			frmPost.attr("action", "/post/list").attr("method", "get");
			//empty : form에 담겨있는 모든 하위 요소를 없애라
			frmPost.empty();
			frmPost.append(boardIdInput);
		}
		frmPost.submit();
	});
});

function controlInput(includer) {
	if (includer === '조회') {
		$('#title').attr("readonly", true);
		$('#txaContent').attr("readonly", true);
	}
	if (includer === '등록' || includer === '수정') {
		$('.form-control').attr("readonly", false);
		$('.id').attr("readonly", true);
		$('#title').attr("readonly", false);
		$('#txaContent').attr("readonly", false);
	}
}
</script>
