// ==UserScript==
// @name SuperTumblr
// @namespace http://joodle.tumblr.com/
// @description 既に上の方に流れてしまったpostは全て消してしまいましょう。
// @include http://www.tumblr.com/dashboard
// ==/UserScript==

var maxNodes = 100;
var lastNode = 0;
window.setInterval(function() {
    var pr = document.getElementById("posts");
    var el = pr.childNodes;
    var len = el.length-maxNodes;
	var i;
	
    for(var i = lastNode; i < len; i++) {
    	if(el[i].nodeType != 1) continue;
//    	pr.removeChild(el[i]);
		var h = el[i].scrollHeight;
		
//		console.log(h);
		
		el[i].style.display = "block";
		el[i].style.height = h + "px";
		el[i].style.border = 0;
		el[i].style.padding = 0;
		
		
		var e = el[i].firstChild,tmp = e;
		while(e = tmp) {
			tmp = e.nextSibling;
			el[i].removeChild(e);
		};
	}
	lastNode = i;
}, 5000);
