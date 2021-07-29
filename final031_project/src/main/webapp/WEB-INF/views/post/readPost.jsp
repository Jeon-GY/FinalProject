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
		</div>
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
				<label>판매수</label> <input id="sellCount" name="sellCount" value="${post[0].sellCount}" class="form-control" readonly>
				<label>별점</label> <input id="rateScore" name="rateScore" value="${post[0].rateScore}" class="form-control" readonly>
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

			<%@include file="../includes/replyManagement.jsp"%>
		</body>
	</div>
</div>

<div class="form-group">
	<label>등록시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post[0].registrationDate}" />
	<label>, 수정시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post[0].updateDate}" />
</div>
<!-- End of Main Content -->


<%@include file="../includes/footer.jsp"%>

<script type="text/javascript" src="\resources\js\post\reply.js"></script>
<script type="text/javascript" src="\resources\js\util\dateFormat.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	showQnAList(1);
	showReviewList(1);
});
var QnAId = $("#btnRegisterQnA").val();
var ReviewId = $("#btnRegisterReview").val();

var ulQnA = $("#ulQnA");
var originalQnAId = "${pptForSaleList[0].pptForSaleId}" + QnAId; 

var originalReviewId = "${pptForSaleList[0].pptForSaleId}" + ReviewId; 

function showQnAList(pageNum){
	replyService.getReplyList(
		{
			orgId : originalQnAId,
			page : pageNum || 1
		},
		function(listReply) {
			if(listReply == null || listReply.length == 0){
				//정보가 없을 시 ul에 담긴 내용 청소
				ulQnA.html("");
				return;
			}
			//댓글이 있으면 li로 만들어서 ul에 담을 것
			strLiTags = "";
			for (var i = 0, len = listReply.length || 0; i < len; i++){
				strLiTags += '<li class="clearfix" data-ppt_for_sale_id = "' + listReply[i].pptForSaleId +'">';
				strLiTags += '	<div>';
				strLiTags += '		<div>';
				strLiTags += '			<strong>' + listReply[i].userId + '</strong>';
				strLiTags += '			<small>' + dateFormatService.getWhenPosted(listReply[i].updateDate) + '</small>';
				strLiTags += '		</div>';
				strLiTags += '		<p>' + listReply[i].content + '</p>';
				strLiTags += '	</div>';
				strLiTags += '</li>';
			}
			ulQnA.html(strLiTags);
		},
		function(errMsg){
			alert("댓글 목록 조회 오류 :" + errMsg);
		}		
	);
}

//replyService 모듈
replyService.getReplyList(
	{orgId:originalQnAId, page:1},
	function(listReply) {
		for (var i = 0, len = listReply.length || 0; i < len; i++){
			console.log(listReply[i]);
		}
	},
	function(errMsg){
		alert("댓글 조회 오류 :" + errMsg);
	}		
);

var modalQnA = $("#modalQnA");
var inputQnAreplyContent = modalQnA.find("input[name='QnAreplyContent']");
var inputQnAreplyer = modalQnA.find("input[name='QnAreplyer']");
var inputQnAreplyDate = modalQnA.find("input[name='QnAreplyDate']");

var btnRegisterQnA = $("#btnRegisterQnA");
var btnModifyQnA = $("#btnModifyQnA");
var btnRemoveQnA = $("#btnRemoveQnA");

//댓글 신규 용도의 모달 창 열기.
$("#btnOpenQnAModalForNew").on("click", function(e) {
	//모달에 들어있는 모든 내용 청소
	modalQnA.find("input").val("");
	//신규 댓글 등록할 때 등록일자는 defualt처리. 따라서 보여 줄 필요가 없어요.
	inputQnAreplyDate.closest("div").hide();
	btnModifyQnA.hide();
	btnRemoveQnA.hide();
	btnRegisterQnA.show();
	
	modalQnA.modal("show");
});

