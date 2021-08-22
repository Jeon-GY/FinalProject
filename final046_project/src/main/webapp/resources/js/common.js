var getLoc = (function() {
	function getLocation(locationId, successCallBack, errorCallBack){
		$.getJSON(
			"/post/get/" + locationId,
			function(locationList){
				if (successCallBack) {
					successCallBack(locationList);
				}
			}
		).fail(function(xhr, status, errMsg){
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		);
	}
	return {
		locationList : getLocation
		};
})();

var cart = (function() {
	function deleteCart(purId, successCallBack, errorCallBack){
		$.post(
			"/purchase/delete/" + purId,
			function(success){
				if (successCallBack) {
					successCallBack(success);
				}
			}
		).fail(function(xhr, status, errMsg){
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		);
	}
	
	function addCart(idnCount, successCallBack, errorCallBack){
		var oriId = idnCount.originalId;
		var cnt = idnCount.count;
		$.post(
			"/purchase/addCart/" + oriId + "/" + cnt,
			function(success){
				if (successCallBack) {
					successCallBack(success);
				}
			}
		).fail(function(xhr, status, errMsg){
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		);
	}
	return {
		deleteItem : deleteCart,
		add : addCart
		};
})();

var party = (function() {
	function disable(userId, successCallBack, errorCallBack) {
		$.post(
			"/party/disable/" + userId,
			function(success){
				if (successCallBack) {
					successCallBack(success);
				}
			}
		).fail(function(xhr, status, errMsg){
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		);
	}
	return {
		disableLogin : disable
		};
})();

var post = (function() {
	function advertise(postId, successCallBack, errorCallBack){
		$.ajax({
			type : 'put',	//method alias(별칭)
			url : '/post/addAdver/',
			data : JSON.stringify(postId),	//객체를 json 문자열로 출력
			contentType : 'application/json; charset=UTF-8',
			success : function(resultMsg, status, xhr) {
				if (successCallBack) {
					successCallBack(resultMsg);
				}
			},
			error : function (xhr, status, errMsg) {
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		});
	}
	return {
		advertisement : advertise
		};
})();