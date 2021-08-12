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
		locationList : getLocation,
		};
})();