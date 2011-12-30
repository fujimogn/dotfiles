// ==UserScript==
// @name           Javascript Library 1
// @namespace      http://userscripts.org/users/28612
// @version        0.03.00
// @description    This is a javascript library, it hasn't to be installed but imported from other scripts with the meta tag require
// @resource       Library1Resources http://www.fileden.com/files/2008/9/2/2077873/JavascriptLibrary/0_3_0/Library1.xml
// @resource       Library1Resources_de http://www.fileden.com/files/2008/9/2/2077873/JavascriptLibrary/0_3_0//Library1_de.xml
// @resource       Library1Resources_es http://www.fileden.com/files/2008/9/2/2077873/JavascriptLibrary/0_3_0/Library1_es.xml
// @resource       Library1Resources_fr http://www.fileden.com/files/2008/9/2/2077873/JavascriptLibrary/0_3_0/Library1_fr.xml
// @resource       Library1Resources_it http://www.fileden.com/files/2008/9/2/2077873/JavascriptLibrary/0_3_0/Library1_it.xml
// ==/UserScript==

/*
var ScriptInfos={
	name: "Library 1",
	version: "0.03.00",
	language: "en",
	idPrefix: "jl"};
*/

//Extending some native objects
if (Array.prototype.clear==null) Array.prototype.clear=function(){this.splice(0,this.length);}
if (Array.prototype.merge==null) Array.prototype.merge=function(array){for(var num1=0;num1<array.length;num1++) this.push(array[num1]);}
if (Array.prototype.remove==null) Array.prototype.remove=function(){for(var num1=0;num1<arguments.length;num1++) {var num2=this.indexOf(arguments[num1]); if (num2!=-1) this.splice(num2,1);} return this.length;}
if (Array.prototype.replace==null) Array.prototype.replace=function(array){for(var num1=0;num1<array.length;num1++) if (this[num1]==null) this[num1]=array[num1]; return this;}
if (String.prototype.beginsWith==null) String.prototype.beginsWith=function(text){return this.indexOf(text)==0;}
if (String.prototype.endsWith==null) String.prototype.endsWith=function(text){return this.lastIndexOf(text)==this.length-text.length;}
if (String.prototype.format==null) String.prototype.format=function(){var a=arguments; if (a.length==1 && typeof(a[0])=="object" && a[0].constructor==Array) a=a[0]; var t=this; for(var num1=0;num1<a.length;num1++) if (a[num1]!=null) t=t.replace(new RegExp("\\{"+num1+"\\}","gm"),a[num1]); return t;}
if (String.prototype.trim==null) String.prototype.trim=function(){return this.replace(/^\s+|\s+$/gm,"");}
//if (HTMLElement.prototype.addClasses==null) HTMLElement.prototype.addClasses=function(){var a=this.className.split(" "); for(var num1=0;num1<arguments.length;num1++) a.push(arguments[num1]); this.className=a.join(" ");}
//if (HTMLElement.prototype.containsClasses==null) HTMLElement.prototype.containsClasses=function(){var a=this.className.split(" "); for (var num1=0;num1<arguments.length;num1++) if (a.indexOf(arguments[num1])==-1) return false; return true;}
//if (HTMLElement.prototype.removeClasses==null) HTMLElement.prototype.removeClasses=function(){var a=this.className.split(" "); for(var num1=0;num1<arguments.length;num1++) a.remove(arguments[num1]); this.className=a.join(" ");}
//if (HTMLElement.prototype.xorClasses==null) HTMLElement.prototype.xorClasses=function(){var a=this.className.split(" "); for(var num1=0;num1<arguments.length;num1++) {var t=arguments[num1]; var num2=a.indexOf(t); if (num2!=-1) a.splice(num2,1); else a.push(t);} this.className=a.join(" ");}

