<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div>
			<!-- "../product/product.jsp" -->
			<div class="form-group">
				<label>지역</label> <input name="locationId" value="${pptForSaleList[0].locationId}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>제목</label> <input name="title" value="${pptForSaleList[0].title}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>중량</label> <input name="weight" value="${pptForSaleList[0].weight}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>가격</label> <input name="price" value="${pptForSaleList[0].price}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>판매수</label> <input id="sellCount" name="sellCount" value="${post.sellCount}" class="form-control" readonly>
				<label>별점</label> <input id="rateScore" name="rateScore" value="${post.rateScore}" class="form-control" readonly>
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
				<div id="divProductDetail">
					<!-- "../postDetail/productDetailCommon.jsp" -->
					<div class="form-group">
						<label>상세정보</label>
						<textarea id="txaContent" name="content" class="form-control"
							rows="3" readonly>${pptForSaleList[0].content}</textarea>
					</div>
				</div>
			</div>
			<%@include file="../common/attachFileManagement.jsp"%>
			<%@include file="../includes/replyManagement.jsp"%>
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

<script type="text/javascript" src="\resources\js\post\reply.js"></script>
<script type="text/javascript" src="\resources\js\util\dateFormat.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	adjustCRUDAtAttach('조회');
	
	showReplyList(1, 1);
	<c:forEach var="attachVOInStr" items="${pptForSaleList[0].attachListInGson}">
		appendUploadUl('<c:out value= "${attachVOInStr}" />');
	</c:forEach>
	
	
});
var csrfHN = "${_csrf.headerName}";
var csrfTV = "${_csrf.token}";

$(document).ajaxSend(
	function(e, xhr) {
		xhr.setRequestHeader(csrfHN, csrfTV);
	}
);


