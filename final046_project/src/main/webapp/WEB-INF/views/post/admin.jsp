<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<button id="userMg">가입 유저 관리</button>
<button id="adMg">광고 관리</button>

<div id="partyList">
   <h1>관리자 페이지</h1>
   <table>
      <thead>Customer List</thead>
      <tr>
         <th>user_id</th>
         <th>user_name</th>
         <th>upt_dt</th>
      </tr>
      <c:forEach items="${customerList}" var="customer">
         <tr>
            <td><strong>${customer.userId}</strong></td>
            <td>${customer.userName}</td>
            <td>${customer.updateDate}</td>
            <td><button id="${customer.userId}">휴면계정으로 전환</button></td>
         </tr>
      </c:forEach>
   </table>
</div>
<div id="sellerList">
   <table>
      <thead>Seller List</thead>
      <tr>
         <th>user_id</th>
         <th>user_name</th>
         <th>upt_dt</th>
      </tr>

      <c:forEach items="${sellerList}" var="seller">
         <tr>
            <td><strong>${seller.userId}</strong></td>
            <td>${seller.userName}</td>
            <td>${seller.updateDate}</td>
            <td><button id="${seller.userId}">customer로 전환</button></td>
         </tr>
      </c:forEach>
   </table>
</div>

<form id='frmDisable' action="/party/disable" method="post">
   <input type="hidden" name="userId">
</form>

<form id='frmAddAd' action="/post/addAdver" method="post">
   <input type="hidden" name="postId">
</form>

<form id='frmmake' action="/party/makeCustomer" method="post">
   <input type="hidden" name="sellerId">
</form>

<div id="gwang-go" hidden="ture">
   <h4>광고 관리</h4>
   <%@include file="../includes/listCommon.jsp"%>
</div>

<%@include file="../includes/footer.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function setsrc(total) {
   for(var i=0; i<total; i++){
      var imgtag = $("#" + i);
      var fileCallPath = imgtag.attr('name');
      if(fileCallPath == null || fileCallPath.length < 20){
         imgtag.attr('src', '/resources/images/logo.png');
      } else {
         var path = encodeURI(fileCallPath.substring(1, fileCallPath.length-1));
         imgtag.attr('src', '/uploadFiles/display?fileName=' + path);
      }
   }
}

$(document).ready(function() {
   var total = $("input[name=total]").val();
   setsrc(total);
});

$(".anchor4post").on("click", function(e) {
   e.preventDefault(); // 페이지 이동 막는것
   var postId = $(this).attr("href"); // 클린된 a 태그의 href에 적힌 post_id 값을 가져온다
   $("input[name='postId']").val(postId);
   alert("게시글 " + postId + " 광고 등록");
   $("#frmAddAd").submit();
});

$("#partyList").on("click", "button", function(e) {
   e.preventDefault();
   var userId = $(this).attr("id");
   $("input[name='userId']").val(userId);
   alert("아이디 " + userId + " 휴면 계정 전환");
   $("#frmDisable").submit();
});
$("#sellerList").on("click", "button", function(e) {
   e.preventDefault();
   var userId = $(this).attr("id");
   $("input[name='sellerId']").val(userId);
   alert("아이디 " + userId + " customer 전환");
   $("#frmmake").submit();
});

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

$("#userMg").on("click", function() {
   $("#partyList").attr("hidden", false);
   $("#sellerList").attr("hidden", false);
   $("#gwang-go").attr("hidden", true);
   
});
$("#adMg").on("click", function() {
   $("#partyList").attr("hidden", true);
   $("#sellerList").attr("hidden", true);
   $("#gwang-go").attr("hidden", false);
});
</script>