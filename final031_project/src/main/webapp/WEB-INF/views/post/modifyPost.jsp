<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
		<form id="frmPost" action="/post/modifyPost" method="post">
			<button type="submit" data-oper='modify' class="btn btn-primary">수정 완료</button>
			<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='list' class="btn btn-secondary">목록으로</button>
			
			<div class="form-group">
				<label>포스트ID</label> 
				<input name="postId" value="${post[0].postId}" class="form-control" readonly>
			</div>
			
			<div class="form-group">
				<label>제목</label> 
				<input name="postName" value="${post[0].postName}" class="form-control" readonly>
			</div>
			
			<div class="form-group">
				<label>상품명</label> 
				<input name="title" value="${pptForSaleList[0].title}" class="form-control" readonly>
			</div>
			
			<div class="form-group">
				<input type="hidden" name="pptForSaleId" value="${pptForSaleList[0].pptForSaleId}" class="form-control" readonly>
			</div>

			<div class="form-group">
				<label>중량</label>
				<input name="weight" value="${pptForSaleList[0].weight}" class="form-control" readonly>
			</div>
			
			<div class="form-group">
				<label>가격</label>
				<input name="price" value="${pptForSaleList[0].price}" class="form-control" readonly>
			</div>
			
			<div class="form-group">
				<label>상세정보</label>
				<textarea id="txaContent" name="content" class="form-control" rows="3" readonly>${pptForSaleList[0].content}</textarea>
			</div>
			
			<input type="hidden" name='boardId' value='${boardId}'>
		</form>
			
		
			<div class="form-group">
				<label>등록시점 : </label>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${post[0].registrationDate}" />
				<label>, 수정시점 : </label>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${post[0].updateDate}" />
			</div>
			
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
			frmPost.attr("action", "/post/managementProduct").attr("method", "get");
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
	if (includer === '등록') {
		$('.form-control').attr("readonly", false);
		$('.val').attr("readonly", false);
		$('.id').attr("readonly", true);
		$('#title').attr("readonly", false);
		$('#txaContent').attr("readonly", false);
	}
	if (includer === '수정') {
		$('.form-control').attr("readonly", false);
		$('.modi').attr("readonly", false);
		$('.id').attr("readonly", true);
	}

}
</script>
