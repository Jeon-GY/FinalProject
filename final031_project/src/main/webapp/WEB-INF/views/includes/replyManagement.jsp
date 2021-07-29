<!-- 게시글 상세 화면 (readPost.jsp)에서 이 모든 것이 들어가 있으면 너무 복잡해 집니다.
	따라서 분할 정복으로 복잡도를 관리합니다. 이는 유지 보수성 향상으로 이어집니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<div class="card-footer">
			<div class="card-header">
			상품 문의
			<button id="btnOpenQnAModalForNew" class="btn btn-primary btn-xs pull-right">문의 등록</button>
			</div>
			<div class="card-body">
				<ul id="ulQnA">
				</ul>
			</div>
		</div>
		<div class="card-footer">
			<div class="card-header">
			상품 후기
			<button id="btnOpenReviewModalForNew" class="btn btn-primary btn-xs pull-right">후기 등록</button>
			</div>
			<div class="card-body">
				<ul id="ulReview">
				</ul>
			</div>
		</div>
		
<!-- 문의 입력 모달창 -->
<div id="modalQnA" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        		<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>	<!-- End of modal-header -->
			<div class="modal-body">
				<div class="form-group">
					<label>작성자</label> 
					<input class="form-control" name='QnAreplyer' value=''>
				</div>
				<div class="form-group">
					<label>Reply Date</label> 
					<input class="form-control" name='QnAreplyDate' value=''>
				</div>
				<div class="form-group">
					<label>Reply</label> 
					<input class="form-control" name='QnAreplyContent' value='New Reply!!!!'>
				</div>
				<input id="QnAreplyerId" type="hidden">
			</div>	
			<!-- End of modal-body -->
			<div class="modal-footer">
				<button id='btnModifyQnA' type="button" class="btn btn-warning">Modify</button>
				<button id='btnRemoveQnA' type="button" class="btn btn-danger">Remove</button>
				<button id='btnRegisterQnA' type="button" class="btn btn-primary" value="11111">Register</button>
				<button id='btnCloseModalQnA' type="button" class="btn btn-default">Close</button>
			</div>	<!-- End of modal-footer -->
		</div>	<!-- End of modal-content -->
	</div>	<!-- End of modal-dialog -->
</div>
<!-- End of 댓글 입력 모달창 -->

<!-- 후기 입력 모달창 -->
<div id="modalReview" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        		<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>	<!-- End of modal-header -->
			<div class="modal-body">
				<div class="form-group">
					<label>작성자</label> 
					<input class="form-control" name='Reviewreplyer' value=''>
				</div>
				<div class="form-group">
					<label>Reply Date</label> 
					<input class="form-control" name='ReviewreplyDate' value=''>
				</div>
				<div class="form-group">
					<label>Reply</label> 
					<input class="form-control" name='ReviewreplyContent' value='New Reply!!!!'>
				</div>
				<input id="ReviewreplyerId" type="hidden">
			</div>	
			<!-- End of modal-body -->
			<div class="modal-footer">
				<button id='btnModifyReview' type="button" class="btn btn-warning">Modify</button>
				<button id='btnRemoveReview' type="button" class="btn btn-danger">Remove</button>
				<button id='btnRegisterReview' type="button" class="btn btn-primary" value="22222">Register</button>
				<button id='btnCloseModalReview' type="button" class="btn btn-default">Close</button>
			</div>	<!-- End of modal-footer -->
		</div>	<!-- End of modal-content -->
	</div>	<!-- End of modal-dialog -->
</div>
<!-- End of 댓글 입력 모달창 -->
			








