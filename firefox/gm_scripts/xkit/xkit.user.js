// ==UserScript==
// @name           XKit
// @namespace      http://userscripts.org/users/atesh
// @description    Useful additions to Tumblr.
// @include        http://www.tumblr.com/*
// @version        0.4.2
// ==/UserScript==

if (typeof GM_deleteValue === 'undefined') {

    GM_addStyle = function(css) {
        var style = document.createElement('style');
        style.textContent = css;
        document.getElementsByTagName('head')[0].appendChild(style);
    }

    GM_deleteValue = function(name) {
        localStorage.removeItem(name);
    }

    GM_getValue = function(name, defaultValue) {
        var value = localStorage.getItem(name);
        if (!value)
            return defaultValue;
        var type = value[0];
        value = value.substring(1);
        switch (type) {
            case 'b':
                return value === 'true';
            case 'n':
                return Number(value);
            default:
                return value;
        }
    }

    GM_log = function(message) {
        console.log(message);
    }

    GM_openInTab = function(url) {
        return window.open(url, "_blank");
    }

     GM_registerMenuCommand = function(name, funk) {
    //todo
    }

    GM_setValue = function(name, value) {
        value = (typeof value)[0] + value;
        localStorage.setItem(name, value);
    }
}

var xversion_major = "0";
var xversion_minor = "4";
var xversion_revision = "2";
var xversion = xversion_major + "." + xversion_minor + "." + xversion_revision;
var xkit_update_url = "http://userscripts.org/scripts/source/109272.user.js";

var xbootstrap_log_data = true;

var xbootstrap_install_url_count = 0;

var xbootstrap_install_urls = new Array();
    xbootstrap_install_urls[0] = "http://studioxenix.com/xkit/bootstrap/bootstrap.1.0.js.php";
    xbootstrap_install_urls[1] = "http://puaga.rehayurdakul.com/xkit/bootstrap/bootstrap.1.0.js.php";
    xbootstrap_install_urls[2] = "http://puaga.com/xkit/bootstrap/bootstrap.1.0.js.php";
    xbootstrap_install_urls[3] = "http://www.puaga.com/xkit/bootstrap/bootstrap.1.0.js.php";
    xbootstrap_install_urls[4] = "http://xkit.puaga.com/bootstrap/bootstrap.1.0.js.php";

var xbootstrap_fetch_url_count = 0;

var xbootstrap_fetch_urls = new Array();
    xbootstrap_fetch_urls[0] = "http://www.puaga.com/xkit/extensions/fetch.php?fln=";
    xbootstrap_fetch_urls[1] = "http://xkit.puaga.com/extensions/fetch.php?fln=";
    xbootstrap_fetch_urls[2] = "http://www.studioxenix.com/xkit/extensions/fetch.php?fln=";
    xbootstrap_fetch_urls[3] = "http://puaga.rehayurdakul.com/xkit/extensions/fetch.php?fln=";
    xbootstrap_fetch_urls[4] = "http://www.rehayurdakul.com/puaga/xkit/extensions/fetch.php?fln=";

var xbootstrap_code = GM_getValue("xbootstrap_code", "");
var xbootstrap_die  = false;
var xbootstrap_page_url = window.location.href;

var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

var xbootstrap_global_name = new Array();
var xbootstrap_global_data = new Array();

var xbootstrap_globalf_name = new Array();
var xbootstrap_globalf_data = new Array();


var xbootstrap_internal_name = new Array();
var xbootstrap_internal_data = new Array();

var xbootstrap_icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAADvUlEQVRYhe2Wv0tjWRTHPy/ZLkJcDFoFg+ATJGDYRXBtEvvgbKVYxSJqCiGSxkoyI6ZbcDo1TYKwiDZx/wBRLFItJHaLIElY2SIE8iZCsmBxtnj3moybX7MuLCzzhcflvvPeOed7ft0LX/Efw1CrG8gCo2pfBi6BG+DTv2DnHRDo2GeBCoBDvfCp5716yh1r8A2GM4AAH2mTC6j9ZwgChS4K4kAdyAGTX2A4ApSA6y7/RdT7v6FEd7ZubCZ19XM/zCnlpT7fXgPJboJkL88UgrSj4e4iP8QOd7KHHOxaqPeRU8JORaaH3K0cKGGzhTbrAv3T5Fb/xXt9EDRNU05OTmRkZEQ6DHRDHJutLrJ+rDVy9I8wkyMjI7K5uakdGEahdmIQItgRGqSTODabAr1DNafkBeycFuhdF2CnpcSXdRFupfh1GuawiyijHE0qJ3J0Z9hLz9BOdHqujce/hVISJAnyg52GnHLqtRO5f2pcQ1e4bsEIEEmCiHp+A/nediLyyokMg+fGUNAVr2sid62M/wnyK8hmuxPAZj3M0ALaZ0EvRGifDzvYESlaSvi7Wv+wlzJ2pEJAUa1vQgSbSefAKQHx76D+M8gJyE8gbjvsST5nnmG4Fh3KuIYuxAjtwaK7odTle92u19jd8ibjGrq1dE30Y5pLJBKSSCSEAVNQQzMc1Dq6Rev0ONm0c6Zpytramm7Vvphk+Oo9pH0yDho0ndO17yg+ZHCY9MWl8+TTxTcoxzm6ROEbgNXV1fj5+flOKpXC4/HIq2+KT09P1v7+fvn5+Xl9dnb2ZmNjYycWi1WU/IPf77ceHh4uW63WZSqVKno8noCIjBqGEdJKarUaBwcHRKPRkt/vLzqdzp1oNFrRl9LM1NRUYHd39+XiKCI3wMd0Oh2qVCo7TqezvL29zcTEhK8bvWazSTqdtqrV6ujCwkJ2eXm5LCKWciIkItbp6al1f3/vS6VSvq2trU/QvhXXgXXgl+Pj43eNRmP99vb2x2KxSKvVIhwOs7i4OCDCNvL5PBcXF3i9XsLhMDMzM0XgUkQuY7FYGbCwL6Z3Lw6Mj4+XDMOw5ufnA81mk7u7O1wul2WaZnZpacnyeDyjIhLoDGk3iEjZMIxsrVbj6Ogo8Pj4GDBN07eysoLX67WAm729vUC1Ws0CHwCMdDodbDQa78/Ozl4UhUIhpqenX/aGYVhAUUQsh8NRdDgc5Wg0qmuAdDodFJEQMCoiOo0+wzB8V1dX5PN5Wq0WY2NjALhcrkChULgbKqRf8b/HX+azcpPvc/6jAAAAAElFTkSuQmCC';

