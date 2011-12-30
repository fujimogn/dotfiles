// ==UserScript==
// @name           CursedTumblr
// @namespace      luft2501.chicappa.jp
// @description    installs additional keyboard operation to tumblr ver.2
// @include        *
// @require        http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js
// ==/UserScript==
//　

//----------------------------------------------------------------
// Common Vars/Functions.
//----------------------------------------------------------------

/*
 * Application Settings Values.
 */
var Settings = {
	urlType:		'home', 
	username:		'', 
	myDomain:		false
};

/*
 * Judge URL types.
 */
function judgeUrlTypes(url) {
	if (url == undefined) url = location.href;
	var p = location.protocol;
	var d = 'www.tumblr.com';
	var urlType = '';
	
	// acquire username.
	if (url.indexOf(p+'//'+d) != -1) {
		/*
		var linkToMyDomain = $('ul.dashboard_subpages > li:first > a');
		if (linkToMyDomain.length == 1) {
			Settings.username = getSubDomain(linkToMyDomain.attr('href'));
		}
		*/
		var linkToMyDomain = $('ul#user_channels > li:first > a');
		if (linkToMyDomain.length == 1) {
			var parts = linkToMyDomain.attr('href').split('/');
			Settings.username = parts[2];
		}
		Settings.myDomain = true;
	} else {
		// outside tumblr.
	}
	
	if (url.indexOf(p+'//'+d+'/dashboard') != -1
	 || url.indexOf(p+'//'+d+'/likes') != -1) {
		urlType = 'dashboard';
	} else if (url.indexOf(p+'//'+d+'/new') != -1) {
		urlType = 'new';
	} else if (url.indexOf(p+'//'+d+'/share') != -1) {
		urlType = 'share';
	} else if (url.indexOf(p+'//'+d+'/reblog') != -1) {
		urlType = 'reblog';
	} else if (url == p+'//'+d+'/tumblelog/'+Settings.username) {
		urlType = 'tumblelog';
	} else if (url == p+'//'+d+'/blog/'+Settings.username) {
		urlType = 'tumblelog';
	} else if (url.indexOf(p+'//'+d+'/messages') != -1
			|| url.indexOf(p+'//'+d+'/tumblelog/'+Settings.username+'/messages') != -1) {
		urlType = 'messages';
	} else if (url.indexOf(p+'//'+d+'/drafts') != -1
			|| url.indexOf(p+'//'+d+'/tumblelog/'+Settings.username+'/drafts') != -1) {
		urlType = 'drafts';
	} else if (url.indexOf(p+'//'+d+'/queue') != -1
			|| url.indexOf(p+'//'+d+'/tumblelog/'+Settings.username+'/queue') != -1) {
		urlType = 'queue';
	} else if (url.indexOf('.tumblr.com/') != -1) {
		urlType = 'post';
	} else {
		urlType = 'others';
	}

	return urlType;
}

/*
 * Retrieve subdomain name.
 */
function getSubDomain(url) {
	var parts = url.split('/');
	var domainParts = parts[2].split('.');
	
	return domainParts[0];
}

/*
 * Acquire view parts.
 */
var View = {
	posts:	null,	// array of node object of post.
	ix:		-1		// index of focused post.
};

// shortcut to get focused post.
function currentPost() {
	return View.posts[View.ix];
}

function prevPost() {
	return View.posts[View.ix - 1];
}

function nextPost() {
	return View.posts[View.ix + 1];
}

/*
 * Check active element to prevent firing keyboard shortcut when input focused.
 */
function checkActiveElement() {
	return document.activeElement.nodeName == 'INPUT' || document.activeElement.nodeName == 'TEXTAREA' ? true : false;
}

/*
 * Send click to node.
 */
function sendClick(node) {
	if (!node) return false;
	
	var mev = document.createEvent('MouseEvents');
	mev.initEvent('click', true, true);
	node.dispatchEvent(mev);
}

/*
 * Judge node type.
 */
