var getParty = (function() {
	function checkIds(userId, successCallBack, errorCallBack){
		$.getJSON(
			"/party/checkId/" + userId,
			function(partyNum){
				if (successCallBack) {
					successCallBack(partyNum);
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
		checkId : checkIds,
		};
})();
