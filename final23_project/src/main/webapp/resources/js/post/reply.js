/* 모듈패턴 : 이벤트, DOM, AJAX 처리 등을 하나의 jsp에 다 넣기에는 복잡해진다.  
 * 즉, 유지보수성이 저하되기에 javaScript를 별도 file로 만들어 분할 정복한다.
 * CallBack 함수 : 특정 이벤트시에 이를 불러준다.
 */

/** 함수 정의 영역 -> 이를 모듈이라고 한다.(여러 함수들을 하나로 감쌌기 때문에)*/
var replyService = (function() {
	
	function getList(orgIdAndPage, successCallBack, errorCallBack) {
		var page = orgIdAndPage.page || 1;
		$.getJSON(
			//https://api.jquery.com/jquery.getjson/
			"/replies/pages/" + orgIdAndPage.orgId + "/" + page,
			function(listReply){
				if (successCallBack) {
					successCallBack(listReply);
				}
			}
		).fail(function(xhr, status, errMsg){
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		);
	}
	
	function get(pptForSaleId, successCallBack, errorCallBack){
		$.getJSON(
			"/replies/" + pptForSaleId + ".json",
			function(replyObj){
				if (successCallBack) {
					successCallBack(replyObj);
				}
			}
		).fail(function(xhr, status, errMsg){
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		);
	}
	
	function add(originalId, reply, successCallBack, errorCallBack) {
		//https://api.jquery.com/jquery.ajax/
		$.ajax({
			type : 'post',	//method alias(별칭)
			url : '/replies/new/' + originalId,
			data : JSON.stringify(reply),	//객체를 json 문자열로 출력
			contentType : 'application/json; charset=UTF-8',
			success : function(resObj, status, xhr) {
				if (successCallBack) {
					successCallBack(resObj);
				}
			},
			error : function (xhr, status, errMsg) {
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		});
	}
	
	function update(reply, successCallBack, errorCallBack){
		$.ajax({
			type : 'put',	//method alias(별칭)
			url : '/replies/',
			data : JSON.stringify(reply),	//객체를 json 문자열로 출력
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
	
	function remove(replyId, successCallBack, errorCallBack){
		$.ajax({
			type : 'delete',	//method alias(별칭)
			url : '/replies/' + replyId,
			success : function(delResult, status, xhr) {
				if (successCallBack) {
					successCallBack(delResult);
				}
			},
			error : function (xhr, status, errMsg) {
				if (errorCallBack){
					errorCallBack(errMsg);
				}
			}
		});
	}
	
	//add는 외부 addReply는 내부함수로 짝지어짐. 즉 addReply를 찾아감.
	return {
		getReplyList:getList,
		getReply:get,
		addReply:add,
		updateReply:update,
		removeReply:remove
		};
})();