function judgeNodeType(node) {
	var nodeType = '';
	var postId = node.id.substr(4);	// "_nnnnnnnn"

	try {
		if ($(node).attr('class').indexOf('notification') != -1) {
			nodeType = 'notification';
		} else if ($(node).attr('class').indexOf('is_mine') != -1) {
			nodeType = 'myPost';
		} else if ($(node).attr('class').indexOf('post') != -1) {
			if ($(node).attr('class').indexOf('regular') != -1) {
				nodeType = 'regular';
			} else if ($(node).attr('class').indexOf('photo') != -1) {
				nodeType = 'photo';
			} else if ($(node).attr('class').indexOf('quote') != -1) {
				nodeType = 'quote';
			} else if ($(node).attr('class').indexOf('link') != -1) {
				nodeType = 'link';
			} else if ($(node).attr('class').indexOf('chat') != -1) {
				nodeType = 'chat';
			} else if ($(node).attr('class').indexOf('video') != -1) {
				nodeType = 'video';
			}

			if ($('#post'+postId).length > 0
			 && $('#post'+postId+' > div[class="post_info"]').length > 0
			 && $('#post'+postId+' > div[class="post_info"]').length > 0) {
				if ($('#post'+postId+' > div[class="post_info"]')[0].innerHTML.indexOf('reblogged you:') != -1
				 || ($('#post'+postId+' > div[class="post_content"]')[0].innerHTML.indexOf(Settings.username) != -1 && Settings.myDomain)) {
					nodeType = 'reblogged';
				}
			}
		}
	} catch(e) {
		alert(e.message);
		nodeType = 'exception';
	}

	return nodeType;
}

/*
 * Tweaks for node.
 */
function processNode(node) {
	var postId = node.id.substr(4);	// "_nnnnnnnn"
	var nodeType = judgeNodeType(node);
	
	if (nodeType != 'notification' && node.id.indexOf('post_') != -1) {
		// push post to array and make a little bit hazy.
		View.posts.push(node);
		$(node).css('opacity', '0.85');

		node.addEventListener("click", function(ev){
			// focus clicked post.
			var tgt = ev.target;
			for (p = 0; p < View.posts.length; p++) {
				if (tgt.id == View.posts[p].id) {
					if (currentPost() != undefined) resetColorPost(currentPost().id);
					View.ix = p;
					colorPost(tgt.id);
					break;
				}
			}
		}, false);
	}

	switch (nodeType) {
	case 'notification': 
		// coloring notifications.
		if (node.innerHTML.indexOf('reblogged') != -1) {
			$(node).css('background-color', 'black');
			$(node).children('div.nipple').css('border-right', '6px solid black');
			$(node).children('div.border').css('border-right', '7px solid black');
		}
		if (node.innerHTML.indexOf('following') != -1) {
			$(node).css('background-color', 'darkblue');
			$(node).children('div.nipple').css('border-right', '6px solid darkblue');
			$(node).children('div.border').css('border-right', '7px solid darkblue');
		
		}
		break;
	case 'myPost': 
		// hide and make hazy posts by myself.
		if (Settings.urlType != 'tumblelog') {
			$('#post'+postId+' > div[class="post_content"]').hide('fast');
			$('#post'+postId+' > div > img').hide('fast');
			// TODO other effect $('#post'+postId).animate({opacity: 1}, 'fast');
		}
		break;
	case 'reblogged': 
		break;
	case 'regular': 
		break;
	case 'photo': 
		break;
	case 'quote': 
		break;
	case 'link': 
		break;
	case 'chat': 
		break;
	case 'video': 
		break;
	}
}

/*
 * Tweaks for document at first load.
 */
function processNodeDoc() {
	var items = document.evaluate('.//li', document, null, 7, null);
	for (var i = 0; i < items.snapshotLength; i++) {
		item = items.snapshotItem(i);
		processNode(item);
	}
}

/*
 * Color focused post.
 */
function colorPost(id) {
	$('#'+id).animate({opacity: 1}, 'fast');
	$('#'+id).css('box-shadow', '3px 3px 3px #ccc');
}