// 등록될 장소(showReplyList())
var ulReview = $("#ulReview");
var ulQnA = $("#ulQnA");
// paging 처리
var replyReviewPaging = $("#replyReviewPaging");
var replyQnAPaging = $("#replyQnAPaging");
// current pageNum
var reviewPageNum = 1;
var qnaPageNum = 1;
// db에 등록될 기준 id
var originalId = "${pptForSaleList[0].pptForSaleId}";
// modal 활용을 위한 values
var modal = $("#modal");
var inputReplyer = modal.find("input[name='replyer']");
var inputReplyTitle = modal.find("input[name='replyTitle']");
var inputReplyContent = modal.find("input[name='replyContent']");
var inputReplyDate = modal.find("input[name='replyDate']");
var btnRegister = $("#btnRegister");
var btnModify = $("#btnModify");
var btnRemove = $("#btnRemove");
/* ######################## Review & QnA ######################## */
// Review & QnA 출력
function showReplyList(reviewPageNum, qnaPageNum){
	
	replyService.getReplyList(
		{
			originalId : originalId,
			reviewPage : reviewPageNum || 1,
			qnaPage : qnaPageNum || 1
		},
		function(criAndReplyList) {
			var reviewCriteria = criAndReplyList.a;
			var qnaCriteria = criAndReplyList.b;
			var reviewList = criAndReplyList.c;
			var qnaList = criAndReplyList.d;
			
			
			if(reviewList == null || reviewList.length == 0){
				ulReview.html("");
			}
			if(qnaList == null || qnaList.length == 0){
				ulQnA.html("");
			}
			
			ulReview.html(printReplyByRecursion(reviewList, false));
			ulQnA.html(printReplyByRecursion(qnaList, false));
			replyReviewPaging.html(reviewCriteria.pagingDiv);
			replyQnAPaging.html(qnaCriteria.pagingDiv);
		},
		function(errMsg){
			alert("댓글 목록 조회 오류 :" + errMsg);
		}		
	);
}
function printReplyByRecursion(listReply, needUl) {
	if(needUl)
		strLiTags = "<ul>";
	else 
		strLiTags = "";
	
	for (var i = 0, len = listReply.length || 0; i < len; i++) {
		strLiTags += '<li class="clearfix" data-ppt_for_sale_id="' + listReply[i].pptForSaleId +'">';				
		strLiTags += '	<div>';
		strLiTags += '		<div>';
		if(!needUl)
			strLiTags += '			<strong>' + listReply[i].userId + '</strong>';
		if(needUl)
			strLiTags += '			▶<strong>' + listReply[i].userId + '</strong>';
		strLiTags += '			<small>' + dateFormatService.getWhenPosted(listReply[i].updateDate) + '</small>';
		if(!needUl && loginUserId != "")
			strLiTags += '<button class="btn btn-primary btn-xs pull-right" value="' + listReply[i].pptForSaleId +'">답글달기</button>';	
		strLiTags += '		</div>';
		strLiTags += '		<p>' + listReply[i].content + '</p>';
		strLiTags += '	</div>';
		if (listReply[i].pptForSaleVOList != null) { // 각각의 댓글에 대댓글이 달렸는지 체크 후 달렸다면 출력하는 함수를 실행
			strLiTags += printReplyByRecursion(listReply[i].pptForSaleVOList, true);
		}
		strLiTags += '</li>';
	}
	if(needUl)
		strLiTags += "</ul>";
	return strLiTags;
}
replyReviewPaging.on("click", "li a", function(e) {
	e.preventDefault();
	reviewPageNum = $(this).attr("href");
	showReplyList(reviewPageNum, qnaPageNum);
});
replyQnAPaging.on("click", "li a", function(e) {
	e.preventDefault();
	qnaPageNum = $(this).attr("href");
	showReplyList(reviewPageNum, qnaPageNum);
});
/* #################### Modal #################### */
$("#btnCloseModal").on("click", function() {
	modal.modal("hide");
});
// 댓글 신규 용도의 모달 창 열기.
$("button[name=btnOpenModalForNew]").on("click", function(e) {
	modal.data("original_id", originalId); // 창 띄울때 원글id를 데이터로 달아줌.
	$("#btnRegister").val($(this).val());
	modalForCreate();
});
// 대댓글 신규 용도의 모달 창 열기
$(".reply").on("click", "li button", function(e) {
	e.preventDefault();
	modal.data("original_id", $(this).val()); // 대댓글 모달창띄울때 댓글 id를 데이터로 달아줌
	modalForCreate();
});
function modalForCreate() {
	//모달에 들어있는 모든 내용 청소
	modal.find("input").val("");
	
	//신규 댓글 등록할 때 등록일자는 defualt처리. 따라서 보여 줄 필요가 없어요.
	inputReplyDate.closest("div").hide();
	
	if(loginUserId != null)
		inputReplyer.val(loginUserId);
	else
		inputReplyer.attr("placeholder", "Insert Name");
	
	btnModify.hide();
	btnRemove.hide();
	btnRegister.show();
	
	modal.modal("show");
}
//목록에서 특정 댓글을 클릭하면 해당 댓글의 상세 정보를 Ajax-rest로 읽고 이를 모달창에 보여준다.
//특정 댓글은 동적으로 추가된 것이기에 이벤트 위임 방식("li")을 활용하여야 한다.
$(".reply").on("click", "li p", function(e) {
	var clickedLi = $(this).closest("li");
	replyService.getReply(
		clickedLi.data("ppt_for_sale_id"),	
		function(replyObj) {
			//수정 또는 삭제 시 댓글의 아이디가 필요합니다.
			modal.data("ppt_for_sale_id", replyObj.pptForSaleId);
			inputReplyer.val(replyObj.userId);
			inputReplyTitle.val(replyObj.title);
			inputReplyContent.val(replyObj.content);
			inputReplyDate.val(dateFormatService.getWhenPosted(replyObj.updateDate));
			
			inputReplyer.attr("readonly", true);
			inputReplyDate.attr("readonly", true);
			
			if(replyObj.userId.indexOf(loginUserId) == 0 && loginUserId != ""){
				btnModify.show();
				btnRemove.show();
				btnRegister.hide();
			} else {
				btnModify.hide();
				btnRemove.hide();
				btnRegister.hide();
			}
				
			
			
			modal.modal("show");
		},
		function(errMsg){
			alert("댓글 조회 오류 :" + errMsg);
		}
	);
});
//모달 창에서 내용을 사용자가 입력한 다음에 등록 버튼을 누르면 댓글로 등록하고 목록을 1쪽부터 다시 보여준다.
btnRegister.on("click", function(e) {
	var reply = {
		content	: inputReplyContent.val(),
		price : $(this).val()
	};
	replyService.addReply(
		modal.data("original_id"),
		reply,
		function(newReplyId) {
			
			modal.find("input").val("");	//들어있는 값 청소
			modal.modal("hide");
			
			showReplyList(1, 1);
		},
		function(errMsg){
			alert("댓글 등록 오류 :" + errMsg);
		}		
	);
});
//댓글 상세 내용이 모달창에 나타났으며 작성자가 그 내용을 수정하고 수정 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnModify.on("click", function(e) {
	replyService.updateReply(
		{
			pptForSaleId:modal.data("ppt_for_sale_id"),
			content:inputReplyContent.val()
		},	
		function(resultMsg) {
			modal.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showReplyList(1, 1);
		},
		function(errMsg){
			alert("댓글 수정 오류 :" + errMsg);
		}
	);
	
});
//댓글 상세 내용이 모달창에 나타났으며 작성자가 삭제 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnRemove.on("click", function(e) {
	replyService.removeReply(
		modal.data("ppt_for_sale_id"),
		function(delResult) {
			modal.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showReplyList(1, 1);
		},
		function(errMsg){
			alert("댓글 삭제 오류 :" + errMsg);
		}		
	);
});
function fnMove(seq){
    var offset = $("#div" + seq).offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}
</script>