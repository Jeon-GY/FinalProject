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

a {
    color: #333;
    text-decoration: none;
}

input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}

.login_tistory{
	position: relative;
	width: 320px;
	margin: 0 auto;
}
.screen_out {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	line-height: 0;
	text-indent: -9999px;    
}
body, button, input, select, td, textarea, th {
    font-size: 13px;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
}  
.login_tistory .box_login {
    margin: 35px 0 0;
    border: 1px solid #ddd;
    border-radius: 3px;
    background-color: #fff;
    box-sizing: border-box;
}

.login_tistory .inp_text {
    position: relative;
    width: 100%;
    margin: 0;
    padding: 18px 19px 19px;
    box-sizing: border-box;
}

.login_tistory .inp_text+.inp_text {
    border-top: 1px solid #ddd;
}

.inp_text input {
    display: block;
    width: 100%;
    height: 100%;
    font-size: 13px;
    color: #000;
    border: none;
    outline: 0;
    -webkit-appearance: none;
    background-color: transparent;
}

.btn_login {
    margin: 20px 0 0;
    width: 100%;
    height: 48px;
    border-radius: 3px;
    font-size: 16px;
    color: #fff;
    background-color: #000;
}

.login_append {
    overflow: hidden;
    padding: 15px 0 0;
}
.inp_chk {
    display: inline-block;
    position: relative;
    margin-bottom: -1px;
}
.login_append .inp_chk {
    float: left;
}
.inp_chk .inp_radio {
    position: absolute;
    z-index: -1;
    top: 0;
    left: 0;
    width: 18px;
    height: 18px;
    border: 0;
}
.inp_chk .lab_g {
    display: inline-block;
    margin-right: 19px;
    color: #909090;
    font-size: 13px;
    line-height: 19px;
    vertical-align: top;
}
.inp_chk .ico_check {
    display: inline-block;
    width: 18px;
    height: 18px;
    margin: 1px 4px 0 0;
    background-position: -60px 0;
    color: #333;
}
.inp_chk .txt_lab {
    vertical-align: top;
}
.login_append .txt_find {
    float: right;
    color: #777;
}
</style>

<div class="login_tistory">
	<h2>${error}</h2>
	<fieldset>
		<form method="post" action="/login" role="form">
			<fieldset>
				<div class="box_login">
					<div class="inp_text">
						<label for="loginId" class="screen_out">아이디</label> <input
							type="text" name='username' class='form-control' placeholder="ID" autofocus>
					</div>
					<div class="inp_text">
						<label for="loginPw" class="screen_out">비밀번호</label>
						<input type="password" name='password' class='form-control' placeholder="Password">
					</div>
				</div>
			</fieldset>
			
			<input type="submit" class="btn_login" value="로그인" style="text-align: center;"> <input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
			
			<!-- 체크시 checked 추가 -->
			<div class="inp_chk">
				<input type="checkbox" id="remember-me" class="inp_radio" name='remember-me'>
				<label for="keepLogin" class="lab_g"><span class="img_top ico_check"></span> <span class="txt_lab">로그인 상태 유지</span></label>
			</div>
		</form>
		<span class="txt_find">
		<a href="/member/find/loginId" class="link_find">아이디</a> / 
		<a href="/member/find/password" class="link_find">비밀번호 찾기</a>
		</span>
	</fieldset>
</div>

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