/*
 * Reset blured post.
 */
function resetColorPost(id) {
	$('#'+id).animate({opacity: 0.85}, 'fast');
	$('#'+id).css('box-shadow', 'none');
}

/*
 * View tweaks for dashboard.
 */
function viewTweaksDashboard() {
	$('#right_column').append(
		'<div id="CT-key-guide" class="dashboard_nav_item short">'
			+'<span class="icon" '
			+'style="'
			+'background-position: -300px -60px;'
			+'height: 16px;'
			+'margin-right: 6px;'
			+'vertical-align: -5px;'
			+'width: 16px;'
			+'"></span>'
			+'cursedtumblr key guide.'
			+'<div id="CT-key-guide-content"' 
				+'style="'
				+'margin: 4px 0 4px 20px;'
				+'font-size: smaller;'
				+'">'
				+'[0] back to top.<br/>'
				+'[c] like and reblog.<br/>'
				+'[d] dsbd top and reload.<br/>'
				+'[h] toggle photo res.<br/>'
				+'[i] focused post scroll into view.<br/>'
				+'[j] focus next post.<br/>'
				+'[k] focus prev post.<br/>'
				+'[m] toggle like/unlike.<br/>'
				+'[o] open permalink.<br/>'
				+'[s] open source link.<br/>'
				+'[t] reblog directly.<br/>'
				+'[q] queue directly.<br/>'
				+'[T] open reblog page.<br/>'
				+'[v] open video inline.<br/>'
				+'[x] toggle display post.<br/>'
				+'and, click a corner of post to focus it.'
			+'</div>'
		+'</div>'
	);
}

/*
 * View tweaks for reblog page.
 */
function viewTweaksReblog() {
	if ($('#post_one').length > 0) setTimeout(function(){$('#post_one')[0].blur();}, 1000);
	
	$('#edit_post_controls').append(
		'<div id="CT-key-guide" class="advanced_option">'
			+'cursedtumblr key guide.<br/>'
			+'<div id="CT-key-guide-content" style="margin-left: 8px;">'
				+'[c] Create/Reblog post<br/>'
				+'[q] Queue post (directly)<br/>'
				+'[t] Toggle [send to twitter]<br/>'
				+'[g] Focus [tags]<br/>'
			+'</div>'
		+'</div>'
	);
}

/*
 * View tweaks for share window.
 */
function viewTweaksShare() {
	$('div#container').height(558);
	$('div#container > form').width(600);
	$('div#container > form > input.text').width(594);
	$('textarea#regular_post_two').width(594);
	$('textarea#regular_post_two').height(324);
	$('div#container > form > div#img_container').height(198);
	$('textarea#photo_post_two').width(594);
	$('label#source_url_confirm_photo').width(562);
	$('textarea#quote_post_one').width(594);
	$('textarea#quote_post_one').height(248);
	$('textarea#quote_post_two').width(594);
	$('textarea#quote_post_two').height(36);
	$('label#source_url_confirm_quote').width(562);
	$('textarea#link_post_one').width(594);
	$('textarea#link_post_three').width(594);
	$('textarea#link_post_three').height(220);
	$('textarea#chat_post_two').width(594);
	$('textarea#chat_post_two').height(286);
	$('label#source_url_confirm_chat').width(562);
	$('textarea#video_post_one').width(594);
	$('textarea#video_post_one').height(183);
	if ($('div#container > form#video_form > img').length > 0) {
		var imgWidth = $('div#container > form#video_form > img:first').width();
		$('div#container > form#video_form > div:first').width(594 - imgWidth - 16);
		$('textarea#video_post_two').width(594 - imgWidth - 22);
	} else {
		$('textarea#video_post_two').width(594);
	}
	$('label#source_url_confirm_video').width(562);
	
	$('div#advanced > div:last').width(600);
	$('div#advanced > div:last > div.option').width(370);
	$('#post_date').width(340);
	$('#post_tags').width(340);
	$('#post_slug').width(300);
	$('#post_controls').css('top', '592px');
	
	$('div#advanced_bar').after(
		'<div id="CT-key-guide" style="'
			+'margin: 16px 0 0 6px;'
			+'font-size: smaller;'
			+'">'
			+'<strong>cursedtumblr key guide.</strong><br/>'
			+'<strong>[spacebar]</strong> toggle Advanced bar | '
			+'<strong>[T]</strong> focus Text tab | '
			+'<strong>[P]</strong> focus Photo tab | '
			+'<strong>[Q]</strong> focus Quote tab | '
			+'<strong>[L]</strong> focus Link tab | '
			+'<strong>[C]</strong> focus Chat tab | '
			+'<strong>[V]</strong> focus Video tab | '
			+'<strong>[t]</strong> toggle [send to Twitter] | '
			+'<strong>[c]</strong> Create post | '
			+'<strong>[b]</strong> reduce &lt;br/&gt; tags half'
		+'</div>'
	);
}

