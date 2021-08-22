<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<script>
var loginUserId = null;
var csrfHN = null;
var csrfTV = null;
<sec:authorize access="isAuthenticated()">
	csrfHN = "${_csrf.headerName}";
	csrfTV = "${_csrf.token}";
	$(document).ajaxSend(function(e, xhr) {
	   xhr.setRequestHeader(csrfHN, csrfTV);
	});
	loginUserId = '<sec:authentication property="principal.username"/>';
</sec:authorize>
</script>
<style>
.goods-view-tab.fixed {
	position: fixed;
	left: 0;
	top: 55px;
	width: 100%;
	min-width: 1010px;
	padding-right: 40px;
	z-index: 299;
	box-sizing: border-box;
}

.goods-view-infomation-tab-group {
	display: flex;
	flex-direction: row;
	width: 1010px;
	margin: 0 auto;
}

.goods-view-infomation-tab-anchor {
	flex: 1;
	position: relative;
	top: 1px;
	height: 60px;
	line-height: 59px;
	text-align: center;
	display: block;
	color: #666;
	font-size: 16px;
	font-weight: 700;
	letter-spacing: -.3px;
	font-family: noto sans;
	background-color: #fafafa;
	border: 1px solid #eee;
	border-left: none;
}

#purchaseBtn {
	border-radius: 5px;
}

#purchaseBtn2 {
	border-radius: 5px;
	margin-right: 5px;
}

#p_group button {
	border: 2px solid #b0b435;
	background-color: #b0b435;
	color: white;
	width: 80px;
	height: 30px;
	margin-top: 4px;
}

#p_group button:hover {
	color: #b0b435;
	background-color: white;
}

button {
	-webkit-appearance: button;
}

.inp {
	font-family: noto sans;
	float: left;
	width: 30px;
	height: 28px;
	border: 0;
	background-color: #fff;
	font-size: 13px;
	color: #000;
	line-height: 18px;
	text-align: center;
}

.down {
	background: #fff url(/resources/images/buttonIcon/ico_minus.svg)
		no-repeat 50% 50%;
	background-size: 30px 30px
}

.down.on {
	background-image: url(/resources/images/buttonIcon/ico_minus_on.svg)
}

.up {
	float: right;
	background: #fff url(/resources/images/buttonIcon/ico_plus.svg)
		no-repeat 50% 50%;
	background-size: 30px 30px
}

.up.on {
	background-image: url(/resources/images/buttonIcon/ico_plus_on.svg)
}

