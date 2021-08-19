<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" buffer="128kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../includes/header.jsp"%>

<!-- Start All Title Box -->
<div class="all-title-box">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <h2>Wishlist</h2>
            <ul class="breadcrumb">
               <li class="breadcrumb-item"><a href="#">Shop</a></li>
               <li class="breadcrumb-item active">구매</li>
            </ul>
         </div>
      </div>
   </div>
</div>
<!-- End All Title Box -->

<!-- Start Wishlist  -->
<div class="wishlist-box-main">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <div class="table-main table-responsive">
               <table class="table">
                  <thead>
                     <tr>
                        <th>Images</th>
                        <th>Product Name</th>
                        <th>Unit Price</th>
                        <th>Count</th>
                        <th>Remove</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${purchaseList}" var="purchase" varStatus="status">
                        <tr>
                           <td class="thumbnail-img">
                           <img class="img-fluid" name="${purchase.pptForSaleVO.listAttachInStringFormat[0]}" id="${status.index}" src="" alt="" />
                           </td>
                           <td class="name-pr"><a href="/post/readPost?boardId=2&postId=${purchase.postId}" target='_blank'"> ${purchase.pptForSaleVO.title} </a></td>
                           <td class="price-pr">
                              <p>${purchase.pptForSaleVO.price}</p>
                           </td>
                           <td class="quantity-box">${purchase.count}</td>
                           <td class="remove-pr"><a id="remove" href="${purchase.purchaseId}"><i class="fas fa-times"></i>
                           <input id="price${status.index}" type="hidden" value="${purchase.total}">
                           </a></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   <div class="row my-5">
      <div class="col-lg-6 col-sm-6">
         <div class="coupon-box">
            <div class="input-group input-group-sm">
               <input class="form-control" placeholder="쿠폰번호를 입력하세요"
                  aria-label="Coupon code" type="text">
               <div class="input-group-append">
                  <button class="btn btn-theme" type="button">쿠폰 할인 적용</button>
               </div>
            </div>
         </div>
      </div>
      <div class="col-lg-6 col-sm-6">
         <div class="update-box">
            <input value="Update Cart" type="submit">
         </div>
      </div>
   </div>
   <div class="row my-5">
      <div class="col-lg-8 col-sm-12"></div>
      <div class="col-lg-4 col-sm-12">
         <div class="order-box">
            <h3>주문 내역</h3>
            <div class="d-flex">
               <h4>주 문</h4>
               <div class="ml-auto font-weight-bold" id="orderPrice"></div>
            </div>
            <div class="d-flex">
               <h4>할 인</h4>
               <div class="ml-auto font-weight-bold"></div>
            </div>
            <hr class="my-1">
            <div class="d-flex">
               <h4>쿠폰 할인</h4>
               <div class="ml-auto font-weight-bold"></div>
            </div>
            <div class="d-flex">
               <h4>배송비</h4>
               <div class="ml-auto font-weight-bold">무료 배송</div>
            </div>
            <hr>
            <div class="d-flex gr-total">
               <h5>합 계</h5>
               <div class="ml-auto h5" id="total"></div>
            </div>
            <hr>
         </div>
      </div>
      <div class="col-12 d-flex shopping-box">
         <a href="" class="ml-auto btn hvr-hover">구매하기</a>
      </div>
   </div>
</div>
<!-- End Wishlist -->



<script type="text/javascript" src="\resources\js\common.js"></script>
<script type="text/javascript">
var orderPrice = 0;
function setsrc(total) {
   for(var i=0; i<total; i++){
      var imgtag = $("#" + i);
      var fileCallPath = imgtag.attr('name');
      if(fileCallPath == null || fileCallPath.length < 20){
         imgtag.attr('src', '/resources/images/logo.png');
      } else {
         var path = encodeURI(fileCallPath);
         imgtag.attr('src', '/uploadFiles/display?fileName=' + path);
      }
      orderPrice += ($("#price"+i).val())*1;
   }
   $("#orderPrice").html(orderPrice + "원");
   
   $("#total").html(orderPrice + "원");
}

var tot = ${total};
$(document).ready(function() {
   setsrc(tot);
});

$("#remove").on("click", function(e) {
   e.preventDefault();
   var purId = $(this).attr("href");
   cart.deleteItem(
      purId,
      function(retval) {
         alert("상품이 장바구니에서 제외되었습니다.");
         location.reload();
      },
      function(err) {
         alert("장바구니에서 제외하는데 실패하였습니다.");
      }
   );
   
   
});
</script>

<%@include file="../includes/footer.jsp"%>