new function() {

xkit_bootstrap_log("xkit_bootstrap init.");
xkit_bootstrap_init();

function xkit_bootstrap_init() {
	
	// Init the bootstrap code.

	// Let's first check if the user wants to reset us.
	if (xbootstrap_page_url.search("www.tumblr.com/xkit_reset") != -1) {
 		if (confirm("Reset all XKit data and perform a clean re-install?\nSome of you data, like your blacklisted words won't be deleted.")) {
			// yes!
			GM_setValue("xbootstrap_installed", false);
			GM_deleteValue("xbootstrap_code");
			GM_deleteValue("xkit_main");
			GM_deleteValue("xkit_installer");
			GM_deleteValue("xkit_required");
			GM_deleteValue("xkit_install_chk_valid");
			GM_deleteValue("xkit_installed_extensions");
			GM_deleteValue("xm_xkit_preferences_on");
			alert("XKit data deleted.\n\nXKit will now open a new tab and start the installation there.\n\nPlease wait ~15 seconds for the installation process to begin.");
			GM_openInTab("http://www.tumblr.com/xkit_installer");
			window.close();
		}
			
		return;
	}

        xbootstrap_code = GM_getValue("xbootstrap_code", "");
	xvar_set('xkernel_icon', xbootstrap_icon);
	xvar_set('xkernel_fetch_supported', 'true');

	// Let's check if the bootstrapper is installed.
	if (xbootstrap_code === "") {
		// bootstrap code not installed.
		xvar_set("fresh_install", "true");
		xkit_bootstrap_log("bootstrap code not found, downloading now.");
		// xkit_bootstrap_download("xbootstrap_code",xbootstrap_installurl);
		xkit_bootstrap_download_bootstrap();
	} else {
		// bootstrap code already installed.
		xvar_set("fresh_install", "false");
		xkit_bootstrap_log("bootstrap code found. launching code.");
		xkit_bootstrap_boot("xbootstrap_code");
	}

}

function xkit_bootstrap_download_bootstrap() {

	xkit_bootstrap_log("download_bootstrap called. i = " + xbootstrap_install_url_count);
	if (xbootstrap_install_url_count > xbootstrap_install_urls.length) {
		xkit_bootstrap_log("list ended! stopping for now.");
		return;
	}

	xkit_bootstrap_download_i(xbootstrap_install_url_count);
	xbootstrap_install_url_count++;

}

function xkit_bootstrap_download_i(urlindex) {

	// Download a file and save it to GM settings.
	var remoteurl = xbootstrap_install_urls[urlindex];
	gmsavealias = "xbootstrap_code";

	xkit_bootstrap_log("xkit_bootstrap_download: '" + gmsavealias + "' from '" + remoteurl + "'");

	var syncmode = false;
	if (gmsavealias === "xbootstrap_code") {
		syncmode = true;
	}

	// chrome (and sometimes firefox) caches files. so we need to do this:
	if (remoteurl.indexOf("?") != -1) {
		remoteurl = remoteurl + "&rn1=" + Math.floor(Math.random()*9669);
	} else {
		remoteurl = remoteurl + "?rn1=" + Math.floor(Math.random()*9669);
	}
	remoteurl = remoteurl + "&rn2=" + Math.floor(Math.random()*669);
	remoteurl = remoteurl + "&rn3=" + Math.floor(Math.random()*69);
	remoteurl = remoteurl + "&rn4=" + Math.floor(Math.random()*9);

	GM_xmlhttpRequest({
  		method: "GET",
  		url: remoteurl,
		synchronous: syncmode,
  		onerror: function(response) {
			xkit_bootstrap_log("download failed, retrying....");
			xkit_bootstrap_download_bootstrap();
			return;
  		},
  		onabort: function(response) {
			xkit_bootstrap_log("download failed, retrying....");
			xkit_bootstrap_download_bootstrap();
			return;
  		},
  		onload: function(response) {
			xkit_bootstrap_log("xkit_bootstrap_download: " + gmsavealias + " complete.");
			if (response.responseText.search("// Bootstrapper for XKit.") == -1) {
			      	// oops! download failed!
				xkit_bootstrap_log("download failed, retrying....");
				xkit_bootstrap_download_bootstrap();
				return;
			}
			GM_setValue(gmsavealias, response.responseText);
			xkit_bootstrap_boot(gmsavealias);
			xbootstrap_install_url_count = 0;
  		}
	});

}

function xkit_bootstrap_boot(scriptalias) {

	// 'boots' the bootstrap code, which in return will
	// load the extension itself.
        try {
		xkit_bootstrap_log("xkit_bootstrap_boot: " + scriptalias);

		xbootstrap_code = GM_getValue(scriptalias, "");
		if (xbootstrap_code === "") {
			// oops?
			xkit_show_top_error('E1 Unable to contact XKit servers. We are incredibly sorry about this. The installation will start as soon as the server is reachable. <a href="http://www.studioxenix.com/xkit/installfail/index.php">more info</a>');
			GM_setValue("xbootstrap_installed", false);
			GM_setValue("xbootstrap_code", "");
			return;
		}

		eval(xbootstrap_code);
		xkit_bootstrap_log("xkit_bootstrap_boot: " + scriptalias + " > DONE!");

	}
	catch(e) {
		xkit_show_top_error('E2 Unable to contact XKit servers. We are incredibly sorry about this. The installation will start as soon as the server is reachable. <a href="http://www.studioxenix.com/xkit/installfail/index.php">more info</a>');
		GM_setValue("xbootstrap_installed", false);
		GM_setValue("xbootstrap_code", "");
	}

}

function xkit_show_top_error(message) {

		var err_div = create('<div style="background: rgba(255,255,255, 0.5); padding: 5px; text-align: center; color: black; font-size: 11px; -webkit-border-bottom-right-radius: 8px; -webkit-border-bottom-left-radius: 8px; -moz-border-radius-bottomright: 8px; -moz-border-radius-bottomleft: 8px; border-bottom-right-radius: 8px; border-bottom-left-radius: 8px;"><b>XKit Bootstrapper Error:</b> ' + message + '</div>');
		if (document.createTextNode){
			document.getElementById("container").insertBefore(err_div,document.getElementById("container").childNodes[0]);
		}

}

function create(htmlStr) {
    var frag = document.createDocumentFragment(),
        temp = document.createElement('div');
    temp.innerHTML = htmlStr;
    while (temp.firstChild) {
        frag.appendChild(temp.firstChild);
    }
    return frag;
}


function xkit_bootstrap_load(scriptalias) {

        var xload_enabled = GM_getValue("xm_" + scriptalias + "_on", "true");
	if (xload_enabled == "false") { 
		xkit_bootstrap_log("xkit_bootstrap_load: " + scriptalias + " > Disabled, not loading.");
		return; 
	}

	var xload_code = GM_getValue(scriptalias, "");	
	if (xload_code == "") {
		xkit_bootstrap_log("xkit_bootstrap_load: " + scriptalias + " > ERROR! Empty!");
		return;
	}

	try{
 		eval(xload_code);
	}
	catch(e){
 		xkit_bootstrap_log(" **** xkit_bootstrap_load: " + scriptalias + " > ERROR! -> " + e.message);
		alert('XKit extension "' + scriptalias + '" caused this runtime error: \n\n' + e.message + '\n\nAs a result, this extension has been disabled. Please check if any updates are available and try again. \n\nIf problem continues, please visit www.tumblr.com/xkit_reset to reset XKit.');
		xset("xm_" + scriptalias + "_on", "false");
	}
	finally{
 		return;
	}

	//xkit_bootstrap_log("xkit_bootstrap_load: " + scriptalias + " > DONE!");

}

function xkit_bootstrap_load_nosafeguard(scriptalias) {

	// same as xkit_bootstrap_boot, but when failed, doesn't shut down
	// the whole extension.
	xkit_bootstrap_log("xkit_bootstrap_load_nosafeguard: " + scriptalias);

	var xload_code = GM_getValue(scriptalias, "");	
	if (xload_code === "") {
		xkit_bootstrap_log("xkit_bootstrap_load_nosafeguard: " + scriptalias + " > ERROR! Empty!");
		return;
	}

	try{
 		eval(xload_code);
	}
	catch(e){
		// nothing!
		xkit_bootstrap_log(" **** xkit_bootstrap_load_nosafeguard: " + scriptalias + " > ERROR! -> " + e.message);
	}
	finally{
 		return;
	}
	
	xkit_bootstrap_log("xkit_bootstrap_load_nosafeguard: " + scriptalias + " > DONE!");

}

function xkit_bootstrap_fetch(gmsavealias) {

	// Fetch a script file from the servers and save it.
	xkit_bootstrap_log("bootstrap_fetch called. i = " + xbootstrap_fetch_url_count);
	if (xbootstrap_fetch_url_count > xbootstrap_fetch_urls.length) {
		xkit_bootstrap_log("list ended! stopping for now.");
		alert("Could not download the file " + gmsavealias + " from servers. (Error Code: 60)");
		return;
	}

	xkit_bootstrap_fetch_i(gmsavealias, xbootstrap_fetch_url_count);
	xbootstrap_fetch_url_count++;

}

function xkit_bootstrap_fetch_i(gmsavealias, i) {

	// Download a file and save it to GM settings.
	var remoteurl = xbootstrap_fetch_urls[i] + gmsavealias;

	xkit_bootstrap_log("xkit_bootstrap_fetch: '" + gmsavealias + "' from '" + remoteurl + "'");

	var syncmode = false;
	if (gmsavealias === "xbootstrap_code") {
		syncmode = true;
	}

	// chrome (and sometimes firefox) caches files. so we need to do this:
	if (remoteurl.indexOf("?") != -1) {
		remoteurl = remoteurl + "&rn1=" + Math.floor(Math.random()*9669);
	} else {
		remoteurl = remoteurl + "?rn1=" + Math.floor(Math.random()*9669);
	}
	remoteurl = remoteurl + "&rn2=" + Math.floor(Math.random()*669);
	remoteurl = remoteurl + "&rn3=" + Math.floor(Math.random()*69);
	remoteurl = remoteurl + "&rn4=" + Math.floor(Math.random()*9);

	GM_xmlhttpRequest({
  		method: "GET",
  		url: remoteurl,
		synchronous: syncmode,
  		onerror: function(response) {
			xkit_bootstrap_log("download failed, retrying.... (E1)");
			xkit_bootstrap_fetch(gmsavealias);
			return;
  		},
  		onabort: function(response) {
			xkit_bootstrap_log("download failed, retrying.... (E2)");
			xkit_bootstrap_fetch(gmsavealias);
			return;
  		},
  		onload: function(response) {
			xkit_bootstrap_log("xkit_bootstrap_download: " + gmsavealias + " complete.");
			if (response.responseText.search("/* VERSION ") == -1) {
			      	// oops! download failed!
				xkit_bootstrap_log("download failed, retrying.... (E3)");
				xkit_bootstrap_fetch(gmsavealias);
				return;
			}
			GM_setValue(gmsavealias, response.responseText);
			xkit_bootstrap_boot(gmsavealias);
			xbootstrap_fetch_url_count = 0;
  		}
	});	

}

function xkit_bootstrap_download(gmsavealias, remoteurl) {

	// Download a file and save it to GM settings.
	xkit_bootstrap_log("xkit_bootstrap_download: '" + gmsavealias + "' from '" + remoteurl + "'");

	var syncmode = false;
	if (gmsavealias === "xbootstrap_code") {
		syncmode = true;
	}

	// chrome (and sometimes firefox) caches files. so we need to do this:
	if (remoteurl.indexOf("?") != -1) {
		remoteurl = remoteurl + "&rn1=" + Math.floor(Math.random()*9669);
	} else {
		remoteurl = remoteurl + "?rn1=" + Math.floor(Math.random()*9669);
	}
	remoteurl = remoteurl + "&rn2=" + Math.floor(Math.random()*669);
	remoteurl = remoteurl + "&rn3=" + Math.floor(Math.random()*69);
	remoteurl = remoteurl + "&rn4=" + Math.floor(Math.random()*9);

	GM_xmlhttpRequest({
  		method: "GET",
  		url: remoteurl,
		synchronous: syncmode,
  		onerror: function(response) {
                        alert("error");
  		},
  		onabort: function(response) {
                        alert("abort");
  		},
  		onload: function(response) {
			xkit_bootstrap_log("xkit_bootstrap_download: " + gmsavealias + " complete.");
			if (response.responseText.search("Sorry, Unable to process request at this time -- error 999.") != -1) {
			      if (response.responseText.search("/* VERSION ") == -1) {
                                   alert("Error downloading a required file!\nThe server might be down.\n\nPlease try again. (Y999)");
                                   return;
                              }
			}
			GM_setValue(gmsavealias, response.responseText);
			xkit_bootstrap_boot(gmsavealias);
  		}
	});

}

function xkit_bootstrap_installed(gmsavealias) {

	if (gmsavealias === "") {
		return false;
	} else {
		return true;
	}

}

function xkit_bootstrap_shutdown(gmsavealias) {

	// shuts down the extension.
	// to-do: we can probably make this better..?
	xglobalf_run(gmsavealias + "_shutdown");

}

function xkit_bootstrap_version(gmsavealias) {

	var tempdata = GM_getValue(gmsavealias, "");
	if (xkit_bootstrap_installed(gmsavealias) === false || tempdata === "") {
		return "";
	}

	var str_start = tempdata.search("/* VERSION");
	if (str_start === -1) {
		return "";
	}

	var str_end   = tempdata.indexOf("**/", str_start);
	if (str_end === -1) {
		return "";
	}

	var str_version = tempdata.substring(str_start + 9, str_end - 1);
	return str_version;
	
}

function xkit_bootstrap_interval(gmsavealias) {

	var tempdata = GM_getValue(gmsavealias, "");
	if (xkit_bootstrap_installed(gmsavealias) === false || tempdata === "") {
		return 0;
	}

	var str_start = tempdata.search("/* INTERVAL");
	if (str_start === -1) {
		return 0;
	}

	var str_end   = tempdata.indexOf("**/", str_start);
	if (str_end === -1) {
		return 0;
	}

	var str_interval = tempdata.substring(str_start + 9, str_end - 1);
	return parseInt(str_interval);
	
}

function xkit_bootstrap_description(gmsavealias) {

	var tempdata = GM_getValue(gmsavealias, "");
	if (xkit_bootstrap_installed(gmsavealias) === false || tempdata === "") {
		return "";
	}

	var str_start = tempdata.search("/* DESCRIPTION");
	if (str_start === -1) {
		return "";
	}

	var str_end   = tempdata.indexOf("**/", str_start);
	if (str_end === -1) {
		return "";
	}

	var str_description = tempdata.substring(str_start + 13, str_end - 1);
	return str_description;
	
}

function xkit_bootstrap_developer(gmsavealias) {

	var tempdata = GM_getValue(gmsavealias, "");
	if (xkit_bootstrap_installed(gmsavealias) === false || tempdata === "") {
		return "";
	}

	var str_start = tempdata.search("/* DEVELOPER");
	if (str_start === -1) {
		return "";
	}

	var str_end   = tempdata.indexOf("**/", str_start);
	if (str_end === -1) {
		return "";
	}

	var str_description = tempdata.substring(str_start + 11, str_end - 1);
	return str_description;
	
}

function xkit_bootstrap_title(gmsavealias) {

	var tempdata = GM_getValue(gmsavealias, "");
	if (xkit_bootstrap_installed(gmsavealias) === false || tempdata === "") {
		return "";
	}

	var str_start = tempdata.search("/* TITLE");
	if (str_start === -1) {
		return "";
	}

	var str_end   = tempdata.indexOf("**/", str_start);
	if (str_end === -1) {
		return "";
	}

	var str_title = tempdata.substring(str_start + 7, str_end - 1);
	return str_title;
	
}

function xkit_bootstrap_prefmenu(gmsavealias) {

	var tempdata = GM_getValue(gmsavealias, "");
	if (xkit_bootstrap_installed(gmsavealias) === false || tempdata === "") {
		return "";
	}

	var str_start = tempdata.search("/* PREFMENU");
	if (str_start === -1) {
		return "";
	}

	var str_end   = tempdata.indexOf("**/", str_start);
	if (str_end === -1) {
		return "";
	}

	var str_title = tempdata.substring(str_start + 10, str_end - 1);
	return str_title;
	
}

function xkit_bootstrap_preffunc(gmsavealias) {

	var tempdata = GM_getValue(gmsavealias, "");
	if (xkit_bootstrap_installed(gmsavealias) === false || tempdata === "") {
		return "";
	}

	var str_start = tempdata.search("/* PREFFUNC");
	if (str_start === -1) {
		return "";
	}

	var str_end   = tempdata.indexOf("**/", str_start);
	if (str_end === -1) {
		return "";
	}

	var str_title = tempdata.substring(str_start + 10, str_end - 1);
	return xglobalf_run(str_title);
	
}


function xkit_bootstrap_attach(gmsavealias) {

	if (xkit_bootstrap_interval(gmsavealias) === 0) {
		return;
	}

	xkit_bootstrap_log("attaching " + gmsavealias + " with " + xkit_bootstrap_interval(gmsavealias) + " ms interval.");
	setInterval(function() { xkit_bootstrap_load(gmsavealias) }, xkit_bootstrap_interval(gmsavealias));

}

function xkit_bootstrap_attach_globalf(globalf, run_interval) {

	// to-do!
	// save the setinterval result to some place,
	// along with the globalf name, so we can disable it
	// later!!!!
	xkit_bootstrap_log("attaching " + globalf + " with " + run_interval + " ms interval.");
	setInterval(function() { xglobalf_run(globalf) }, run_interval);

}

function xkit_bootstrap_log(logtext) {

	if (xbootstrap_log_data === false) { return; }
	console.log(logtext);

}

function xkit_bootstrap_attach_source(gmsavealias) {

	var source = GM_getValue(gmsavealias, "");
	if (xkit_bootstrap_installed(gmsavealias) === false || source === "") {
		return "";
	}	

	var headID = document.getElementsByTagName("head")[0];         
	var newScript = document.createElement('script');
	newScript.type = 'text/javascript';
	newScript.src = source;
	headID.appendChild(newScript);

}

function xglobalf_check(variablename) {

	var i = 0;
	for (i = 0; i<xbootstrap_globalf_name.length; i++) {
		if (xbootstrap_globalf_name[i] === variablename) {
			return true;
			break;
		}
	}

	return false;

}

function xglobalf_run(functionname) {

	if (xglobalf_check(functionname) === false) {
		xkit_bootstrap_log("\"" + functionname + "\" called but not found.");
		return "";
	}

	var i = 0;
	for (i = 0; i<xbootstrap_globalf_name.length; i++) {
		if (xbootstrap_globalf_name[i] === functionname) {
			var return_data = eval(xbootstrap_globalf_data[i]);
			return return_data;
			break;
		}
	}
	
}

function xglobalf_run(functionname) {

	if (xglobalf_check(functionname) === false) {
		xkit_bootstrap_log("\"" + functionname + "\" called but not found.");
		return;
	}

	var i = 0;
	for (i = 0; i<xbootstrap_globalf_name.length; i++) {
		if (xbootstrap_globalf_name[i] === functionname) {
			var return_data = eval(xbootstrap_globalf_data[i]);
			return return_data;
			break;
		}
	}
	
}

function xglobalf_run_with_parameters(functionname, parnames, pardatas) {

	if (xglobalf_check(functionname) === false) {
		return;
	}

	var i = 0;
	var par_data  = "";
	
	var par_list1 = new Array();
	var par_list2 = new Array();
	par_list1 = parnames.split("\f");
	par_list2 = pardatas.split("\f");
	for (i = 0; i<par_list1.length;i++) {
		par_list2[i] = par_list2[i].replace(new RegExp("'", 'g'),"\'");
		par_data = par_data + "\n" + par_list1[i] + " = '" + par_list2[i] + "';";
	}

	
	for (i = 0; i<xbootstrap_globalf_name.length; i++) {
		if (xbootstrap_globalf_name[i] === functionname) {
			var data_to_run = par_data + "\n\n" + xbootstrap_globalf_data[i];
			var return_data = eval(data_to_run);
			return return_data;
			break;
		}
	}
	
}


function xglobalf_add(functionname, functionsource) {

  	if ('function' === typeof functionsource) {
    		// Execute this function with no arguments, by adding parentheses.
    		// One set around the function, required for valid syntax, and a
    		// second empty set calls the surrounded function.
    		functionsource = '(' + functionsource + ')();'
  	}

	if (functionsource.substring(0,9) === "function ") {
		var xps = functionsource.search("{");
		functionsource = functionsource.substring(xps + 1, functionsource.length - 1);
	}

	functionsource = "var jQ = jQuery.noConflict(); \n" + functionsource;

	if (xglobalf_check(functionname) === false) {
		xbootstrap_globalf_name.push(functionname);
		xbootstrap_globalf_data.push(functionsource);
		return;
	} else {
		var i = 0;
		for (i = 0; i<xbootstrap_globalf_name.length; i++) {
			if (xbootstrap_globalf_name[i] === functionname) {
				xbootstrap_globalf_data[i] = functionsource;
				return;
				break;
			}
		}
	}
	
}

function xvar_get(variablename) {

	var i = 0;
	for (i = 0; i<xbootstrap_global_name.length; i++) {
		if (xbootstrap_global_name[i] === variablename) {
			return xbootstrap_global_data[i];
			break;
		}
	}

	return "";

}

function xvar_check(variablename) {

	var i = 0;
	for (i = 0; i<xbootstrap_global_name.length; i++) {
		if (xbootstrap_global_name[i] === variablename) {
			return true;
			break;
		}
	}

	return false;

}

function xvar_set(variablename, data) {

	if (xvar_check(variablename) === false) {
		xbootstrap_global_name.push(variablename);
		xbootstrap_global_data.push(data);
		return;
	} else {
		var i = 0;
		for (i = 0; i<xbootstrap_global_name.length; i++) {
			if (xbootstrap_global_name[i] === variablename) {
				xbootstrap_global_data[i] = data;
				return;
				break;
			}
		}
	}

}

function xcss_append(data) {

	var jQ = jQuery.noConflict();

	var i = 0;
	var xs = data.search("%var ");
	var xe = 0;
	
	if (xs != -1) {
		xs = xs - 5;
		for (i=0;i<=10;i++) {
			xs = data.indexOf("%var ", xs);
			if (xs === -1) { break; }
			var xe = data.indexOf("%",xs + 5);
			if (xe === -1) { break; }
			var to_find = data.substring(xs, xe + 1);
			var to_replace = data.substring(xs + 5, xe);	
			to_replace = xvar_get(to_replace);
			data = data.replace(to_find, to_replace);
		}
	}

	jQ('head').append("<style>" + data + "</style>");

}

function xset(gmalias, data) {
	
	// chrome fails unless we do this.
	GM_deleteValue(gmalias);
	GM_setValue(gmalias, data);

}

function xappend(gmalias, data) {
	
	// chrome fails unless we do this.
	var old_data = GM_getValue(gmalias, "");
	var new_data = old_data + data;
	GM_deleteValue(gmalias);
	GM_setValue(gmalias, new_data);

}

function xget(gmalias, defaultdata) {
	
	// chrome fails unless we do this.
	return GM_getValue(gmalias, defaultdata);

}

function xencode64(input) {
	var output = new StringMaker();
	var chr1, chr2, chr3;
	var enc1, enc2, enc3, enc4;
	var i = 0;

	while (i < input.length) {
		chr1 = input.charCodeAt(i++);
		chr2 = input.charCodeAt(i++);
		chr3 = input.charCodeAt(i++);

		enc1 = chr1 >> 2;
		enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
		enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
		enc4 = chr3 & 63;

		if (isNaN(chr2)) {
			enc3 = enc4 = 64;
		} else if (isNaN(chr3)) {
			enc4 = 64;
		}

		output.append(keyStr.charAt(enc1) + keyStr.charAt(enc2) + keyStr.charAt(enc3) + keyStr.charAt(enc4));
   }
   
   return output.toString();
}

var ua = navigator.userAgent.toLowerCase();
if (ua.indexOf(" chrome/") >= 0 || ua.indexOf(" firefox/") >= 0 || ua.indexOf(' gecko/') >= 0) {
	var StringMaker = function () {
		this.str = "";
		this.length = 0;
		this.append = function (s) {
			this.str += s;
			this.length += s.length;
		}
		this.prepend = function (s) {
			this.str = s + this.str;
			this.length += s.length;
		}
		this.toString = function () {
			return this.str;
		}
	}
} else {
	var StringMaker = function () {
		this.parts = [];
		this.length = 0;
		this.append = function (s) {
			this.parts.push(s);
			this.length += s.length;
		}
		this.prepend = function (s) {
			this.parts.unshift(s);
			this.length += s.length;
		}
		this.toString = function () {
			return this.parts.join('');
		}
	}
}

var MD5 = function (string) {
 
	function RotateLeft(lValue, iShiftBits) {
		return (lValue<<iShiftBits) | (lValue>>>(32-iShiftBits));
	}
 
	function AddUnsigned(lX,lY) {
		var lX4,lY4,lX8,lY8,lResult;
		lX8 = (lX & 0x80000000);
		lY8 = (lY & 0x80000000);
		lX4 = (lX & 0x40000000);
		lY4 = (lY & 0x40000000);
		lResult = (lX & 0x3FFFFFFF)+(lY & 0x3FFFFFFF);
		if (lX4 & lY4) {
			return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
		}
		if (lX4 | lY4) {
			if (lResult & 0x40000000) {
				return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
			} else {
				return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
			}
		} else {
			return (lResult ^ lX8 ^ lY8);
		}
 	}
 
 	function F(x,y,z) { return (x & y) | ((~x) & z); }
 	function G(x,y,z) { return (x & z) | (y & (~z)); }
 	function H(x,y,z) { return (x ^ y ^ z); }
	function I(x,y,z) { return (y ^ (x | (~z))); }
 
	function FF(a,b,c,d,x,s,ac) {
		a = AddUnsigned(a, AddUnsigned(AddUnsigned(F(b, c, d), x), ac));
		return AddUnsigned(RotateLeft(a, s), b);
	};
 
	function GG(a,b,c,d,x,s,ac) {
		a = AddUnsigned(a, AddUnsigned(AddUnsigned(G(b, c, d), x), ac));
		return AddUnsigned(RotateLeft(a, s), b);
	};
 
	function HH(a,b,c,d,x,s,ac) {
		a = AddUnsigned(a, AddUnsigned(AddUnsigned(H(b, c, d), x), ac));
		return AddUnsigned(RotateLeft(a, s), b);
	};
 
	function II(a,b,c,d,x,s,ac) {
		a = AddUnsigned(a, AddUnsigned(AddUnsigned(I(b, c, d), x), ac));
		return AddUnsigned(RotateLeft(a, s), b);
	};
 
	function ConvertToWordArray(string) {
		var lWordCount;
		var lMessageLength = string.length;
		var lNumberOfWords_temp1=lMessageLength + 8;
		var lNumberOfWords_temp2=(lNumberOfWords_temp1-(lNumberOfWords_temp1 % 64))/64;
		var lNumberOfWords = (lNumberOfWords_temp2+1)*16;
		var lWordArray=Array(lNumberOfWords-1);
		var lBytePosition = 0;
		var lByteCount = 0;
		while ( lByteCount < lMessageLength ) {
			lWordCount = (lByteCount-(lByteCount % 4))/4;
			lBytePosition = (lByteCount % 4)*8;
			lWordArray[lWordCount] = (lWordArray[lWordCount] | (string.charCodeAt(lByteCount)<<lBytePosition));
			lByteCount++;
		}
		lWordCount = (lByteCount-(lByteCount % 4))/4;
		lBytePosition = (lByteCount % 4)*8;
		lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80<<lBytePosition);
		lWordArray[lNumberOfWords-2] = lMessageLength<<3;
		lWordArray[lNumberOfWords-1] = lMessageLength>>>29;
		return lWordArray;
	};
 
	function WordToHex(lValue) {
		var WordToHexValue="",WordToHexValue_temp="",lByte,lCount;
		for (lCount = 0;lCount<=3;lCount++) {
			lByte = (lValue>>>(lCount*8)) & 255;
			WordToHexValue_temp = "0" + lByte.toString(16);
			WordToHexValue = WordToHexValue + WordToHexValue_temp.substr(WordToHexValue_temp.length-2,2);
		}
		return WordToHexValue;
	};
 
	function Utf8Encode(string) {
		string = string.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return utftext;
	};
 
	var x=Array();
	var k,AA,BB,CC,DD,a,b,c,d;
	var S11=7, S12=12, S13=17, S14=22;
	var S21=5, S22=9 , S23=14, S24=20;
	var S31=4, S32=11, S33=16, S34=23;
	var S41=6, S42=10, S43=15, S44=21;
 
	string = Utf8Encode(string);
 
	x = ConvertToWordArray(string);
 
	a = 0x67452301; b = 0xEFCDAB89; c = 0x98BADCFE; d = 0x10325476;
 
	for (k=0;k<x.length;k+=16) {
		AA=a; BB=b; CC=c; DD=d;
		a=FF(a,b,c,d,x[k+0], S11,0xD76AA478);
		d=FF(d,a,b,c,x[k+1], S12,0xE8C7B756);
		c=FF(c,d,a,b,x[k+2], S13,0x242070DB);
		b=FF(b,c,d,a,x[k+3], S14,0xC1BDCEEE);
		a=FF(a,b,c,d,x[k+4], S11,0xF57C0FAF);
		d=FF(d,a,b,c,x[k+5], S12,0x4787C62A);
		c=FF(c,d,a,b,x[k+6], S13,0xA8304613);
		b=FF(b,c,d,a,x[k+7], S14,0xFD469501);
		a=FF(a,b,c,d,x[k+8], S11,0x698098D8);
		d=FF(d,a,b,c,x[k+9], S12,0x8B44F7AF);
		c=FF(c,d,a,b,x[k+10],S13,0xFFFF5BB1);
		b=FF(b,c,d,a,x[k+11],S14,0x895CD7BE);
		a=FF(a,b,c,d,x[k+12],S11,0x6B901122);
		d=FF(d,a,b,c,x[k+13],S12,0xFD987193);
		c=FF(c,d,a,b,x[k+14],S13,0xA679438E);
		b=FF(b,c,d,a,x[k+15],S14,0x49B40821);
		a=GG(a,b,c,d,x[k+1], S21,0xF61E2562);
		d=GG(d,a,b,c,x[k+6], S22,0xC040B340);
		c=GG(c,d,a,b,x[k+11],S23,0x265E5A51);
		b=GG(b,c,d,a,x[k+0], S24,0xE9B6C7AA);
		a=GG(a,b,c,d,x[k+5], S21,0xD62F105D);
		d=GG(d,a,b,c,x[k+10],S22,0x2441453);
		c=GG(c,d,a,b,x[k+15],S23,0xD8A1E681);
		b=GG(b,c,d,a,x[k+4], S24,0xE7D3FBC8);
		a=GG(a,b,c,d,x[k+9], S21,0x21E1CDE6);
		d=GG(d,a,b,c,x[k+14],S22,0xC33707D6);
		c=GG(c,d,a,b,x[k+3], S23,0xF4D50D87);
		b=GG(b,c,d,a,x[k+8], S24,0x455A14ED);
		a=GG(a,b,c,d,x[k+13],S21,0xA9E3E905);
		d=GG(d,a,b,c,x[k+2], S22,0xFCEFA3F8);
		c=GG(c,d,a,b,x[k+7], S23,0x676F02D9);
		b=GG(b,c,d,a,x[k+12],S24,0x8D2A4C8A);
		a=HH(a,b,c,d,x[k+5], S31,0xFFFA3942);
		d=HH(d,a,b,c,x[k+8], S32,0x8771F681);
		c=HH(c,d,a,b,x[k+11],S33,0x6D9D6122);
		b=HH(b,c,d,a,x[k+14],S34,0xFDE5380C);
		a=HH(a,b,c,d,x[k+1], S31,0xA4BEEA44);
		d=HH(d,a,b,c,x[k+4], S32,0x4BDECFA9);
		c=HH(c,d,a,b,x[k+7], S33,0xF6BB4B60);
		b=HH(b,c,d,a,x[k+10],S34,0xBEBFBC70);
		a=HH(a,b,c,d,x[k+13],S31,0x289B7EC6);
		d=HH(d,a,b,c,x[k+0], S32,0xEAA127FA);
		c=HH(c,d,a,b,x[k+3], S33,0xD4EF3085);
		b=HH(b,c,d,a,x[k+6], S34,0x4881D05);
		a=HH(a,b,c,d,x[k+9], S31,0xD9D4D039);
		d=HH(d,a,b,c,x[k+12],S32,0xE6DB99E5);
		c=HH(c,d,a,b,x[k+15],S33,0x1FA27CF8);
		b=HH(b,c,d,a,x[k+2], S34,0xC4AC5665);
		a=II(a,b,c,d,x[k+0], S41,0xF4292244);
		d=II(d,a,b,c,x[k+7], S42,0x432AFF97);
		c=II(c,d,a,b,x[k+14],S43,0xAB9423A7);
		b=II(b,c,d,a,x[k+5], S44,0xFC93A039);
		a=II(a,b,c,d,x[k+12],S41,0x655B59C3);
		d=II(d,a,b,c,x[k+3], S42,0x8F0CCC92);
		c=II(c,d,a,b,x[k+10],S43,0xFFEFF47D);
		b=II(b,c,d,a,x[k+1], S44,0x85845DD1);
		a=II(a,b,c,d,x[k+8], S41,0x6FA87E4F);
		d=II(d,a,b,c,x[k+15],S42,0xFE2CE6E0);
		c=II(c,d,a,b,x[k+6], S43,0xA3014314);
		b=II(b,c,d,a,x[k+13],S44,0x4E0811A1);
		a=II(a,b,c,d,x[k+4], S41,0xF7537E82);
		d=II(d,a,b,c,x[k+11],S42,0xBD3AF235);
		c=II(c,d,a,b,x[k+2], S43,0x2AD7D2BB);
		b=II(b,c,d,a,x[k+9], S44,0xEB86D391);
		a=AddUnsigned(a,AA);
		b=AddUnsigned(b,BB);
		c=AddUnsigned(c,CC);
		d=AddUnsigned(d,DD);
	}
 
	var temp = WordToHex(a)+WordToHex(b)+WordToHex(c)+WordToHex(d);
 
	return temp.toLowerCase();
}

};