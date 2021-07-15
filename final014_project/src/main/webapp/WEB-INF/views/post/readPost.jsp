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
				<label>지역</label> <input name="location" value="${productList[0].locationId}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>상품명</label> <input name="productName" value="${productList[0].productName}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>중량</label> <input id="productAmount" name="productAmount" value="${productList[0].productAmount}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>갯수</label> <input id="productCount" name="productCount" value="${productList[0].productCount}" class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>가격</label> <input id="productPrice" name="productPrice" value="${productList[0].productPrice}" class="form-control" readonly>
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
				<div class="form-group">
					<label>상품정보</label>
					<textarea id="txaContent" name="content" class="form-control"
					 rows="3" readonly>${postInfoList[0].postInfoContent}</textarea>
				</div>
				
				<div id="divProductDetail">
					<!-- "../postDetail/productDetailCommon.jsp" -->
					<div class="form-group">
						<label>상세정보</label>
						<textarea id="txaContent" name="content" class="form-control"
							rows="3" readonly>${postInfoList[0].postInfoContent}</textarea>
					</div>
				</div>
			</div>

			<%@include file="../includes/replyManagement.jsp"%>
		</body>
	</div>
</div>

<script type="text/javascript" src="\resources\js\post\reply.js"></script>

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
var ulReply = $("#ulReply");
var originalId = "${postInfoList[0].postInfoId}";

var modalReply = $("#modalReply");
var inputReplyContent = modalReply.find("input[name='replyContent']");
var inputReplyer = modalReply.find("input[name='replyer']");
var inputReplyDate = modalReply.find("input[name='replyDate']");

var btnRegisterReply = $("#btnRegisterReply");
var btnModifyReply = $("#btnModifyReply");
var btnRemoveReply = $("#btnRemoveReply");

$(document).ready(function(){
	showReplyList(1);
});

function showReplyList(pageNum){
	replyService.getReplyList(
		{
			orgId : originalId,
			page : pageNum || 1
		},
		function(listReply) {
			if(listReply == null || listReply.length == 0){
				//정보가 없을 시 ul에 담긴 내용 청소
				ulReply.html("");
				return;
			}
			//댓글이 있으면 li로 만들어서 ul에 담을 것
			strLiTags = "";
			for (var i = 0, len = listReply.length || 0; i < len; i++){
				strLiTags += '<li class="clearfix" data-reply_id = "' + listReply[i].replyId +'">';
				strLiTags += '	<div>';
				strLiTags += '		<div>';
				strLiTags += '			<strong>' + listReply[i].userId + '</strong>';
				strLiTags += '			<small>' + dateFormatService.getWhenPosted(listReply[i].updateDate) + '</small>';
				strLiTags += '		</div>';
				strLiTags += '		<p>' + listReply[i].content + '</p>';
				strLiTags += '	</div>';
				strLiTags += '</li>';
			}
			ulReply.html(strLiTags);
		},
		function(errMsg){
			alert("댓글 목록 조회 오류 :" + errMsg);
		}		
	);
}

//replyService 모듈
replyService.getReplyList(
	{orgId:originalId, page:1},
	function(listReply) {
		for (var i = 0, len = listReply.length || 0; i < len; i++){
			console.log(listReply[i]);
		}
	},
	function(errMsg){
		alert("댓글 조회 오류 :" + errMsg);
	}		
);

//댓글 신규 용도의 모달 창 열기.
$("#btnOpenReplyModalForNew").on("click", function(e) {
	//모달에 들어있는 모든 내용 청소
	modalReply.find("input").val("");
	//신규 댓글 등록할 때 등록일자는 defualt처리. 따라서 보여 줄 필요가 없어요.
	inputReplyDate.closest("div").hide();
	btnModifyReply.hide();
	btnRemoveReply.hide();
	btnRegisterReply.show();
	
	modalReply.modal("show");
});

//목록에서 특정 댓글을 클릭하면 해당 댓글의 상세 정보를 Ajax-rest로 읽고 이를 모달창에 보여준다.
//특정 댓글은 동적으로 추가된 것이기에 이벤트 위임 방식("li")을 활용하여야 한다.
ulReply.on("click", "li", function(e) {
	var clickedLi = $(this);
	replyService.getReply(
		clickedLi.data("reply_Id"),
		function(replyObj) {
			//수정 또는 삭제 시 댓글의 아이디가 필요합니다.
			modalReply.data("reply_id", replyObj.replyId);
			inputReplyContent.val(replyObj.content);
			inputReplyer.val(replyObj.userId);
			inputReplyDate.val(dateFormatService.getWhenPosted(replyObj.updateDate));
			
			inputReplyer.attr("readonly", true);
			inputReplyDate.attr("readonly", true);
			
			btnModifyReply.show();
			btnRemoveReply.show();
			btnRegisterReply.hide();
			
			modalReply.modal("show");
		},
		function(errMsg){
			alert("댓글 조회 오류 :" + errMsg);
		}
	);
});

//모달 창에서 내용을 사용자가 입력한 다음에 등록 버튼을 누르면 댓글로 등록하고 목록을 1쪽부터 다시 보여준다.
btnRegisterReply.on("click", function(e) {
	var reply = {
		content:inputReplyContent.val()
	};
	
	replyService.addReply(
		originalId,
		reply,
		function(newReplyId) {
			modalReply.find("input").val("");	//들어있는 값 청소
			modalReply.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showReplyList(1);

		},
		function(errMsg){
			alert("댓글 등록 오류 :" + errMsg);
		}		
	);
});

//댓글 상세 내용이 모달창에 나타났으며 작성자가 그 내용을 수정하고 수정 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnModifyReply.on("click", function(e) {
	replyService.updateReply(
		{
			id:modalReply.data("reply_id"),
			content:inputReplyContent.val()
		},	
		function(resultMsg) {
			modalReply.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showReplyList(1);
		},
		function(errMsg){
			alert("댓글 수정 오류 :" + errMsg);
		}
	);
	
});

//댓글 상세 내용이 모달창에 나타났으며 작성자가 삭제 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnRemoveReply.on("click", function(e) {
	replyService.removeReply(
		modalReply.data("reply_id"),
		function(delResult) {
			modalReply.modal("hide");
			//목록을 1쪽 부터 다시 보여준다.
			showReplyList(1);
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



