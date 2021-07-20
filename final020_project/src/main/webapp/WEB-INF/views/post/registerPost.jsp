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
	
	var btnRegisterPost = $("#btnRegisterPost");
	btnRegisterPost.on("click", function(e) {
		
		
		var pptList = [];
		$("#pptForSaleList input").each(function() {
			pptList.push($(this).val());
		});
		
		
		var objParams = {
				"postName"	: $("input[name=postName]").val(),
				"pptList"   : pptList,
				"location"	: $("#selectLocation").val(),
				"product"	: $("#selectProduct").val()        
			};
		
		if($("#selectLocation").val() == null || $("#selectLocation").val().isEmpty()) {
			alert("지역을 선택하세요");
		}
		if($("#selectProduct").val() == null || $("#selectProduct").val().isEmpty()) {
			alert("제품 카테고리를 선택하세요");
		}
		
		$.ajax({
            url         :   '/post/registerPost',
            dataType    :   'json',
            contentType :   'application/json; charset=UTF-8',
            type        :   "post",
            data        :   objParams,
            success     :   function(retVal){
            	alert("등록 성공");
                frmPost.submit();
            },
            error       :   function(request, status, error){
            	alert("게시글 등록 실패");
            }
        });
	});
	
	
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
	
	
	$("#productMenu").on("click", "li", function(e) {
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


