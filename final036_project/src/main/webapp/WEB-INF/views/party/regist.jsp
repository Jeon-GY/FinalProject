<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<script type="text/javascript" src="/resources/js/party/party.js"></script>
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="/party/registParty" method="post" role="form" id="usercheck" name="member">
				<div class="form-group">
					<label for="userId">아이디</label>
					<input type="text" class="form-control" id="userId" name="userId" placeholder="ID" value="${party.userId}">
					<div class="eheck_font" id="userId_check"></div>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input type="password" class="form-control" id="pw" name="pw" placeholder="Confirm Password">
					<div class="eheck_font" id="pw_check"></div>
				</div>
				<div class="form-group">
					<label for="userPassword">비밀번호 확인</label>
					<input type="password" class="form-control" id="userPassword" name="userPassword" value="${party.userPassword}" placeholder="Confirm Password">
					<div class="eheck_font" id="userPassword_check"></div>
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" id="userName" name="userName" placeholder="Name" value="${party.userName}">
					<div class="eheck_font" id="name_check"></div>
				</div>
				<div class="form-group">
					<label for="email">이메일 주소</label>
					<input type="email" class="form-control" id="email" name="email" placeholder="E-mail" value="${party.email}">
					<div class="eheck_font" id="email_check"></div>
				</div>
				<div class="form-group">
					<label for="phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label>
					<input type="tel" class="form-control" id="phone" name="phoneNumber" placeholder="Phone Number" value="${party.phoneNumber}">
					<div class="eheck_font" id="phone_check"></div>
				</div>
				<div class="form-group">
					<label for="birthDate">생년월일</label>
					<input type="text" class="form-control" id="birthDate" name="birthDate" placeholder="ex) 19990101" value="${party.birthDate}">
					<div class="eheck_font" id="birthDate_check"></div>
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" class="zip_code" id="zipNo" readonly>
					<button type="button" class="zip_code_btn" onclick="goPopup();">우편번호</button><br/> 
					<input type="text" placeholder="기본 주소를 입력해 주세요" id="addr"><br/>
					<input type="text" placeholder="나머지 주소를 입력해 주세요" id="addrDetail">
					<input type="hidden" class="form-control" id="address" name="address" placeholder="주소" value="${party.address}">
				</div>
				<div class="form-group">
					<label for="gender">성별 </label>
					<input name="sex" id="sex" value="${party.sex}" type="hidden">
					<input type="checkbox" id="gender" onclick="changeSex(1)">남
					<input type="checkbox" id="gender" onclick="changeSex(0)">여
				</div>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</article>

<%@include file="../includes/footer.jsp"%>

<script>
//우편주소 조회

function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo) {
		document.getElementById("zipNo").value = zipNo;
		document.getElementById("addr").value = roadAddrPart1;
		if (addrDetail.length > 30) {
			alert('상세주소가 너무 길어 다시 입력해야 합니다.');
			return;
		}
		document.getElementById("addrDetail").value = addrDetail;
}
	
