<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Home</title>
</head>
<body>
	<%@include file="./includes/header.jsp"%>
	
	<c:forEach items="${boardList}" var="board" >
		  <c:if test="${board.boardId eq '5' }">
		  	<a href="/post/managementProduct?boardId=${board.boardId}&sellerId=seller2">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '1'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '2'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '3'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '4'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '6'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
	</c:forEach>
	

<div onclick="kakaoLogin();">
   	<a id="custom-login-btn" href="javascript:void(0)">
		<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="200" />
	</a>
</div>
<div onclick="kakaoLogout();" hidden="hidden">
   	<a href="javascript:void(0)">
       	<span>카카오 로그아웃</span>
   	</a>
</div>
<div id="naverIdLogin">
	<a id="naverIdLogin_loginButton" href="#">
		<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="40">
	</a>
</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init('ccbacba135af2f8f5fff9a09bf3dea9e'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
}

//naver 로그인
window.name='opener';
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "jyvqXeaVOVmV",
		callbackUrl: "https://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "/oauth/sample/callback.html",
		isPopup: true,
		loginButton: {color: "green", type: 3, height: 60}
	}
);
/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
naverLogin.init();

/* (4-1) 임의의 링크를 설정해줄 필요가 있는 경우 */
$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

/* (5) 현재 로그인 상태를 확인 */
window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
			setLoginStatus();
		}
	});
});

/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
function setLoginStatus() {
	var profileImage = naverLogin.user.getProfileImage();
	var nickName = naverLogin.user.getNickName();
	var imageViewer = '';
	if (profileImage) {
		imageViewer += '<br><br><img src="' + profileImage + '" height=50 /> <p>';
	}
	$("#naverIdLogin_loginButton").html(imageViewer + nickName + '님 반갑습니다.</p>');
	$("#gnbLogin").html("Logout");
	$("#gnbLogin").attr("href", "#");
	/* (7) 로그아웃 버튼을 설정하고 동작을 정의합니다. */
	$("#gnbLogin").click(function (e) {
		e.preventDefault();
		naverLogin.logout();
		location.replace('/oauth/sample/javascript_sample.html');
	});
}
</script>
</html>