//Quick-functions
function $as(style){document.getElementsByTagName("head")[0].appendChild(this.$ce("style","\n"+style+"\n",{type:"text/css"}));}
function $c(obj){return $iso(obj)?eval(obj.toSource()):obj;}
function $ce(tag,textContent,attributes){var e=document.createElement(tag);if (textContent) e.textContent=textContent; if (attributes) for(var name in attributes) e.setAttribute(name,attributes[name]); return e;}
function $id(element){return $iso(element)?element:document.getElementById(element.toString());}
function $isa(array){return array && array.constructor==Array;}
function $isd(date){return date && date.constructor==Date;}
function $ise(obj){if (!$iso(obj)) return true; if ($isa(obj) && obj.length==0) return true; for(var n in obj) return false; return true;}
function $isf(func){return func && func.contructor==Function;}
function $isn(num){return num!=null && num.constructor==Number;}
function $iso(obj){return obj && typeof(obj)=="object";}
function $ls(script){window.location.replace("javascript:void({0});".format(script));}
function $o2t(obj,regex){return obj?regex?obj.toSource().replace(regex,"$1\n"):obj.toSource():"";}
function $rmc(id,arguments,handler){GM_registerMenuCommand(rmjl1.getText(id,arguments),handler);}
function $t2o(text){return eval(text.replace(/\n/gm,""));}
function $tag(tag,element){if (!element) element=document; return element.getElementsByTagName(tag);}
function $x(xpath,node,xpathResult,doc){if (node==null) node=document;if (xpathResult==null) xpathResult==XPathResult.ORDERED_NODE_SNAPSHOT_TYPE;if (doc==null) doc=document;return doc.evaluate(xpath,node,null,xpathResult,null);}
function $x1(xpath,node,doc){return $x(xpath,node,XPathResult.FIRST_ORDERED_NODE_TYPE,doc).singleNodeValue;}

//Resources Manager
var rmjl1=new ResoucesManager("Library1Resources");
function ResoucesManager(name)
{
	this.name=name;
	this.resources=new Object();
	this.getResourceImage=function(name){if (!this.resources[name])this.resources[name]=GM_getResourceURL(name); return this.resources[name];}
	this.getResourceXml=function(name)
	{
		if (!this.resources[name])
		{
			var text1="<resources/>";
			try{text1=GM_getResourceText(name);}
			catch(e){}
			var xml1=new DOMParser().parseFromString(text1,"text/xml");

			var obj1=new Object();
			var ser1=new XMLSerializer();
			var array1=xml1.wrappedJSObject.getElementsByTagName("resource");

			for(var num1=0;num1<array1.length;num1++)
			{
				var text1="";
				var node1=array1[num1];
				for(var num2=0;num2<node1.childNodes.length;num2++) text1+=ser1.serializeToString(node1.childNodes[num2]);
				text1=text1.trim();
				obj1[node1.getAttribute("id")]=node1.getAttribute("type")=="object"?eval(text1):text1;
			}
			this.resources[name]=obj1;
		}
		return this.resources[name];
	}
	this.getImage=function(name,language){return this.getResourceImage(name+(language?"_"+language:""));}
	this.getResource=function(id,language){var obj1=this.getResourceXml(this.name+(language?"_"+language:""))[id]; if (!obj1) obj1=this.getResourceXml(this.name)[id]; if (obj1==null) throw "'{0}' resource not found".format(id); return $c(obj1);}
	this.getText=function(id,parameters){var text1=this.getResource(id,ScriptInfos.language).toString(); return parameters?text1.format(parameters):text1;}
	this.getObject=function(id){return this.getResource(id,ScriptInfos.language);}
	this.getHTMLTexts=function(id,parameters){return this.getText("{0}HTML".format(id),this.getObject("{0}Texts".format(id)).replace(parameters?parameters:[ScriptInfos.idPrefix]));}
}

//Decode HTML
function decodeHTML(text)
{
	var array1=[["&quot;","\""],["&#34;","\""],["&apos;","'"],["&#39;","'"],["&lt;","<"],["&#60;","<"],["&gt;",">"],["&#62;",">"],["&nbsp;"," "],["&#160;"," "],["&amp;","&"],["&#38;","&"]];
	for(var num1=0;num1<array1.length;num1++) text=text.replace(new RegExp(array1[num1][0],"gmi"),array1[num1][1]);
	return text;
}

//Add  Styles
function addHiddenStyle()
{
	if (!ScriptInfos.addedHiddenStyle)
	{
		ScriptInfos.addedHiddenStyle=true;
		$as(rmjl1.getText("HiddenStyle"));
	}
}

function addNoPaddedListStyle()
{
	if (!ScriptInfos.addedNoPaddedListStyle)
	{
		ScriptInfos.addedNoPaddedListStyle=true;
		$as(rmjl1.getText("NoPaddedListStyle"));
	}
}

//Add Modal Div
function addModalDiv(clickHandler)
{
	var div1=$id("{0}ModalDiv".format(ScriptInfos.idPrefix));
	if (div1==null)
	{
		ScriptInfos.addedModalDiv=true;
		addHiddenStyle();
		$as(rmjl1.getText("ModalDivStyle",ScriptInfos.idPrefix));
		div1=stringToHTML(rmjl1.getHTMLTexts("ModalDiv",[ScriptInfos.idPrefix]));
		document.body.appendChild(div1);
		if (clickHandler) div1.addEventListener("click",clickHandler,false);
	}
	return div1;
}

