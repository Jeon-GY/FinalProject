<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<button data-oper='category' class="btn btn-primary">카테고리</button>
			<button data-oper='best' class="btn btn-primary">베스트</button>
			<button data-oper='live' class="btn btn-primary">라이브쇼</button>
			<button data-oper='search' class="btn btn-primary">검색창</button>
			<button data-oper='cart' class="btn btn-primary">장바구니</button>
			
			<form id="frmPost" method="post" action="/post/registerPost">
				<button id="btnRegisterPost" type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-secondary">초기화</button>
				
				<%@include file="../includes/registerCommon.jsp" %>
			
				<input type="hidden" name="boardId" value="5">
			</form>
		</div>
	</div>
</div>

<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	controlInput('등록');
	
	$("#locationMenu").on("click", "li", function(e) {
	
		var clickedLi = $(this);
		var location_id = clickedLi.val();
		var locationDetail = $("#locationDetail");
		
		getLoc.locationList(
				location_id,
				function(locationList) {
					var input = '';
					for (var i = 0, len = locationList.length || 0; i < len; i++){
						input += '<li value="' + locationList[i].locationId + '">' + locationList[i].locationName + '</li>';
					}
					locationDetail.empty();
					locationDetail.append(input);
				},
				function(errMsg){
					alert("지역 조회 오류 :" + errMsg);
				}		
			);
	});
	
	$("#locationDetail").on("click", "li", function(e) {
		var ret = $(this).val();
		$("#selectLocation").attr("value", ret);
	});

});
	
function fnMove(seq) {
	var offset = $("#div" + seq).offset();
	$('html, body').animate({
		scrollTop : offset.top}, 400);
}
</script>


