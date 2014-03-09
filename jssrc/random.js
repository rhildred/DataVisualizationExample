module.exports.random = function(req, res, next, callback) {
	var aResults = new Array();
	for(var n = 0; n <= 20; n++){
		var oResult = {};
		oResult.y = Math.floor((Math.random()*20)+1);  
		aResults.push(oResult);
	}
	res.setHeader("Content-Type", "application/json");
	res.end(JSON.stringify(aResults));
	if (callback)
		callback(null);

};