/*
 * Powered [Share on Tumblr]
 */
function poweredSot() {
	var d = document,
	w = window,
	e = w.getSelection,
	k = d.getSelection,
	x = d.selection,
	s = (e?e().toString():(k)?k():(x?x.createRange().text:0)),
	f = 'http://www.tumblr.com/share',
	l = d.location,
	e = encodeURIComponent;
	
	s = s.replace(/\r\n/g, "<br />\n");
	s = s.replace(/(\n|\r)/g, "<br />\n");
	
	var p = '?v=3&u='+e(l.href)+'&t='+e(d.title)+'&s='+e(s),
	u = f+p;

	try {
		if(!/^(.*\.)?tumblr[^.]*$/.test(l.host)) throw(0);
		tstbklt();
	} catch(z) {
		a = function(){
			if(!w.open(u,'t','toolbar=0,resizable=0,status=1,width=640,height=640')) alert('popup blocked.');//l.href=u;
		};
		
		if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);
		else a();
	}
	
	void(0);
}

/*
 * Toggle like/unlike on dashboard.
 */
function toggleLike() {
	var likeButtonId = 'like_button_'+currentPost().id.substr(5);
	sendClick($('#'+likeButtonId)[0]);
}

/*
 * Reblog directly on dashboard.
 */
function reblog(queue) {
	var targetLink = $('#'+currentPost().id+' > div.post_controls > a[href*="reblog"]');
	var reblogUrl = targetLink.attr('href');
	var indicatorId = 'reblog_indicator_'+currentPost().id.substr(5);
	var sign = queue ? 'queue' : 'reblog';
	
	$('#'+currentPost().id+' > div.post_controls > a:first').before('<span id="'+indicatorId+'"></span>');
	
	// reblog indication.
	var reblogIndicator = setInterval(function(){
		switch ($('#'+indicatorId).text()) {
		case '': 
			$('#'+indicatorId).text('[ '+sign+' .../ ]');
			break;
		case '[ '+sign+' .../ ]':
			$('#'+indicatorId).text('[ '+sign+' ...- ]');
			break;
		case '[ '+sign+' ...- ]': 
			$('#'+indicatorId).text('[ '+sign+' ...\\ ]');
			break;
		case '[ '+sign+' ...\\ ]': 
			$('#'+indicatorId).text('[ '+sign+' .../ ]');
			break;
		}
	}, 200);
	
	GM_xmlhttpRequest({
		method: 'GET', 
		url: reblogUrl, 
		onerror: function(){
			clearInterval(reblogIndicator);
			$('#'+indicatorId).text('[ '+sign+' failed. ]');
		}, 
		onload: function(x){
			var elements = $(x.responseText);
			var targetForm;
			var targetFormAction;
			var targetFormEnctype;
			elements.find('form#edit_post').each(function(ix, f){
				targetForm = f;
				targetFormAction = f.action;
			});
			
			var formdata = new Array();
			$(targetForm).find('input').each(function(ix, i){
				if (i.name != 'preview_post' && i.name != 'send_to_twitter') {
					formdata.push(encodeURIComponent(i.name));
					formdata.push('=');
					formdata.push(encodeURIComponent(i.value));
					formdata.push('&');
				}
			});
			$(targetForm).find('textarea').each(function(ix, i){
				if (i.name != 'preview_post' && i.name != 'send_to_twitter') {
					formdata.push(encodeURIComponent(i.name));
					formdata.push('=');
					formdata.push(encodeURIComponent(i.value));
					formdata.push('&');
				}
			});
			if (queue) {
				formdata.push(encodeURIComponent('post[state]'));
				formdata.push('=');
				formdata.push(encodeURIComponent('2'));
				formdata.push('&');
			} else {
				formdata.push(encodeURIComponent('post[state]'));
				formdata.push('=');
				formdata.push(encodeURIComponent('0'));
				formdata.push('&');
			}
			
			var postfields = formdata.join('');
			
			GM_xmlhttpRequest({
				method: 'POST', 
				url: targetFormAction, 
				data: postfields, 
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				}, 
				onerror: function(){
					clearInterval(reblogIndicator);
					$('#'+indicatorId).text('[ '+sign+' failed. ]');
				}, 
				onload: function(){
					GM_log('reblog done? ('+currentPost().id+')');
					clearInterval(reblogIndicator);
					$('#'+indicatorId).text('[ '+sign+' done. ]');
				}
			});
		}
	});
}