.butn {
	float: left;
	overflow: hidden;
	width: 28px;
	height: 28px;
	border: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

.form_add {
	border-color: black;
	width: 90px;
	height: 31px;
	border: 1px solid #dddfe1;
	margin-bottom: 4px;
}
</style>
<!-- Start Shop Detail  -->
<div class="shop-detail-box-main">
	<div class="container">
		<div class="row">
			<div class="col-xl-5 col-lg-5 col-md-6">
				<div id="carousel-example-1"
					class="single-product-slider carousel slide" data-ride="carousel">
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block w-100" id="imgHere" name="${pptForSaleList[0].listAttachInStringFormat[0]}" alt="First slide">
						</div>
						<!-- 
						<div class="carousel-item">
							<img class="d-block w-100" src="/resources/images/big-img-02.jpg" alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="/resources/images/big-img-03.jpg" alt="Third slide">
						</div>
						 -->
					</div>
				</div>
			</div>
			<div class="col-xl-7 col-lg-7 col-md-6">
				<div class="single-product-details">
					<h2>${pptForSaleList[0].title}</h2>
					<h5>
						<del>${pptForSaleList[0].price  * 1.2}</del>&nbsp;${pptForSaleList[0].price} 원
					</h5>
					<p class="available-stock">
						<span>별점 : ${post.rateScore} / 판매량 : ${post.sellCount} sold</span><br>
						<label>등록일 : </label>
						<fmt:formatDate pattern="yyyy-MM-dd"
							value="${post.registrationDate}" />
					<p>
					<h4>Short Description:</h4>
					<p>${pptForSaleList[0].content}</p>
					<hr>
					<p>
						<strong>중량</strong> : ${pptForSaleList[0].weight}
					<p>
					<hr>
					<p>
						<strong>지역</strong> : ${pptForSaleList[0].bigLocName}
						${pptForSaleList[0].locName}(${pptForSaleList[0].locationId})
					<p>
					<hr>

					<div class="form-group quantity-box">
						<!-- 수량감소증가 버튼 -->
						<label class="control-label"><strong>수량</strong></label>
						<div class="form_add">
							<button type="button" name="minus" class="butn down on">수량내리기</button>
							<input type="text" name="prdcAmount" class="inp" value="0">
							<button type="button" name="plus" class="butn up on">수량올리기</button>
						</div>
						<div id="p_group">
							<button data-oper='buy' id="purchaseBtn">즉시 구매</button>
							<button data-oper='addCart' id="purchaseBtn2">장바구니</button>
						</div>
					</div>
					<hr>

				</div>
			</div>
			<div>
				<div class="goods-view-tab">
					<ul class="goods-view-infomation-tab-group">
						<li onclick="fnMove('ProductInfo')" data-oper='productInfo' class="goods-view-infomation-tab-anchor __active">상품 설명</li>
						<li onclick="fnMove('ProductDetail')" data-oper='productDetail' class="goods-view-infomation-tab-anchor __active">상세 정보</li>
						<li onclick="fnMove('QnA')" data-oper='QnA' class="goods-view-infomation-tab-anchor __active">상품 문의</li>
						<li onclick="fnMove('Review')" data-oper='review' class="goods-view-infomation-tab-anchor __active">상품 후기</li>
					</ul>
				</div>

				<div id="divProductInfo">
					<!-- "../postDetail/productDetailCommon.jsp" -->
					<div id="divProductDetail">
						<!-- "../postDetail/productDetailCommon.jsp" -->
						<div class="form-group">
							<label>상세정보</label>
							<textarea id="txaContent" name="content" class="form-control" rows="3" readonly>${pptForSaleList[0].content}</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- "../post/postInfo.jsp" -->
<%@include file="../includes/replyManagement.jsp"%>
<!-- End of Main Content -->

<sec:authorize access="isAuthenticated()">
	<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
</sec:authorize>

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript" src="\resources\js\post\reply.js"></script>
<script type="text/javascript" src="\resources\js\util\dateFormat.js"></script>

<script type="text/javascript">
function setsrc() {
	var imgtag = $("#imgHere");
	var fileCallPath = imgtag.attr('name');
	if(fileCallPath == null || fileCallPath.length < 20){
		imgtag.attr('src', '/resources/images/logo.png');
	} else {
		var path = encodeURI(fileCallPath);
		imgtag.attr('src', '/uploadFiles/display?fileName=' + path);
	}
}

$(document).ready(function(){
	setsrc();
	showReplyList(1, 1);
});

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
// 구매 및 장바구니 담기 갯수
var count = 0;
/* ######################## Review & QnA ######################## */
// Review & QnA 출력
function showReplyList(reviewPageNum, qnaPageNum) {
	replyService.getReplyList({
		originalId : originalId,
		reviewPage : reviewPageNum || 1,
		qnaPage : qnaPageNum || 1
	}, function(criAndReplyList) {
		var reviewCriteria = criAndReplyList.a;
		var qnaCriteria = criAndReplyList.b;
		var reviewList = criAndReplyList.c;
		var qnaList = criAndReplyList.d;

		if (reviewList == null || reviewList.length == 0) {
			ulReview.html("");
		}
		if (qnaList == null || qnaList.length == 0) {
			ulQnA.html("");
		}

		ulReview.html(printReplyByRecursion(reviewList, false));
		ulQnA.html(printReplyByRecursion(qnaList, false));
		replyReviewPaging.html(reviewCriteria.pagingDiv);
		replyQnAPaging.html(qnaCriteria.pagingDiv);
	}, function(errMsg) {
		console.log(errMsg);
		alert("댓글 목록 조회 오류 :" + errMsg);
	});
}
function printReplyByRecursion(listReply, needUl) {
	if (needUl)
		strLiTags = "<ul>";
	else
		strLiTags = "";

	for (var i = 0, len = listReply.length || 0; i < len; i++) {
		strLiTags += '<li class="clearfix" data-ppt_for_sale_id="' + listReply[i].pptForSaleId +'">';
		strLiTags += '   <div>';
		strLiTags += '      <div>';
		if (!needUl)
			strLiTags += '         <strong>' + listReply[i].userId
					+ '</strong>';
		if (needUl)
			strLiTags += '         ▶<strong>' + listReply[i].userId
					+ '</strong>';
		strLiTags += '         <small>'
				+ dateFormatService.getWhenPosted(listReply[i].updateDate)
				+ '</small>';
		if (!needUl && loginUserId != "")
			strLiTags += '<button class="btn btn-primary btn-xs pull-right" value="' + listReply[i].pptForSaleId +'">답글달기</button>';
		strLiTags += '      </div>';
		strLiTags += '      <p>' + listReply[i].content + '</p>';
		strLiTags += '   </div>';
		if (listReply[i].pptForSaleVOList != null) { // 각각의 댓글에 대댓글이 달렸는지 체크 후 달렸다면 출력하는 함수를 실행
			strLiTags += printReplyByRecursion(
					listReply[i].pptForSaleVOList, true);
		}
		strLiTags += '</li>';
	}
	if (needUl)
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

	if (loginUserId != null)
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
	replyService.getReply(clickedLi.data("ppt_for_sale_id"),
		function(replyObj) {
		//수정 또는 삭제 시 댓글의 아이디가 필요합니다.
		modal.data("ppt_for_sale_id", replyObj.pptForSaleId);
		inputReplyer.val(replyObj.userId);
		inputReplyTitle.val(replyObj.title);
		inputReplyContent.val(replyObj.content);
		inputReplyDate.val(dateFormatService.getWhenPosted(replyObj.updateDate));

		inputReplyer.attr("readonly", true);
		inputReplyDate.attr("readonly", true);

		if (replyObj.userId.indexOf(loginUserId) == 0 && loginUserId != "") {
			btnModify.show();
			btnRemove.show();
			btnRegister.hide();
		} else {
			btnModify.hide();
			btnRemove.hide();
			btnRegister.hide();
		}
		modal.modal("show");
	}, function(errMsg) {
		alert("댓글 조회 오류 :" + errMsg);
	});
});
//모달 창에서 내용을 사용자가 입력한 다음에 등록 버튼을 누르면 댓글로 등록하고 목록을 1쪽부터 다시 보여준다.
btnRegister.on("click", function(e) {
	var reply = {
		content : inputReplyContent.val(),
		price : $(this).val()
	};
	replyService.addReply(
		modal.data("original_id"),
		reply,
		function(newReplyId) {
			modal.find("input").val(""); //들어있는 값 청소
			modal.modal("hide");

			showReplyList(1, 1);
		}, 
		function(errMsg) {
			alert("댓글 등록 오류 :" + errMsg);
	});
});
//댓글 상세 내용이 모달창에 나타났으며 작성자가 그 내용을 수정하고 수정 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnModify.on("click", function(e) {
	replyService.updateReply({
		pptForSaleId : modal.data("ppt_for_sale_id"),
		content : inputReplyContent.val()
	}, function(resultMsg) {
		modal.modal("hide");
		//목록을 1쪽 부터 다시 보여준다.
		showReplyList(1, 1);
	}, function(errMsg) {
		alert("댓글 수정 오류 :" + errMsg);
	});

});
//댓글 상세 내용이 모달창에 나타났으며 작성자가 삭제 버튼을 누르면 DB에 내용을 반영하고
//모달창을 닫고 목록으로 돌아온다.
btnRemove.on("click", function(e) {
	replyService.removeReply(modal.data("ppt_for_sale_id"), function(
			delResult) {
		modal.modal("hide");
		//목록을 1쪽 부터 다시 보여준다.
		showReplyList(1, 1);
	}, function(errMsg) {
		alert("댓글 삭제 오류 :" + errMsg);
	});
});