function goPopup(){ 
	var pop = window.open("/party/juso","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}

function changeSex(num) {
	$("#sex").val(num);
}

$(document).ready(function() {
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	var birthJ = false;
	var address = $('#detailaddress');
	
	//아이디 중복확인
	$("#userId").blur(function() {
		if($('#userId').val()==''){
			$('#userId_check').text('아이디를 입력하세요.');
			$('#userId_check').css('color', 'red');
		} else if(idJ.test($('#userId').val())!=true){
			$('#userId_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
			$('#userId_check').css('color', 'red');
		} else if($('#userId').val()!=''){
			var userId=$('#userId').val();
			getParty.checkId(
					userId,
					function(partyNumber) {
						if(partyNumber > 0){
							$('#userId_check').text('중복된 아이디 입니다.');
							$('#userId_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						}else{
							$('#userId_check').text('사용가능한 아이디 입니다.');
							$('#userId_check').css('color', 'blue');
							$("#usercheck").attr("disabled", false);
						}
					},
					function(errMsg){
						alert("ID 검색 오류 :" + errMsg);
					}
				);	//json
			}	//else if
		});	//blur
	$('form').on('submit',function(){
		var str = $('#addr').val() + $('#addrDetail').val();
		$("#address").val(str);
		
		var inval_Arr = new Array(8).fill(false);
		if (idJ.test($('#userId').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
			alert('아이디를 확인하세요.');
			return false;
		}
		inval_Arr[0] = true;
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#pw').val() == ($('#userPassword').val())) && pwJ.test($('#pw').val())) {
			inval_Arr[1] = true;
		} else {
			inval_Arr[1] = false;
			alert('비밀번호를 확인하세요.');
			return false;
		}
		// 이름 정규식
		if (nameJ.test($('#userName').val())) {
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
			alert('이름을 확인하세요.');
			return false;
		}
		
		// 생년월일 정규식
		if (birthJ) {
			console.log(birthJ);
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
			alert('생년월일을 확인하세요.');
			return false;
		}
		
		// 이메일 정규식
		if (mailJ.test($('#email').val())){
			console.log(phoneJ.test($('#email').val()));
			inval_Arr[4] = true;
		} else {
			inval_Arr[4] = false;
			alert('이메일을 확인하세요.');
			return false;
		}
		
		// 휴대폰번호 정규식
		if (phoneJ.test($('#phone').val())) {
			console.log(phoneJ.test($('#phone').val()));
			inval_Arr[5] = true;
		} else {
			inval_Arr[5] = false;
			alert('휴대폰 번호를 확인하세요.');
			return false;
		}
		
		//성별 확인
		if(member.gender[0].checked == false && member.gender[1].checked == false){
			inval_Arr[6] = false;
			alert('성별을 확인하세요.');
			return false;
		} else{
			inval_Arr[6] = true;
		}
		
		//주소확인
		if(address.val() == ''){
			inval_Arr[7] = false;
			alert('주소를 확인하세요.');
			return false;
		} else
			inval_Arr[7] = true;
		//전체 유효성 검사
		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			if(inval_Arr[i] == false){
				validAll = false;
			}
		} if(validAll == true){
			// 유효성 모두 통과
			alert($("#userName").val() + '님 PPT의 가족이 되어주셔서 감사합니다.');
		} else{
			alert('정보를 다시 확인하세요.')
		}
	});
	
	$('#userId').blur(function() {
		if (idJ.test($('#userId').val())) {
			console.log('true');
			$('#userId_check').text('사용 가능한 아이디입니다.');
			$('#userId_check').css('color', 'blue');
		} else {
			console.log('false');
			$('#userId_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
			$('#userId_check').css('color', 'red');
		}
	});
	
	//1~2 패스워드 일치 확인
	$('#pw').blur(function() {
		if (pwJ.test($('#pw').val())) {
			console.log('true'); $('#pw_check').text('');
		} else {
			console.log('false');
			$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
			$('#pw_check').css('color', 'red');
		}
	});
	$('#userPassword').blur(function() {
		if ($('#pw').val() != $(this).val()) {
			$('#userPassword_check').text('비밀번호가 일치하지 않습니다.');
			$('#userPassword_check').css('color', 'red');
		} else {
			$('#userPassword_check').text('비밀번호가 일치합니다.');
			$('#userPassword_check').css('color', 'blue');
		}
	});
	
	//이름에 특수문자 들어가지 않도록 설정
	$("#userName").blur(function() {
		if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text($("#userName").val() + '님 환영합니다');
		} else {
			$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
			$('#name_check').css('color', 'red');
		}
	});
	$("#email").blur(function() {
		if (mailJ.test($(this).val())) {
			$("#email_check").text('');
		} else {
			$('#email_check').text('이메일 양식을 확인해주세요.');
			$('#email_check').css('color', 'red');
		}
	});
	
	// 생일 유효성 검사
	var birthJ = false;
	
	// 생년월일 birthJ 유효성 검사
	$('#birthDate').blur(function(){
		var dateStr = $(this).val();
		var year = Number(dateStr.substr(0,4));
		// 입력한 값의 0~4자리까지 (연)
		var month = Number(dateStr.substr(4,2));
		// 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		var day = Number(dateStr.substr(6,2));
		// 입력한 값 6번째 자리부터 2자리 숫자 (일)
		var today = new Date();
		// 날짜 변수 선언
		var yearNow = today.getFullYear();
		// 올해 연도 가져옴
		if (dateStr.length <=8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			if (year > yearNow || year < 1900 ){
				$('#birthDate_check').text('생년월일을 확인해주세요');
				$('#birthDate_check').css('color', 'red');
			} else if (month < 1 || month > 12) {
				$('#birthDate_check').text('생년월일을 확인해주세요 ');
				$('#birthDate_check').css('color', 'red');
			}else if (day < 1 || day > 31) {
				$('#birthDate_check').text('생년월일을 확인해주세요 ');
				$('#birthDate_check').css('color', 'red');
			}else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				$('#birthDate_check').text('생년월일을 확인해주세요 ');
				$('#birthDate_check').css('color', 'red');
			}else if (month == 2) {
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if (day>29 || (day==29 && !isleap)) {
					$('#birthDate_check').text('생년월일을 확인해주세요 ');
					$('#birthDate_check').css('color', 'red');
				}else{
					$('#birthDate_check').text('');
					birthJ = true;
				}
			}else{
				$('#birthDate_check').text('');
				birthJ = true;
			} //end of if
		}else{
			//입력된 생년월일이 8자 초과할때 : auth : false
			$('#birthDate_check').text('생년월일을 확인해주세요 ');
			$('#birthDate_check').css('color', 'red');
		}
	}); //End of method 
	
	// 휴대전화
	$('#phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#phone_check").text('');
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 ');
			$('#phone_check').css('color', 'red');
		}
	});
	
}); 
</script>