//Get Request
function sendGetRequest(url,handler,mimeType,headers)
{
	//GM_log("Requested url: "+url);
	if (!headers) headers=new Object();
	if (!headers["User-agent"]) headers["User-agent"]="Mozilla/5.0 (Compatible) GreaseMonkey";
	if (!headers["Accept"]) headers["Accept"]="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
	
	GM_xmlhttpRequest({
   		method: "GET",
		url: url,
		headers: headers,
		overrideMimeType: mimeType,
		onload: handler });
}

//String to HTML
function stringToHTML(html)
{
	var div1=$id("HiddenDivStringToHtml");
	if (div1==null)
	{
		div1=$ce("div",null,{id:"HiddenDivStringToHtml",style:"display:none;visibility:hidden;position:absoulte;top:-1000px;left:-1000px;"});
		document.body.appendChild(div1);
	}
	div1.innerHTML=html;
	var element1=div1.firstChild;
	div1.removeChild(element1);
	return element1;
}

//Debug Regexp
function debugRegexp(exp,text)
{
	do
	{
		var match1="";
		try{match1=new RegExp(exp).exec(text);}
		catch(exception){match1=exception.message;}
		//exp=prompt(text+"\n\n"+(match1?match1:"<null>"),exp);
		if (match1 && $isa(match1)) match1.splice(0,1);
		exp=prompt(match1?match1:"<null>",exp);
	} while(exp)
}

//Set, Get, Delete Cookie
//Cookie object {name:null,value:null,expires:null,path:null,host:null,domain:null,secure:null}
function setCookie(cookie) 
{
	var array1=new Array();
	array1.push("{0}={1}".format(cookie.name,cookie.value!=null?cookie.value:""));
	if (cookie.expires) 
	{
		var obj1=cookie.expires;
		if ($isn(obj1)) obj1=new Date(new Date().getTime()+(obj1*24*60*60*1000));
		array1.push("expires={0}".format($isd(obj1)?obj1.toGMTString():obj1));
	}
	if (cookie.path) array1.push("path={0}".format(cookie.path)); 
	if (cookie.host) array1.push("host={0}".format(cookie.host));
	else if (cookie.domain) array1.push("domain={0}".format(cookie.domain));
	if (cookie.secure) array1.push("secure={0}".format(cookie.secure));
	
	var text1=array1.join(";");
	try{document.cookie=text1;}
	catch(exception){GM_log("Error setting cookie: {0}\nLocation: {1}\nNew cookie: {2}\nBrowser cookies: {3}".format(exception.message,location,text1,document.cookie));}
}

function getAllCookies()
{
	var match1=null;
	var array1=new Array();
	var text1=document.cookie;
	var regex1=/(\w+)=(.*?)(?:;|$)\s*/g;
	while(match1=regex1.exec(text1)) array1.push({name:match1[1],value:match1[2]});
	return array1;
}

function getCookie(name)
{
	var match1=new RegExp("(?:^|;\\s+)("+name+")=(.*?)(?:;|$)","gmi").exec(document.cookie);
	return match1?{name:match1[1],value:match1[2]}:null;
}

function deleteCookie(cookie)
{
	if (!cookie.host && ! cookie.domain) cookie.host=location.hostname;
	if (!cookie.expires) cookie.expires="Thu, 01-Jan-1970 00:00:00 GMT";
	
	setCookie(cookie);
	if (!getCookie(cookie.name)) return true;
	
	var text1=cookie.host?cookie.host:cookie.domain;
	var num1=text1.indexOf(".");
	var num2=text1.lastIndexOf(".");
	
	if (num1 && num1!=num2)
	{
		text1=text1.substring(num1+1);
		if (cookie.host) cookie.host=text1;
		else cookie.domain=text1;
	}
	else if (!cookie.path) 
	{
		if (cookie.host) cookie.host=location.hostname;
		else cookie.domain=location.hostname;
		cookie.path=location.pathname;
	}
	else if (cookie.host)
	{
		cookie.domain=location.hostname;
		cookie.host=null;
		cookie.path=null;
	}
	else return false;
	
	return deleteCookie(cookie);
}

//Set and Get Object
function getObject(key)
{
	var obj=GM_getValue(key);
	return obj?eval(obj):obj;
}

