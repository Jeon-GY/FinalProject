<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="128kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="www.TPP.com.board.model.PptForSaleVO"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/listCommon.jsp"%>

<form id='frmList' action='/post/postList' method='get'>
	<input type="hidden" name='boardId' value='${boardId}'>
	<input type="hidden" name='searching' value='${criteria.searching}'>
	<input type="hidden" name='order' value='${criteria.order}'>
	<input type="hidden" name='pageNumber' value='${criteria.pageNumber}'>
	<input type="hidden" name='amount' value='${criteria.amount}'>
	<input type="hidden" name='total' value='${criteria.total}'>
</form>
								
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">

function getPostList(val) {
	if(val == 'none')
		return;
	$("input[name='order']").val(val);
	frmList.submit();
}

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
	listInput('조회');
	
	var total = $("input[name=total]").val();
	setsrc(total);
	var frmList = $('#frmList');
	
	/* 페이징 처리에서 특정 쪽번호를 클릭하였을때 해당 페이지의 정보를 조회하여 목록을 재출력해줌*/
	$('.page-item a').on('click', function(eInfo) {
		eInfo.preventDefault();
		if($(this).val !== ${criteria.pageNumber}){
			$("input[name='pageNumber']").val($(this).attr('name'));
			frmList.submit();
		}else{
			frmList.submit();
		}
	});
	
	/* 특정 게시글에 대한 상세 조회 처리 */
	$('.anchor4post').on('click', function(e){
		e.preventDefault();
		var postId = $(this).attr('href');
		frmList.append("<input name='postId' type='hidden' value='" + postId + "'>");
		frmList.attr('action', '/post/readPost');
		frmList.attr('method', 'get');

		frmList.submit();
	});
	
	$('#btnSearch').on('click', function(eInfo){
		eInfo.preventDefault();

		if($("input[name='searching']").val().trim() === ''){
			alert('검색어를 입력하세요');
			return;
		}
		$("input[name='pageNumber']").val("1");
		
		frmList.submit();
	});
});
</script>