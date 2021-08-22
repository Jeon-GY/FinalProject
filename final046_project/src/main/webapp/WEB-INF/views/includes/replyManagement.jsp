<!-- 게시글 상세 화면 (readPost.jsp)에서 이 모든 것이 들어가 있으면 너무 복잡해 집니다.
	따라서 분할 정복으로 복잡도를 관리합니다. 이는 유지 보수성 향상으로 이어집니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Review Start -->
	<div class="card-footer" id="divReview">
		<div class="card-header">상품 후기
			<button name="btnOpenModalForNew" class="btn btn-primary btn-xs pull-right" value="review">후기 등록</button>
		</div>
		<div class="card-body">
			<ul id="ulReview" class="reply">
			</ul>
		</div>
		<!-- Review 페이징 처리 -->
		<div id="replyReviewPaging" class='fa-pull-right'></div>
	</div>
<!-- Review End -->

<!-- Q&A Start -->
	<div class="card-footer" id="divQnA">
		<div class="card-header">상품 문의
			<button name="btnOpenModalForNew" class="btn btn-primary btn-xs pull-right" value="qna">문의 등록</button>
		</div>
		<div class="card-body">
			<ul id="ulQnA" class="reply">
			</ul>
		</div>
		<!-- Q&A 페이징 처리 -->
		<div id="replyQnAPaging" class='fa-pull-right'></div>
	</div>
<!-- Q&A End -->
	
<!-- 입력 모달창 -->
<div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        		<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>	<!-- End of modal-header -->
			<div class="modal-body">
				<div class="form-group">
					<label>작성자</label> 
					<input class="form-control" name='replyer' value=''>
				</div>
				<div class="form-group" hidden="hidden">
					<label>Reply Title</label> 
					<input class="form-control" name='replyTitle' value='' placeholder="Insert Title">
				</div>
				<div class="form-group">
					<label>Reply</label> 
					<input class="form-control" name='replyContent' value='' placeholder="Insert Reply">
				</div>
				<div class="form-group">
					<label>Reply Date</label> 
					<input class="form-control" name='replyDate' value=''>
				</div>
			</div>	
			<!-- End of modal-body -->
			<div class="modal-footer">
				<button id='btnModify' type="button" class="btn btn-warning">Modify</button>
				<button id='btnRemove' type="button" class="btn btn-danger">Remove</button>
				<button id='btnRegister' type="button" class="btn btn-primary">Register</button>
				<button id='btnCloseModal' type="button" class="btn btn-default">Close</button>
			</div>	<!-- End of modal-footer -->
		</div>	<!-- End of modal-content -->
	</div>	<!-- End of modal-dialog -->
</div>
<!-- End of 입력 모달창 -->