function setObject(key,obj)
{
	GM_setValue(key,obj?obj.toSource():obj);
}

//Accordion
function Accordion(element,radioBehaviour,selectedClass,animatioSpeed,intervalMs,headerIdPrefix,contentIdPrefix,headerTag,contentTag)
{
	this.headerClick=function(e)
	{
		var a=window[e.target.getAttribute("AccordionId")];
		if (a.radioBehaviour) a.closeAllContents();
		a.switchContent(a.headers.indexOf(e.target.id));
		
	}
	this.closeAllContents=function()
	{
		for(var num1=0;num1<this.contents.length;num1++) 
		{
			if (this.opening[num1]) this.switchContent(num1);
		}
	}
	this.switchContent=function(index)
	{
		if (this.animation[index]) this.opening[index]=!this.opening[index];
		else
		{
			this.animation[index]=true;
			var e1=$id(this.contents[index]);
			e1.style.overflow="hidden";
			this.opening[index]=e1.style.display=="none";
			if (this.opening[index]) 
			{
				e1.style.height="0px";
				e1.style.display="";
			}
		}
		if (!this.intervalId) this.intervalId=setInterval(function(accordion){accordion.animate();},this.intervalMs,this);
	}
	this.animate=function()
	{
		var flag1=false;
		for(var num2=0;num2<this.animation.length;num2++)
		{
			if (!this.animation[num2]) continue;
			var flag2=this.opening[num2];
			var e1=$id(this.contents[num2]);
			var num3=e1.offsetHeight;
			var num4=e1.firstChild.offsetHeight;
			var num5=Math.round((flag2?num4-num3:num3)/this.animationSpeed);
			if (num5<1) num5=1;
			var num6=flag2?num3+num5:num3-num5;
			if ((flag2 && num6>=num4) || (!flag2 && num6<=0))
			{
				this.animation[num2]=false;
				e1.style.height="";
				e1.style.overflow="";
				e1.style.opacity="";
				if (!flag2) e1.style.display="none";
			}
			else 
			{
				flag1=true;
				e1.style.height=num6+"px";
				e1.style.opacity=num6/num4;
			}
		}
		if (!flag1) 
		{
			clearInterval(this.intervalId);
			this.intervalId=null;
		}
	}
	
	if (!headerTag) headerTag="a";
	if (!contentTag) contentTag="div";
	if (!headerIdPrefix) headerIdPrefix="header";
	if (!contentIdPrefix) contentIdPrefix="content";
	
	this.intervalId=null;
	this.selectedClass=selectedClass;
	this.intervalMs=intervalMs?intervalMs:100;
	this.animationSpeed=animatioSpeed?animatioSpeed:5;
	
	this.opening=new Array();
	this.headers=new Array();
	this.contents=new Array();
	this.animation=new Array();
	this.container=$id(element);
	window[this.container.id]=this;
	this.radioBehaviour=radioBehaviour?radioBehaviour:false;

	var array1=$tag(headerTag,this.container);
	for(var num2=0;num2<array1.length;num2++)
	{
		var e1=array1[num2];
		if (e1.id.beginsWith(headerIdPrefix)) 
		{
			this.headers.push(e1.id);
			e1.setAttribute("AccordionId",this.container.id.toString());
			e1.addEventListener("click",this.headerClick,false);
		}
	}
	var array2=$tag(contentTag,this.container);
	for(var num3=0;num3<array2.length;num3++)
	{
		var e2=array2[num3];
		if (e2.id.beginsWith(contentIdPrefix)) 
		{
			this.contents.push(e2.id);
			this.opening.push(false);
			this.animation.push(false);
			e2.style.height="0px";
			e2.style.display="none";
			e2.style.overflow="hidden";
		}
	}
	this.headers.sort();
	this.contents.sort();
}

//Forms functions
function setFormValues(form,values,handler)
{
	for(var num1=0;num1<form.elements.length;num1++)
	{
		var element1=form.elements[num1];
		var obj1=values[element1.name];
		if (handler!=null) obj1=handler(form,element1,obj1);
		if (obj1!=null)
		{
			switch(element1.type)
			{
				case "button":
				case "file":
				case "image":
				case "reset":
				case "submit":
					break;
				case "checkbox":
				case "radio":
					element1.checked=$isa(obj1)?obj1.indexOf(element1.value)!=-1:obj1==element1.value;
					break;
				case "select-multiple":
					//not implemented yet
					break;
				default:
					element1.value=obj1;
					break;
			}
		}
	}
	if (handler!=null) 
	{
		for (var name1 in values)
		{
			if ($x1("//*[@name='"+name1+"']",form)==null) handler(form,name1,values[name1]);
		}
	}
}

