<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!-- Start Side Menu -->
<div class="side">
	<a href="#" class="close-side"><i class="fa fa-times"></i></a>
	<li class="cart-box">
		<ul class="cart-list">
		<!-- 포스트 이미지, 포스트  -->
			<li><a href="#" class="photo"><img src="/resources/images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
				<h6>
					<a href="#">Delica omtantur </a>
				</h6>
				<p> 1x - <span class="price">$80.00</span>
				</p></li>
			
			<li><a href="#" class="photo"><img src="/resources/images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
				<h6>
					<a href="#">Omnes ocurreret</a>
				</h6>
				<p>
					1x - <span class="price">$60.00</span>
				</p></li>
			
			<li><a href="#" class="photo"><img src="/resources/images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
				<h6>
					<a href="#">Agam facilisis</a>
				</h6>
				<p>
					1x - <span class="price">$40.00</span>
				</p></li>
			
			<li class="total">
			<a href="/post/purchase" class="btn btn-default hvr-hover btn-cart">장바구니 목록 구매</a>
			<span class="float-right"><strong>Total</strong>: ${purchase.total}</span></li>
		</ul>
	</li>
</div>
<!-- End Side Menu -->