//목록에서 특정 댓글을 클릭하면 해당 댓글의 상세 정보를 Ajax-rest로 읽고 이를 모달창에 보여준다.
//특정 댓글은 동적으로 추가된 것이기에 이벤트 위임 방식("li")을 활용하여야 한다.
ulQnA.on("click", "li", function(e) {
	var clickedLi = $(this);
	replyService.getReply(
		clickedLi.data("ppt_for_sale_id"),	
		function(replyObj) {
			//수정 또는 삭제 시 댓글의 아이디가 필요합니다.
			modalQnA.data("ppt_for_sale_id", replyObj.pptForSaleId);
			inputQnAreplyContent.val(replyObj.content);
			inputQnAreplyer.val(replyObj.userId);
			inputQnAreplyDate.val(dateFormatService.getWhenPosted(replyObj.updateDate));
			
			inputQnAreplyer.attr("readonly", true);
			inputQnAreplyDate.attr("readonly", true);
			
			btnModifyQnA.show();
			btnRemoveQnA.show();
			btnRegisterQnA.hide();
			
			modalQnA.modal("show");
		},
		function(errMsg){
			alert("댓글 조회 오류 :" + errMsg);
		}
	);
});

//모달 창에서 내용을 사용자가 입력한 다음에 등록 버튼을 누르면 댓글로 등록하고 목록을 1쪽부터 다시 보여준다.
btnRegisterQnA.on("click", function(e) {
	var reply = {
		content:inputQnAreplyContent.val()
	};
	
	replyService.addReply(
			originalQnAId,
		reply,
		function(newReplyId) {
			
			modalQnA.find("input").val("");	//들어있는 값 청소
			modalQnA.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showQnAList(1);

		},
		function(errMsg){
			alert("댓글 등록 오류 :" + errMsg);
		}		
	);
});

//댓글 상세 내용이 모달창에 나타났으며 작성자가 그 내용을 수정하고 수정 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnModifyQnA.on("click", function(e) {
	replyService.updateReply(
		{
			pptForSaleId:modalQnA.data("ppt_for_sale_id"),
			content:inputQnAreplyContent.val()
		},	
		function(resultMsg) {
			modalQnA.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showQnAList(1);
		},
		function(errMsg){
			alert("댓글 수정 오류 :" + errMsg);
		}
	);
	
});

//댓글 상세 내용이 모달창에 나타났으며 작성자가 삭제 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnRemoveQnA.on("click", function(e) {
	replyService.removeReply(
		modalQnA.data("ppt_for_sale_id"),
		function(delResult) {
			modalQnA.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showQnAList(1);
		},
		function(errMsg){
			alert("댓글 삭제 오류 :" + errMsg);
		}		
	);
});


var ulReview = $("#ulReview");

function showReviewList(pageNum){
	replyService.getReplyList(
		{
			orgId : originalReviewId,
			page : pageNum || 1
		},
		function(listReply) {
			if(listReply == null || listReply.length == 0){
				//정보가 없을 시 ul에 담긴 내용 청소
				ulReview.html("");
				return;
			}
			//댓글이 있으면 li로 만들어서 ul에 담을 것
			strLiTags = "";
			for (var i = 0, len = listReply.length || 0; i < len; i++){
				strLiTags += '<li class="clearfix" data-ppt_for_sale_id = "' + listReply[i].pptForSaleId +'">';
				strLiTags += '	<div>';
				strLiTags += '		<div>';
				strLiTags += '			<strong>' + listReply[i].userId + '</strong>';
				strLiTags += '			<small>' + dateFormatService.getWhenPosted(listReply[i].updateDate) + '</small>';
				strLiTags += '		</div>';
				strLiTags += '		<p>' + listReply[i].content + '</p>';
				strLiTags += '	</div>';
				strLiTags += '</li>';
			}
			ulReview.html(strLiTags);
		},
		function(errMsg){
			alert("댓글 목록 조회 오류 :" + errMsg);
		}		
	);
}

