<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
   <div class="card shadow mb-4">
      <div class="card-body">

         <button data-oper='category' class="btn btn-secondary">카테고리</button>
         <button data-oper='best' class="btn btn-secondary">베스트</button>
         <button data-oper='live' class="btn btn-secondary">라이브쇼</button>
         <button data-oper='search' class="btn btn-secondary">검색창</button>
         <button data-oper='cart' class="btn btn-secondary">장바구니</button>
         
      </div>
      
         <button data-oper='buy' class="btn btn-secondary">즉시 구매</button>
         <button data-oper='addcart' class="btn btn-secondary">장바구니 담기</button>
         
   </div>
   
</div>
<!-- /.container-fluid -->

<!-- End of 댓글 입력 모달창 -->

<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
function appendUploadUl(attachVOInStr) {
   
}

$(document).ready(function(){
   adjustCRUDAtAttach('조회');
   
   <c:forEach var="attachVOInStr" items="${post.attachListInGson}">
      appendUploadUl('<c:out value="${attachVOInStr}" />');
   </c:forEach>
   
   showUploadedFile(${post.attachList});
   
   $("button[data-oper='modify']").on("click", function() {
      $("#frmOper").submit();
   });

   $("button[data-oper='list']").on("click", function() {
      $("#frmOper").find("#postId").remove();
      $("#frmOper").attr("action", "/post/listBySearch").submit();
   });
});
</script>