function getFormValues(form,handler)
{
	var obj1=new Object();
	for(var num1=0;num1<form.elements.length;num1++)
	{
		var element1=form.elements[num1];
		var text1=element1.value;
		switch(element1.type)
		{
			case "button":
			case "image":
			case "file":
			case "reset":
			case "submit":
				text1=null;
				break;
			case "checkbox":
			case "radio":
				if (!element1.checked) text1=null;
				break;
			case "select-multiple":
				//not implemented yet
				break;
			default:
				break;
		}
		if (handler!=null) text1=handler(element1,text1);
		if (text1!=null) 
		{
			var text2=element1.name;
			var obj2=obj1[text2];
			if (obj2==null) obj1[text2]=text1;
			else
			{
				if (typeof(obj2)=="string")
				{
					obj1[text2]=new Array();
					obj1[text2].push(obj2);
				}
				obj1[text2].push(text1);
			}
		}
	}
	return obj1;
}

function formValuesToString(values)
{
	var array1=new Array();
	for (var name1 in values)
	{
		var obj1=values[name1];
		if ($isa(obj1))
		{
			var array2=new Array();
			for (var num1=0;num1<obj1.length;num1++) array2.push(encodeURIComponent(obj1[num1]));
			obj1=array2.join(",");
		}
		else obj1=encodeURIComponent(obj1);
		array1.push(encodeURIComponent(name1)+"="+obj1);
	}
	return array1.join("&");
}

