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
			<h1>Custom Login Page</h1>
			<h2>${error}</h2>
			<h2>${logout}</h2>
			<form method="post" action="/login" role="form">
				<fieldset>
					<div class='form-group'>
						<input type="text" name='username' class='form-control' autofocus>
					</div>
					<div class='form-group'>
						<input type="password" name='password' class='form-control'>
					</div>
					<div class='checkbox'>
						<label><input type="checkbox" name='remember-me'>자동로그인</label>
					</div>
				</fieldset>
				<input type="submit">
				<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
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

</script>
