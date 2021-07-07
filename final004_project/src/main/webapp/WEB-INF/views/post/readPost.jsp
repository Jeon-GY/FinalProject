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
      	<%@include file="../product/product.jsp"%>
        <button data-oper='buy' class="btn btn-primary">즉시 구매</button>
        <button data-oper='addcart' class="btn btn-primary">장바구니 담기</button>
      </div>  
      
      	<%@include file="./postInfo.jsp"%>
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

