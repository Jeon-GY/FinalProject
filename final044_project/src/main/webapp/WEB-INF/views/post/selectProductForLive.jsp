<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmLive" name="" method="get" action="/post/startLive">
				<div>
					<div class="form-group">
						<select name="live" id="selectedPpt">
						    <option value="">라이브 상품 선택</option>
							<c:forEach items="${pptForSaleList}" var="sale">
								<option value="${sale.pptForSaleId}">${sale.title}</option>
							</c:forEach>
						</select>
						<button id="btnStartLive" type="submit" class="btn btn-primary">라이브 시작!</button>
					</div>
				</div>

				<%@include file="../common/attachFileManagement.jsp"%>
			
				<input type="hidden" name="boardId" value="5">
			</form>
		</div>
	</div>
</div>

<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	adjustCRUDAtAttach('등록');
	
	var frmLive = $('#frmLive');
	var btnStartLive = $("#btnStartLive");
	
	btnStartLive.on("click", function(e) {
		var pptId = $("#selectedPpt option:selected").val();
		frmLive.append("<input name='pptForSaleId' type='hidden' value='" + pptId + "'>");
		frmLive.submit();
	});

	
	$("#locationMenu").on("change", function(e) {
		var clickedOption = $(this);
		var location_id = $("select[name=Loc]").val();
		var locationDetail = $("#locationDetail");
		
		getLoc.locationList(
				location_id,
				function(locationList) {
					var input = '';
					for (var i = 0, len = locationList.length || 0; i < len; i++){
						input += '<option value="' + locationList[i].locationId + '">' + locationList[i].locationName + '</option>';
					}
					locationDetail.empty();
					locationDetail.append(input);
				},
				function(errMsg){
					alert("지역 조회 오류 :" + errMsg);
				}		
			);
	});
	
	$("#locationDetail").on("change", function(e) {
		var ret = $(this).val();
		$("#selectLocation").attr("value", ret);
	});
	
	
	$("#productMenu").on("change", function(e) {
		var ret = $(this).val();
		$("#selectProduct").attr("value", ret);
	});

});


function fnMove(seq) {
	var offset = $("#div" + seq).offset();
	$('html, body').animate({
		scrollTop : offset.top}, 400);
}
</script>


