var assert = require('assert'),
TestRunner = require('assert-runner'),
Random = require('./jssrc/random.js');


var tests = {
    "random number": function (done){ 	
    	var oReq = new TestRunner.TestRequest();
    	var oRes = new TestRunner.TestResponse();
    	Random.random(oReq, oRes, null, function(err){
    		assert(err == null);
    		console.log(oRes.sBody);
    		done();
    	});
    }
};

var oTestRunner = new TestRunner(tests);
oTestRunner.again(0);