//Updater
function Updater(id,name,idPrefix,xpath)
{
	this.id=id;
	this.name=name;
	this.idPrefix=idPrefix;
	this.uniqueId=idPrefix+id;
	this.actualVersion="00.00.00";
	this.newVersionDays=1;
	this.newVersionValueName="NewVersionLastCheck_{0}".format(id);
	this.newVersionXPath=xpath?xpath:"//body";
	this.newVersionStyle="";
	this.homepageUrl="http://userscripts.org/scripts/show/{0}".format(id);
	this.metaDataUrl="http://userscripts.org/scripts/source/{0}.meta.js".format(id);
	this.sourceUrl="http://userscripts.org/scripts/review/{0}".format(id);
	this.installUrl="http://userscripts.org/scripts/source/{0}.user.js".format(id);
	this.installHandler=null;
	
	this.checkForNewVersion=function(handler,ignoreElapsedTime)
	{
		if (ignoreElapsedTime || this.checkElapsedTime()) 
		{
			var callback=function(context,handler){var obj=context; var hand=handler; return function(response){obj.checkForNewVersionCallBack(hand,response);}}(this,handler);
			sendGetRequest(this.metaDataUrl,callback);
		}
	}
	
	this.checkForNewVersionCallBack=function(handler,response)
	{
		this.setLastCheckDate();
		handler(this,this.newVersionAvailable(response.responseText),response);
	}
			
	this.setLastCheckDate=function()
	{
		this.lastNewVersionCheckDate=new Date();
		GM_setValue(this.newVersionValueName,this.lastNewVersionCheckDate.toString());
	}
	
	this.addNewVersionHTMLStyle=function(updater)
	{
		if (!updater.addedNewVersionHTMLStyle)
		{
			updater.addedNewVersionHTMLStyle=true;
			$as(rmjl1.getText("NewVersionStyle",[updater.uniqueId]));
		}
	}
	
	this.newVersionHTML=function(updater,newVersionAvailable,response)
	{
		if (!newVersionAvailable) return;
		
		var element1=$x1(updater.newVersionXPath);
		if (element1==null) element1=$x1("//body");
		if (element1==null) {updater.newVersionDialog(response); return;}
		
		addHiddenStyle();
		addNoPaddedListStyle();
		if (!updater.newVersionStyle) updater.addNewVersionHTMLStyle(updater);
		
		var array1=new Array();
		array1[0]=updater.uniqueId;
		array1[1]=updater.newVersionStyle;
		array1[5]=updater.installUrl;
		array1[7]=$isf(updater.installHandler)?"return false;":"";
		array1[12]=updater.homepageUrl;
		array1[14]=updater.name;
		array1[17]=updater.newVersion;
		array1[19]="<ul class=\"noPaddedList\"><li>"+updater.newVersionChanges.join("</li>\n<li>")+"</li></ul>";
		
		var div1=stringToHTML(rmjl1.getHTMLTexts("NewVersion",array1));
		element1.insertBefore(div1,element1.firstChild);
		
		$id("{0}Close".format(updater.uniqueId)).addEventListener("click",function(){updater.hideNewVersionHTML();},false);
		$id("{0}Install".format(updater.uniqueId)).addEventListener("click",function(){if ($isf(updater.installHandler)) return updater.installHandler(updater,true,response); else updater.hideNewVersionHTML(true);},false);
		$id("{0}More".format(updater.uniqueId)).addEventListener("click",function(){updater.showChanges();},false);
	}
	
	this.hideNewVersionHTML=function(reload)
	{
		var div1=$id("{0}NewVersionPanel".format(this.uniqueId));
		if (div1!=null) div1.parentNode.removeChild(div1);
		if (reload) this.showNewVersionReloadHTML(this);
	}
	
	this.showNewVersionReloadHTML=function(updater)
	{
		var element1=$x1(updater.newVersionXPath);
		if (element1==null) element1=$x1("//body");
		
		if (!updater.newVersionStyle) updater.addNewVersionHTMLStyle(updater);
		
		var div1=stringToHTML(rmjl1.getHTMLTexts("NewVersionReload",[updater.uniqueId,updater.newVersionStyle]));
		element1.insertBefore(div1,element1.firstChild);
		
		$id("{0}Close".format(updater.uniqueId)).addEventListener("click",function(){updater.hideNewVersionHTML();},false);
	}

	this.showChanges=function()
	{
		var div1=$id("{0}Changes".format(this.uniqueId));
		if (div1!=null) div1.className=div1.className==""?"hidden":"";
	}
	
	this.newVersionDialog=function(updater,newVersionAvailable,response)
	{
		var text1=rmjl1.getText("NewVersionDialog_"+newVersionAvailable,[updater.name,updater.actualVersion,updater.newVersion,"- "+updater.newVersionChanges.join("\n- ")]);
		if (!newVersionAvailable) alert(text1);
		else if (confirm(text1)) 
		{
			if ($isf(updater.installHandler)) updater.installHandler(updater,true,response);
			else
			{
				ScriptInfos.timeoutId=setTimeout(updater.newVersionDialogReload,5000,updater);
				location.replace(updater.installUrl);
			}
		}
	}

	this.newVersionDialogReload=function(updater)
	{
		try
		{
			if (ScriptInfos.timeoutId) clearTimeout(ScriptInfos.timeoutId);
			if (confirm(rmjl1.getText("NewVersionDialogReload"))) location.reload(true);
		}
		catch(ex){ScriptInfos.timeoutId=setTimeout(updater.newVersionDialogReload,1000);}
	}
	
	this.checkElapsedTime=function()
	{
		if (this.newVersionDays<0) return false;
		try
		{
			this.lastNewVersionCheckDate=new Date(GM_getValue(this.newVersionValueName,null));
			var num1=this.lastNewVersionCheckDate.getTime();
			var num2=new Date().getTime();
			var num3=1000*60*60*24*this.newVersionDays;
			return num2-num1>num3;
		}
		catch(ex){}
		return true;
	}

	this.newVersionAvailable=function(responseText)
	{
		this.newVersion=new Version(this.getVersion(responseText,"99.99.99"));
		this.newVersionChanges=new RegExp("changes(.*)","gmi").test(responseText)?RegExp.$1.trim().split(","):new Array();
		return this.actualVersion.compareTo(this.newVersion)==-1;
	}

	this.getVersion=function(text,defaultValue)
	{
		return new RegExp("version.*?((?:\\.|\\d)+)","gmi").test(text)?RegExp.$1:defaultValue;
	}
}

//Version
function Version(major,minor,review)
{
	if (typeof(major)=="string")
	{
		var array1=major.split(".");
		major=array1.length>0?parseInt(array1[0]):0;
		minor=array1.length>1?parseInt(array1[1]):0;
		review=array1.length>2?parseInt(array1[2]):0;
	}
	this.major=major;
	this.minor=minor;
	this.review=review;
	
	this.toString=function(){return "{0}.{1}.{2}".format(this.major,this.minor,this.review);}
	this.compareTo=function(version)
	{
		if (this.major!=version.major) return this.major<version.major?-1:1;
		if (this.minor!=version.minor) return this.minor<version.minor?-1:1;
		if (this.review!=version.review) return this.review<version.review?-1:1;
		return 0;
	}
}