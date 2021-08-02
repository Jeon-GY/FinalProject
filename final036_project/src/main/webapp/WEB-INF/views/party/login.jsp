<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<style>
/* 로그인 실패시 경고글 */
.login_warn{
    margin-top: 30px;
    text-align: center;
    color : red;
}
</style>

	<!-- /.login-logo -->
	<div class="card">
		<div class="card-body login-card-body">
			<p class="login-box-msg">Sign in to start your session</p>
			<form id="frmLogin"method="post">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" id="userId" name="userId" placeholder="ID">
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="pw" name="userPassword" placeholder="Confirm Password">
				</div>
				
				<div class="row">
					<div class="col-8">
						<div class="icheck-primary">
							<input type="checkbox" id="remember"> <label
								for="remember"> Remember Me </label>
						</div>
					</div>
					
					<div class="col-7">
			 			<c:if test = "${result == 0 }">
			                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
			            </c:if>					
		            </div>
					<div class="col-4">
						<input type="button" id="btnLogin" class="btn btn-primary btn-block" value="로그인">
					</div>
				</div>
			</form>
			<p class="mb-1">
				<a href="#">아이디 / 비밀번호 찾기</a>
			</p>
			<p class="mb-0">
				<a href="http://localhost:8080/party/regist" class="text-center">회원 가입</a>
			</p>
		</div>
		<!-- /.login-card-body -->
	</div>
	<!-- /.login-box-body -->

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
var msg = "${msg}";
if (msg === "REGISTERED") {
	alert("회원가입이 완료되었습니다. 로그인해주세요~");
} else if (msg == "FAILURE") {
	alert("아이디와 비밀번호를 확인해주세요.");
}
$(function () {
	$('input').iCheck({
		checkboxClass: 'icheckbox_square-blue',
		radioClass: 'iradio_square-blue',
		increaseArea: '20%' // optional
	});
});

/* 로그인 버튼 클릭 메서드 */
$("#btnLogin").click(function(){
	
	/* 로그인 메서드 서버 요청 */
    $("#frmLogin").attr("action", "/party/login");
    $("#frmLogin").submit();

    
});
</script>