$(".form_add").on("click", "button", function() {
	var thisButton = $(this).attr("name");
	var num = $("input[name=prdcAmount]").val();
	if (thisButton.indexOf("minus") == 0 && count > 0) {
		count -= 1;
		$("input[name=prdcAmount]").val(count);
	} else if(thisButton.indexOf("plus") == 0 && count < 10) {
		count += 1;
		$("input[name=prdcAmount]").val(count);
	}
});

// 장바구니 버튼
$("button[data-oper='addCart']").on("click", function() {
	if (count == 0) {
		alert("구매 수량을 정해주세요");
		return;
	}

	if(loginUserId == null || loginUserId == ""){
		alert("로그인이 필요합니다.");
		return;
	}
	
	var dataPack = {
		"count" : count,
		"originalId" : originalId
	};
	cart.add(
		dataPack,
		function(retVal) {
			alert("장바구니에 담았습니다.");
		}, function(request, status, error) {
			alert("장바구니 담기 실패.");
		});
});

// 구매 버튼
$("button[data-oper='buy']").on("click", function() {
	if (count == 0) {
		alert("구매 수량을 정해주세요");
		return;
	}
	
	if(loginUserId == null || loginUserId == ""){
		alert("로그인이 필요합니다.");
		return;
	}

});

function fnMove(seq) {
	var offset = $("#div" + seq).offset();
	$('html, body').animate({
		scrollTop : offset.top
	}, 5);
}
</script>