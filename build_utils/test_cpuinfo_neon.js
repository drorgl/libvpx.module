var fs = require('fs');
fs.readFile('/proc/cpuinfo','utf8',function(err,data){
	var res = data || "";
	
	var neon_regex = /^Features.*neon.*$/gm;
	console.log(neon_regex.test(res) ? "1":"0");
});