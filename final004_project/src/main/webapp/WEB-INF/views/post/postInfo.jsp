<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
<div>
    <button onclick="fnMove('ProductInfo')" data-oper='productInfo' class="btn btn-primary">상품 설명</button>
    <button onclick="fnMove('ProductDetail')" data-oper='productDetail' class="btn btn-primary">상세 정보</button>
    <button onclick="fnMove('QnA')" data-oper='QnA' class="btn btn-primary">상품 문의</button>
    <button onclick="fnMove('Review')" data-oper='review' class="btn btn-primary">상품 후기</button>
</div>

<div id="divProductInfo">
	<%@include file="../postDetail/productDetailCommon.jsp"%>
</div>

<div id="divProductDetail">
	<%@include file="../postDetail/productDetailCommon.jsp"%>
</div>

<div id="divQnA">
	<%@include file="../product/product.jsp"%>
</div>

<div id="divReview">
	<%@include file="../product/product.jsp"%>
</div>
</body>
<script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>






