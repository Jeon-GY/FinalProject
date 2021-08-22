<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>

<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Checkout</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Checkout</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>Billing address</h3>
                        </div>
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="username">이름 *</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="username" placeholder="" required>
                                    <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="email">이메일 *</label>
                                <input type="email" class="form-control" id="email" placeholder="">
                                <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                            </div>
                            <div class="mb-3">
                                <label for="address">주소 *</label>
                                <input type="text" class="form-control" id="address" placeholder="" required>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            <div class="mb-3">
                                <label for="address2">주소 2 </label>
                                <input type="text" class="form-control" id="address2" placeholder=""> </div>
                            <div class="row">
                                <div class="col-md-5 mb-3">
                                    <label for="country">Country *</label>
                                    <select class="wide w-100" id="country">
									<option value="Choose..." data-display="Select">Choose...</option>
									<option value="United States">United States</option>
								</select>
                                    <div class="invalid-feedback"> Please select a valid country. </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="state">State *</label>
                                    <select class="wide w-100" id="state">
									<option data-display="Select">Choose...</option>
									<option>California</option>
								</select>
                                    <div class="invalid-feedback"> Please provide a valid state. </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="zip">Zip *</label>
                                    <input type="text" class="form-control" id="zip" placeholder="" required>
                                    <div class="invalid-feedback"> Zip code required. </div>
                                </div>
                            </div>
                            <hr class="mb-4">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="same-address">
                                <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="save-info">
                                <label class="custom-control-label" for="save-info">Save this information for next time</label>
                            </div>
                            <hr class="mb-4">
                            <div class="title"> <span>Payment</span> </div>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                                    <label class="custom-control-label" for="credit">Credit card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                                    <label class="custom-control-label" for="debit">Debit card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                                    <label class="custom-control-label" for="paypal">Paypal</label>
                                </div>
                            </div>
                            <hr class="mb-1"> </form>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>Shipping Method</h3>
                                </div>
                                <div class="mb-4">
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio">
                                        <label class="custom-control-label" for="shippingOption1">Standard Delivery</label> <span class="float-right font-weight-bold">FREE</span> </div>
                                    <div class="ml-4 mb-2 small">(3-7 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption2">Express Delivery</label> <span class="float-right font-weight-bold">$10.00</span> </div>
                                    <div class="ml-4 mb-2 small">(2-4 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption3">Next Business day</label> <span class="float-right font-weight-bold">$20.00</span> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3>Shopping cart</h3>
                                </div>
                                <table class="table">
                                <thead>
				                    <tr>
				                       <th>Product Name</th>
				                       <th>Unit Price</th>
				                       <th>Count</th>
				                    </tr>
				                 </thead>
				                 <tbody>
				                     <c:forEach items="${purchaseList}" var="purchase" varStatus="status">
				                        <tr>
				                           <td class="name-pr"><p> ${purchase.pptForSaleVO.title} </p></td>
				                           <input type="hidden" id="pdcName" value="${purchase.pptForSaleVO.title}">
				                           <td class="price-pr">
				                              <p>${purchase.pptForSaleVO.price}</p>
				                           </td>
				                           <td class="quantity-box">${purchase.count}</td>
				                           <input name="price" id="price${status.index}" type="hidden" value="${purchase.total}">
				                        </tr>
				                     </c:forEach>
			                     </tbody>
			                     </table>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
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
                        </div>
                        <div class="col-12 d-flex shopping-box"> <button onclick="requestPay()">결제하기</button> </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->
<%@include file="../includes/footer.jsp"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

var orderPrice = 0;
var pdcName = $("#pdcName").val();
var IMP = window.IMP; // 생략 가능
var email = $("#username").val
IMP.init('imp88641272'); // 예: imp00000000
function requestPay() {
	for(var i=0; i<total; i++){
		orderPrice += ($("#price"+i).val())*1;
	}
    // IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : pdcName , //결제창에서 보여질 이름
	    amount : orderPrice, //실제 결제되는 가격
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울 강남구 도곡동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}

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
</script>