//replyService 모듈
replyService.getReplyList(
	{orgId:originalReviewId, page:1},
	function(listReply) {
		for (var i = 0, len = listReply.length || 0; i < len; i++){
			console.log(listReply[i]);
		}
	},
	function(errMsg){
		alert("댓글 조회 오류 :" + errMsg);
	}		
);

var modalReview = $("#modalReview");
var inputReviewreplyContent = modalReview.find("input[name='ReviewreplyContent']");
var inputReviewreplyer = modalReview.find("input[name='Reviewreplyer']");
var inputReviewreplyDate = modalReview.find("input[name='ReviewreplyDate']");

var btnRegisterReview = $("#btnRegisterReview");
var btnModifyReview = $("#btnModifyReview");
var btnRemoveReview = $("#btnRemoveReview");

//댓글 신규 용도의 모달 창 열기.
$("#btnOpenReviewModalForNew").on("click", function(e) {
	//모달에 들어있는 모든 내용 청소
	modalReview.find("input").val("");
	//신규 댓글 등록할 때 등록일자는 defualt처리. 따라서 보여 줄 필요가 없어요.
	inputReviewreplyDate.closest("div").hide();
	btnModifyReview.hide();
	btnRemoveReview.hide();
	btnRegisterReview.show();
	
	modalReview.modal("show");
});

//목록에서 특정 댓글을 클릭하면 해당 댓글의 상세 정보를 Ajax-rest로 읽고 이를 모달창에 보여준다.
//특정 댓글은 동적으로 추가된 것이기에 이벤트 위임 방식("li")을 활용하여야 한다.
ulReview.on("click", "li", function(e) {
	var clickedLi = $(this);
	replyService.getReply(
		clickedLi.data("ppt_for_sale_id"),	
		function(replyObj) {
			//수정 또는 삭제 시 댓글의 아이디가 필요합니다.
			modalReview.data("ppt_for_sale_id", replyObj.pptForSaleId);
			inputReviewreplyContent.val(replyObj.content);
			inputReviewreplyer.val(replyObj.userId);
			inputReviewreplyDate.val(dateFormatService.getWhenPosted(replyObj.updateDate));
			
			inputReviewreplyer.attr("readonly", true);
			inputReviewreplyDate.attr("readonly", true);
			
			btnModifyReview.show();
			btnRemoveReview.show();
			btnRegisterReview.hide();
			
			modalReview.modal("show");
		},
		function(errMsg){
			alert("댓글 조회 오류 :" + errMsg);
		}
	);
});

//모달 창에서 내용을 사용자가 입력한 다음에 등록 버튼을 누르면 댓글로 등록하고 목록을 1쪽부터 다시 보여준다.
btnRegisterReview.on("click", function(e) {
	var reply = {
		content:inputReviewreplyContent.val()
	};
	
	replyService.addReply(
		originalReviewId,
		reply,
		function(newReplyId) {
			modalReview.find("input").val("");	//들어있는 값 청소
			modalReview.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showReviewList(1);

		},
		function(errMsg){
			alert("댓글 등록 오류 :" + errMsg);
		}		
	);
});

//댓글 상세 내용이 모달창에 나타났으며 작성자가 그 내용을 수정하고 수정 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnModifyReview.on("click", function(e) {
	replyService.updateReply(
		{
			pptForSaleId:modalReview.data("ppt_for_sale_id"),
			content:inputReviewreplyContent.val()
		},	
		function(resultMsg) {
			modalReview.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showReviewList(1);
		},
		function(errMsg){
			alert("댓글 수정 오류 :" + errMsg);
		}
	);
	
});

//댓글 상세 내용이 모달창에 나타났으며 작성자가 삭제 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnRemoveReview.on("click", function(e) {
	replyService.removeReply(
		modalReview.data("ppt_for_sale_id"),
		function(delResult) {
			modalReview.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showReviewList(1);
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



