<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
   contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<style>
body {
  font-family: "Lucida Sans Typewriter", "Lucida Console", Monaco, "Bitstream Vera Sans Mono", monospace;
  margin: 0px;
  padding: 50px;
  background: #e1e1e1;
}
.menu {
  position: relative;
  height: 44px;
  background: #2b2f3a;
  width: auto;
}
.menu ul {
  list-style: none;
  padding: 0;
  text-align:center; 
  margin: 0;
  line-height: 1;
}
.menu > ul {
  position: relative;
  display: block;
  background: #2b2f3a;
  width: 100%;
  z-index: 500;
}
.menu:after, .menu > ul:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
.menu.align-right > ul > li {
  float: right;
}
.menu.align-center ul {
  text-align: center;
}
.menu.align-center ul ul {
  text-align: left;
}
.menu > ul > li {
  display: inline-block;
  position: relative;
  margin: 0;
  padding: 0;
}
.menu > ul > #menu-button {
  display: none;
}
.menu ul li a {
  display: block;
  font-family: Helvetica, sans-serif;
  text-decoration: none;
}
.menu > ul > li > a {
  font-size: 14px;
  font-weight: bold;
  padding: 15px 20px;
  color: #fff;
  text-transform: uppercase;
  -webkit-transition: color 0.25s ease-out;
  -moz-transition: color 0.25s ease-out;
  -ms-transition: color 0.25s ease-out;
  -o-transition: color 0.25s ease-out;
  transition: color 0.25s ease-out;
}
.menu > ul > li.sub > a {
  padding-right: 32px;
}
.menu > ul > li:hover > a {
  color: #ffffff;
}
.menu li.sub::after {
  display: block;
  content: "";
  position: absolute;
  width: 0;
  height: 0;
}
.menu > ul > li.sub::after {
  right: 10px;
  top: 20px;
  border: 5px solid transparent;
  border-top-color: #7a8189;
}
.menu > ul > li:hover::after {
  border-top-color: #ffffff;
}
.menu ul ul {
  position: absolute;
  left: -9999px;
  top: 70px;
  opacity: 0;
  -webkit-transition: opacity .3s ease, top 1s ease;
  -moz-transition: opacity .3s ease, top .25s ease;
  -ms-transition: opacity .3s ease, top .25s ease;
  -o-transition: opacity .3s ease, top .25s ease;
  transition: opacity .3s ease, top .25s ease;
  z-index: 100;
}
.menu ul ul ul {
  top: 37px;
  padding-left: 5px;
}
.menu ul ul li {
  position: relative;
}
.menu > ul > li:hover > ul {
  left: auto;
  top: 44px;
  opacity: 1;
}
.menu.align-right > ul > li:hover > ul {
  left: auto;
  right: 0px;
  opacity: 1;
}
.menu ul ul li:hover > ul {
  left: 170px;
  top: 0;
  opacity: 1;
}
.menu.align-right ul ul li:hover > ul {
  left: auto;
  right: 170px;
  top: 0;
  opacity: 1;
  padding-right: 5px;
}
.menu ul ul li a {
  width: 170px;
  border-bottom: 1px solid #eeeeee;
  padding: 10px 20px;
  font-size: 12px;
  color: #9ea2a5;
  background: #ffffff;
  -webkit-transition: all .35s ease;
  -moz-transition: all .35s ease;
  -ms-transition: all .35s ease;
  -o-transition: all .35s ease;
  transition: all .35s ease;
}
.menu.align-right ul ul li a {
  text-align: right;
}
.menu ul ul li:hover> a {
  background: #f2f2f2;
  color: #8c9195;
}
.menu ul ul li:last-child > a, .menu ul ul li.last > a {
  border-bottom: 0;
}
.menu > ul > li > ul::after {
  content: '';
  border: 6px solid transparent;
  width: 0;
  height: 0;
  border-bottom-color: #ffffff;
  position: absolute;
  top: -12px;
  left: 30px;
}
.menu.align-right > ul > li > ul::after {
  left: auto;
  right: 30px;
}
.menu ul ul li.sub::after {
  border: 4px solid transparent;
  border-left-color: #9ea2a5;
  right: 10px;
  top: 12px;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-transition: -webkit-transform 0.2s ease, right 0.2s ease;
}
.menu.align-right ul ul li.sub::after {
  border-left-color: transparent;
  border-right-color: #9ea2a5;
  right: auto;
  left: 10px;
}
.menu ul ul li.sub:hover::after {
  border-left-color: #ffffff;
  right: -5px;
  -webkit-transform: rotateY(180deg);
  -ms-transform: rotateY(180deg);
  -moz-transform: rotateY(180deg);
  -o-transform: rotateY(180deg);
  transform: rotateY(180deg);
}
.menu.align-right ul ul li.sub:hover::after {
  border-right-color: #ffffff;
  border-left-color: transparent;
  left: -5px;
  -webkit-transform: rotateY(180deg);
  -ms-transform: rotateY(180deg);
  -moz-transform: rotateY(180deg);
  -o-transform: rotateY(180deg);
  transform: rotateY(180deg);
}
</style>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Project Traditional Province Product</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="/resources/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="/resources/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/resources/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/resources/css/custom.css">
   
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!-- Start Main Top -->
    <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
               <div class="custom-select-box">
                        <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
                     <option>\ KRW</option>
                     <option>$ USD</option>
                  </select>
                    </div>
                    <div class="right-phone-box">
                        <p>입점 문의 : <a href="#">+82-10-4030-7967</a></p>
                    </div>
                    <div class="our-link">
                        <ul>
                            <li><a href="#"><i class="fa fa-user s_color"></i> 내 정보</a></li>
                            <li><a href="#"><i class="fas fa-location-arrow"></i> 오시는길</a></li>
                            <li><a href="#"><i class="fas fa-headset"></i> 문의</a></li>
                        </ul>
                    </div>
                </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                   <!-- 로그인 하지 않은 상태 -->
                   <c:if test = "${loginParty == null}">
               <div class="login-box" style="background-color: skyblue; padding-left: 5px;">
                  <form action="/party/regist">
                           <button type="submit" class="btn btn-primary">회원가입</button>
                        </form>
                     
                        <form action="/party/login">
                           <button type="submit" class="btn btn-primary">로그인</button>
                        </form>
                     
                     </div>
               </c:if>
               <!-- 로그인한 상태 -->
                   <c:if test="${loginParty != null}">
                      <div class="login-box" style="background-color: skyblue; padding-left: 10px;">
                          <div class="login_success_area">
                              <span>아이디 : ${loginParty.userId}</span><br>
                              <span>회원 : ${loginParty.userName}</span><br>
                              <span>권한 : ${loginParty.authority}</span><br>
                              <a href="/party/logout">로그아웃</a>
                          </div>
                      </div>
                   </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Top -->

    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                   </button>
                       <a class="navbar-brand" href="/"><img src="/resources/images/logo.png" class="logo" alt=""></a>
                   </div>
                <!-- End Header Navigation -->
                
            <div class="menu">
               <ul>
                  <li>
                     <a href='/'>Home</a>
                  </li>
                  <li class='sub'>
                     <a href='#'>지역 카테고리</a>
                     <ul id="locationCategory">
                     <c:forEach items="${locationList}" var="location">
                        <li class='sub'>
                           <a name="${location.locationId}" >${location.locationName}</a>
                              <ul>
                              </ul>
                        </li>
                     </c:forEach>
                     </ul>
                  <li>
                     <a href='/post/postList?boardId=2'>Best</a>
                  </li>
                  <li>
                     <a href='/post/postList?boardId=3'>Live</a>
                  </li>
                  
                  <c:if test="${loginParty != null}">
                  <li>
                     <a href='/post/postList?boardId=4'>MyPage</a>
                  </li>
                  </c:if>
                  
                      <c:if test="${loginParty.authority eq 'seller'}">
                  <li>
                     <a href='/post/managementProduct?boardId=5'>상품관리</a>
                  </li>
                  </c:if>
                  
                      <c:if test="${loginParty.authority eq 'admin'}">
                  <li class='last'>
                     <a href='/post/postList?boardId=6'>관리자페이지</a>
                  </li>
                  </c:if>
               </ul>
            </div>

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        <li class="side-menu">
                     <a href="#">
                        <i class="fa fa-shopping-bag"></i>
                        <span class="badge">3</span>
                        <p>My Cart</p>
                     </a>
                  </li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
            <!-- Start Side Menu -->
            <div class="side">
                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                <li class="cart-box">
                    <ul class="cart-list">
                        <li>
                            <a href="#" class="photo"><img src="/resources/images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Delica omtantur </a></h6>
                            <p>1x - <span class="price">$80.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="/resources/images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Omnes ocurreret</a></h6>
                            <p>1x - <span class="price">$60.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="/resources/images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Agam facilisis</a></h6>
                            <p>1x - <span class="price">$40.00</span></p>
                        </li>
                        <li class="total">
                            <a href="#" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                            <span class="float-right"><strong>Total</strong>: $180.00</span>
                        </li>
                    </ul>
                </li>
            </div>
            <!-- End Side Menu -->
        </nav>
        <!-- End Navigation -->
    </header>
    
    <form id="frmLocSearch" action="/post/searchingProductList" method="get">
       <input  type="hidden" name="locationId" id="detailLocSearchigId">
    </form>
    
    <!-- End Main Top -->
    
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script type="text/javascript" src="\resources\js\common.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    $("#locationCategory").on("mouseenter", "li", function(e) {
       e.preventDefault();
      var location_id = $(this).children("a").attr('name');
      var locationDetail = $("#locationCategory").find("ul");
      
      getLoc.locationList(
            location_id,
            function(locationList) {
               var lines = '';
               for (var i = 0, len = locationList.length || 0; i < len; i++){
                  lines += '<a name='+ locationList[i].locationId +'>' + locationList[i].locationName + '</a>';
               }
               locationDetail.empty();
               locationDetail.append(lines);
            },
            function(errMsg){
               alert("지역 조회 오류 :" + errMsg);
            }      
      );
   });
    
    var detailLocSearchigId = $("#detailLocSearchigId");
    var frmLocSearch = $("#frmLocSearch");
    $("#locationCategory").find("ul").on("click", "a", function(e) {
       detailLocSearchigId.attr('value', $(this).attr('name'));
       frmLocSearch.submit();
    });
    
    $("#locationCategory").on("click", "li", function(e) {
        detailLocSearchigId.attr('value', $(this).children("a").attr('name'));
        frmLocSearch.submit();
     });
});
</script>