/*
 * Queue directly on dashboard.
 */
function queue() {
	reblog(true);
}

//----------------------------------------------------------------
// Boot Sequence.
//----------------------------------------------------------------

function boot(ev) {
	/*
	 * keyboard navigations [dashboard/likes]
	 */
	function keyboardNavigations(ev) {
		if (checkActiveElement()) return false;
		
		switch (ev.keyCode) {
		// [0]--------------------------------
		case 48:
			resetColorPost(currentPost().id);
			View.ix = -1;
			break;
		// [c]--------------------------------
		case 67: 
			// like and reblog.
			toggleLike();
			reblog();
			break;
		// [d]--------------------------------
		case 68:
			// go to top of dashboard and reload.
			$('html,body').animate({ scrollTop: 0 }, 'fast', function(){
				$('div.selection_nipple').fadeTo('fast', 0);
				$('div#content').fadeTo('fast', 0, function(){location.href = '/dashboard';});
			});
			break;
		// [h]--------------------------------
		case 72:
			// toggle photo resolution.
			$('#'+currentPost().id+' > div.post_content').find('img').each(function(ix, img){
				sendClick(img);
			});
			break;
		// [i]--------------------------------
		case 73:
			// focused post scrolls into view.
			if (currentPost() != undefined) currentPost().scrollIntoView(true);
			break;
		// [j]--------------------------------
		case 74:
			// focus next post.
			View.ix++;
			if (currentPost() != undefined) colorPost(currentPost().id);
			if (prevPost() != undefined) resetColorPost(prevPost().id);
			break;
		// [k]--------------------------------
		case 75:
			// focus prev post.
			if (View.ix > 0) View.ix--;
			if (currentPost() != undefined) colorPost(currentPost().id);
			if (nextPost() != undefined) resetColorPost(nextPost().id);
			break;
		// [l]--------------------------------
		case 76:
			// go to my tumblelog.
			location.href = 'http://www.tumblr.com/blog/'+Settings.username;
			break;
		// [m]--------------------------------
		case 77:
			// toggle like/unlike post.
			toggleLike();
			break;
		// [o]--------------------------------
		case 79: 
			// open permalink in new tab.
			var permalinkButtonId = 'permalink_'+currentPost().id.substr(5);
			GM_openInTab($('#'+permalinkButtonId).attr('href'));
			break;
		// [q]--------------------------------
		case 81: 
			// queue directly.
			queue();
			break;
		// [s]--------------------------------
		case 83: 
			// TODO open source url.
			// ---- regular source, chat source needed?
			var quote_source = $('#'+currentPost().id+' > div.post_content > table > tbody > tr > td.quote_source > a');
			if (quote_source.length == 0) quote_source = $('#'+currentPost().id+' > div.post_content > table > tbody > tr > td.quote_source > p > a');
			var photo_source = $('#photo_info_'+currentPost().id.substr(5)+' > a');
			var link_source = $('#'+currentPost().id+' > div.post_content > div.post_title > a');
			// video_source is in same path with tumblr_source
			var tumblr_source = $('#'+currentPost().id+' > div.footer_links > span.source_url > a');
			if (quote_source.length > 0) {
				GM_openInTab(quote_source.attr('href'));
			} else if (photo_source.length > 0) {
				GM_openInTab(photo_source.attr('href'));
			} else if (link_source.length > 0) {
				GM_openInTab(link_source.attr('href'));
			} else if (tumblr_source.length > 0) {
				GM_openInTab(tumblr_source.attr('href'));
			}
			break;
		// [t]--------------------------------
		case 84:
			// reblog.
			if (ev.shiftKey) {
				// open reblog page in new tab.
				var targetLink = $('#'+currentPost().id+' > div.post_controls > a[href*="reblog"]');
				var reblogUrl = targetLink.attr('href');
				window.open(reblogUrl);
			} else {
				// reblog directly.
				reblog();
			}
			break;
		// [v]--------------------------------
		case 86:
			// open video inline.
			$('#'+currentPost().id+' > div.post_content > a.video_thumbnail').each(function(ix, vid){
				sendClick(vid);
			});
			break;
		// [x]--------------------------------
		case 88:
			// toggle post show/hide.
			$('#'+currentPost().id+' > div > img').slideToggle('fast');
			$('#'+currentPost().id+' > div[class="post_content"]').slideToggle('fast');
			break;
		// [-]--------------------------------
		case 109:
			// force reload.
			$('html,body').animate({ scrollTop: 0 }, 'fast', function(){
				$('div.selection_nipple').fadeTo('fast', 0);
				$('div#content').fadeTo('fast', 0, function(){location.reload();});
			});
			break;
		}
	}
	
	/*
	 * Keyboard navigations [share]
	 */
	function keyboardNavigationsForShare(ev) {
		if (checkActiveElement()) return false;

		switch (ev.keyCode) {
		// [spacebar]--------------------------------
		case 32: 
			// toggle Advanced settings.
			if ($('#advanced').attr('style').indexOf('none') != -1) {
				sendClick($('#container > #advanced_bar > #advanced_tab')[0]); /*alert('non-advanced')*/
				//$('#CT-key-guide').hide();
			} else {
				sendClick($('#advanced > #advanced_bar > #advanced_tab')[0]); /*alert('advanced')*/
				//$('#CT-key-guide').show();
			}
			break;
		// [t]--------------------------------
		case 84:
			if (ev.shiftKey) {
				// send click to Text tab.
				sendClick($('#nav_regular > a')[0]);
			} else {
				// toggle [send to twitter].
				sendClick($('#send_to_twitter')[0]);
			}
			break;
		// [p]--------------------------------
		case 80: 
			if (ev.shiftKey) {
				// send click to Photo tab.
				sendClick($('#nav_photo > a')[0]);	
			}
			break;
		// [q]--------------------------------
		case 81: 
			if (ev.shiftKey) {
				// send click to Quote tab.
				sendClick($('#nav_quote > a')[0]);
			} else {
				// FIXME toggle queue or post immediate.
				// ----- can create but cannot queue.
				/*
				var postState = $('#post_state')[0];
				var postButton = $('#post_controls > input:first')[0];
				
				if (postState.selectedIndex == 0) {
					postState.selectedIndex = 1;
					postState.value = 2;
					postButton.value = 'Queue post';
				} else if (postState.selectedIndex == 1) {
					postState.selectedIndex = 0;
					postState.value = 0;
					postButton.value = 'Create post';
				}
				*/
			}
			break;
		// [l]--------------------------------
		case 76: 
			if (ev.shiftKey) {
				// send click to Link tab.
				sendClick($('#nav_link > a')[0]);
			}
			break;
		// [c]--------------------------------
		case 67: 
			if (ev.shiftKey) {
				// send click to Chat tab.
				sendClick($('#nav_chat > a')[0]);
			} else {
				// create/queue post.
				sendClick($('#post_controls > input:first')[0]);
			}
			break;
		// [v]--------------------------------
		case 86:
			if (ev.shiftKey) {
				// send click to Video tab.
				sendClick($('#nav_video > a')[0]);
			}
			break;
		// [b]--------------------------------
		case 66:
			// recude <br/>s half.
			var quote1 = $('#quote_post_one');
			quote1.val(quote1.val().replace(/<br \/><br \/>/g, "<br />"));
			break;
		}
	}
	
	/*
	 * Keyboard navigations [reblog]
	 */
	function keyboardNavigationsForReblog(ev) {
		if (checkActiveElement()) return false;
		
		switch (ev.keyCode) {
		// [c]--------------------------------
		case 67: 
			// create/reblog post.
			sendClick($('#save_button')[0]);
			break;
		// [g]--------------------------------
		case 71: 
			// focus tag form.
			sendClick($('#tag_editor')[0]);
			break;
		// [q]--------------------------------
		case 81: 
			// queue post.
			$('#post_state')[0].selectedIndex = 1;
			$('#create_post_button_label')[0].innerHTML = 'Queue post';
			$('#set_date').hide();
			sendClick($('#save_button')[0]);
			break;
		// [t]--------------------------------
		case 84:
			// toggle [send to twitter]
			sendClick($('#send_to_twitter')[0]);
			break;
		}
	}
	
	/*
	 * Keyboard navigations [tumblr post page]
	 */
	function keyboardNavigationsForPost(ev) {
		if (checkActiveElement()) return false;
		
		// TODO like/reblog/queue directly.
		
		switch (ev.keyCode) {
		// [d]--------------------------------
		case 68:
			// go to top of dashboard.
			$('html,body').animate({ scrollTop: 0 }, 'fast', function(){
				location.href = 'http://www.tumblr.com/dashboard';
			});
			break;
		// [r]--------------------------------
		case 82:
			// random walk on userpage.
			location.href = '/random';
			break;
		// [s]--------------------------------
		case 83:
			// open powered [Share on Tumblr] in larger window.
			if (ev.shiftKey && !ev.altKey && Settings.urlType != 'share') poweredSot();
			break;
		}
	}
	
	/*
	 * Keyboard navigations [outside tumblr]
	 */
	function keyboardNavigationsForOthers(ev) {
		if (checkActiveElement()) return false;
		
		switch (ev.keyCode) {
		// [s]--------------------------------
		case 83:
			// open powered [Share on Tumblr] in larger window.
			if (ev.shiftKey && !ev.altKey && Settings.urlType != 'share') poweredSot();
			break;
		}
	}
	
	// bindings and key guides.
	switch (Settings.urlType) {
	case 'dashboard': 
	case 'tumblelog': 
	case 'queue': 
		$(document).keyup(keyboardNavigations);
		break;
	case 'reblog': 
		$(document).keyup(keyboardNavigationsForReblog);
		break;
	case 'share': 
		$(document).keyup(keyboardNavigationsForShare);
		break;
	case 'post': 
		$(document).keyup(keyboardNavigationsForPost);
		break;
	default: 
		$(document).keyup(keyboardNavigationsForOthers);
		break;
	}
}

//----------------------------------------------------------------
// Main Routine.
//----------------------------------------------------------------

Settings.urlType = judgeUrlTypes();

// tweaks.
if (Settings.urlType == 'dashboard' || Settings.urlType == 'tumblelog') {
	document.body.addEventListener('AutoPagerize_DOMNodeInserted', function(ev){
		var node = ev.target;
		processNode(node);
	}, false);
	
	View.posts = new Array();
	processNodeDoc();
	viewTweaksDashboard();
} else if (Settings.urlType == 'reblog') {
	viewTweaksReblog();
} else if (Settings.urlType == 'share') {
	viewTweaksShare();
}

boot();