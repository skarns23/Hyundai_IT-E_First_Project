if (!String.prototype.startsWith) {
	String.prototype.startsWith = function(search, pos) {
		return this.substr(!pos || pos < 0 ? 0 : +pos, search.length) === search;
	};
}

if (!Number.isNaN) {
	Number.isNaN = Number.isNaN || function(value) {
		return value !== value;
	}
}

var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function onYouTubeIframeAPIReady() {
	window.youtubeReady = true;
}

function getScrollbarWidth() {
	var outer = document.createElement("div");
	outer.style.visibility = "hidden";
	outer.style.width = "100px";
	outer.style.msOverflowStyle = "scrollbar"; // needed for WinJS apps

	document.body.appendChild(outer);

	var widthNoScroll = outer.offsetWidth;
	// force scrollbars
	outer.style.overflow = "scroll";

	// add innerdiv
	var inner = document.createElement("div");
	inner.style.width = "100%";
	outer.appendChild(inner);

	var widthWithScroll = inner.offsetWidth;

	// remove divs
	outer.parentNode.removeChild(outer);

	return widthNoScroll - widthWithScroll;
}

var header = {
	wrap : null,
	top : null,
	srhKeywordRoll : null,
	init : function() {
		try {
			header.wrap = document.querySelector('#header');
			if(header.wrap != null) {
				header.top = header.wrap.offsetTop;
				header.gnb();
				header.depthTab();
				slide.create('gnb');
				if(document.querySelector('#wrap').classList.contains('dp-main')) header.wrap.classList.add('ready');
			}

		}
		catch(e) {
			// console && console.log(e);
		}
	},
	gnb : function() {
		try {
			var headerGnb = header.wrap.querySelector('.dp-header-gnb');
			var gnb = header.wrap.querySelector('#gnb');
			var gnbBtn = header.wrap.querySelector('.btn-menu');
			gnbBtn.addEventListener('click', function(){
				if(gnbBtn.classList.contains('active')) {
					gnbBtn.classList.remove('active');
					gnb.classList.remove('open');
					headerGnb.removeAttribute('style');
					// slideClose(gnb, 300, 'open');
				} else {
					gnbBtn.classList.add('active');
					gnb.classList.add('open');
					headerGnb.style.display = 'none';
					// slideOpen(gnb, 300, 'open');
				}
			});

			$('.gnb-category').on('mouseenter.gnb', function(){
				// $('body').addClass('gnb-show');
				if($(this).find('.depth2').length && !$('body').hasClass('gnb-show')) {
					$('body').addClass('gnb-show');
				}
			});

			$('.gnb-category').on('mouseleave.gnb', function(){
				$('body').removeClass('gnb-show');
			});
		}
		catch(e) {
			// console && console.log(e);
		}
	},
	depthTab : function() {
		try {
			var tab = header.wrap.querySelector('.depth2-tab');
			var tabBtn = tab.querySelectorAll('button');
			var wrap = tab.parentNode;
			var depth2 = wrap.querySelectorAll('.depth2-inner');
			var activeIdx = 0;
			for(var btn = 0; btn < tabBtn.length; btn++) {
				tabBtn[btn].addEventListener('click',function(){
					var _this = this;
					var parent = _this.parentNode;
					for(var btnIdx = 0; btnIdx < tabBtn.length; btnIdx++) {
						tabBtn[btnIdx].parentNode.classList.remove('active');
						if(_this == tabBtn[btnIdx]) activeIdx = btnIdx;
					}
					if(!parent.classList.contains('active')) {
						for(var depthIdx = 0; depthIdx < depth2.length; depthIdx++) {
							depth2[depthIdx].classList.remove('active');
							depth2[activeIdx].classList.add('active');
						}
						parent.classList.add('active');
					}
				});
			}

		}
		catch (e) {
			// console && console.log(e);
		}
	},
	fixed : function() {
		var fix = function() {
			var scrollTop = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);
			if(header.wrap != null) {
				if(header.top + 80 < scrollTop) {
					if(!header.wrap.classList.contains('fixed')) header.wrap.classList.add('fixed');
				} else {
					if(header.wrap.classList.contains('fixed')) header.wrap.classList.remove('fixed');
				}
			}
		}
		fix();
		window.addEventListener('scroll', function(){fix()});
	},
	search : function() {
		var searchWrap = document.querySelector('#headerSearch');
		var body = document.body;
		
		body.classList.add('scroll-lock');

		searchWrap.style.display = 'block';

		if(header.srhKeywordRoll == null) {

			var timer = 0;

			timer = setInterval(function(){
				
				var input = searchWrap.querySelector('fieldset input');
				var btnClear = searchWrap.querySelector('fieldset .btn-clear');
				var relKeyword = searchWrap.querySelector('.keyword-related');
				var btnClose = searchWrap.querySelector('.btn-close');
				var rollingList = searchWrap.querySelector('.rolling-list');

				if (!input || !btnClear || !relKeyword || !btnClose) {
					return;
				}
				else {

					if (rollingList) {

						// var input = searchWrap.querySelector('fieldset input');
						// var btnClear = searchWrap.querySelector('fieldset .btn-clear');
						// var relKeyword = searchWrap.querySelector('.keyword-related');
						// var btnClose = searchWrap.querySelector('.btn-close');
						// var rollingList = searchWrap.querySelector('.rolling-list');
						var li = rollingList.querySelectorAll('li');
						var liH = li[0].clientHeight;
						var num = 0;
						var finalNum = liH * li.length;
						var clone = li[0].cloneNode(true);
						var rollingTime;

						rollingList.appendChild(clone);
						var rollReset = function() {
							rollingList.style.transition = '';
							rollingList.style.marginTop = '0';
							num = 0;
						}
						header.srhKeywordRoll = function() {
							rollingTime = setInterval(function(){
								num += liH;
								rollingList.style.marginTop = '-' + num + 'px';
								rollingList.style.transition = 'margin .5s';
								setTimeout(function(){
									if(num >= finalNum) rollReset();
								}, 1000);
							}, 1500);
						}
						header.srhKeywordRoll();

						input.addEventListener('focusout', function(){
							if(this.value == '') {
								rollingList.style.display = 'block';
								clearInterval(rollingTime);
								header.srhKeywordRoll();
							}
						});

						input.addEventListener('input', function(){
							rollingList.style.display = 'none';
						});
						rollingList.addEventListener('click', function(){
							rollingList.style.display = 'none';
							clearInterval(rollingTime);
							rollReset();
							input.focus();
						});
						rollingList.addEventListener('mouseover', function(){
							clearInterval(rollingTime);
						});
						rollingList.addEventListener('mouseleave', function(){
							header.srhKeywordRoll();
						});

						btnClose.addEventListener('click', function(){
							// rollingList.style.display = '';
							clearInterval(rollingTime);
							rollReset();
						});

						clearInterval(timer);
					}
					
					// 개발에서 처리
					// input.addEventListener('keyup', function(){
					// 	(this.value == '') ? relKeyword.style.display = 'none' : relKeyword.style.display = 'block';
					// });
					btnClear.addEventListener('click', function(){
						relKeyword.style.display = 'none'

						rollingList.style.display = '';
						// fieldset 말려올라가는 버그 있음
						searchWrap.querySelector('fieldset').scrollTop = 0;
						
						clearInterval(rollingTime);
						rollReset();
					});
					
					btnClose.addEventListener('click', function(){
						body.classList.remove('scroll-lock');
						searchWrap.style.display = 'none';
					});

					header.srhState = true;
					
					return;
				}
				
			}, 100);

			setTimeout(function(){
				clearTimeout(timer);
			}, 5000)

		} else {
			header.srhKeywordRoll();
		}
	}
}

// 레이어
var layer = {
	btn : {},
	init : function(id) {
		var body = document.body;
		var el = document.querySelector('#'+id);
		
		el.style.display = 'none';
		body.classList.remove('scroll-lock');
		body.style.removeProperty('width');
		$('#header .header-inner')[0].style.removeProperty('width');

		var elClone = el.cloneNode(true);
		el.parentNode.replaceChild(elClone, el);
	},

	open : function(id) {
		// layer.init(id);
		
		if(event) var target = event.currentTarget || event.srcElement;
		var body = document.body;
		var layerPop = document.querySelector('#'+id);
		var layerWrap = layerPop.querySelector('.layer-wrap');
		var btnLayerClose = layerWrap.querySelector('.btn-layer-close');
		var layerPopChick = document.querySelector('.layer-pop');
		
		body.classList.add('scroll-lock');
		if( !$('.layer-pop').is(':visible') ){
			
			$('body').css('width', 'calc(100% - ' + (window.scrollWidth || 0) + 'px)');
			$('#header .header-inner').css('width', 'calc(100% - ' + (window.scrollWidth || 0) + 'px)');
			
		}
		
		layerPop.style.display = 'block';
		layerWrap.focus();

		
		if(!layer.btn[id]) {
			// layerPop.addEventListener('click', function(){
			// 	layer.close(id);
			// });
			// layerWrap.addEventListener('click', function(){
			// 	(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;

			// 	$('.select').removeClass('open');
			// });
			
			// $(layerPop).off('click.layerdim').on('click.layerdim', function(e){
			// 	if (e.target && $(e.target).hasClass('layer-pop')) {
			// 		layer.close(id);
			// 	}
			// }); //20.11.05 삭제 - 레드마인 #19267

			$(layerWrap).off('click.layercontent').on('click.layercontent', function(e){
				// e.stopPropagation();
				$('.select').removeClass('open');
			});
			
			layerPop.addEventListener('focus', function(){
				btnLayerClose.focus();
			});
			btnLayerClose.addEventListener('keydown', function(){
				if(event.keyCode == 9) {
					layerWrap.focus();
				}
			});
		}
		
		if(layerWrap.querySelector('#shoppingBagItem') && !slide.obj['shoppingBagItem']) {
			slide.create('shoppingBagItem');
		}

		// if(layerWrap.querySelector('#likeItemList') && !slide.obj['likeItemList']) {
		// 	slide.create('likeItemList');
		// }

		// if(layerWrap.querySelector('#coordinateItem') && !slide.obj['coordinateItem']) {
		// 	slide.create('coordinateItem');
		// }

		// if(layerWrap.querySelector('#coordinateItem2') && !slide.obj['coordinateItem2']) {
		// 	slide.create('coordinateItem2');
		// }

		// if(layerWrap.querySelector('#coordinateItem3') && !slide.obj['coordinateItem3']) {
		// 	slide.create('coordinateItem3');
		// }
		
		if(event && target instanceof HTMLElement) layer.btn[id] = target;
	},
	close : function(id) {
		var body = document.body;
		var layerWrap = document.querySelector('#'+id);
		var layerPop = document.querySelector('.layer-pop');

		$(layerWrap).trigger('beforeclose');
		layerWrap.style.display = 'none';
		
		/* mod : 220622 begin */
		if( !$('.layer-pop').is(':visible') ){
			
			body.classList.remove('scroll-lock');
			body.style.removeProperty('width');
			
		}
		/* // mod : 220622 end */
		
		$('#header .header-inner')[0].style.removeProperty('width');
		
		$(layerWrap).trigger('close');
		if(layer.btn[id] && layer.btn[id] instanceof HTMLElement) {
			layer.btn[id].focus();
		}
		$(layerWrap).trigger('afterclose');
	},
	create : function(id, title) {
		var wrap = document.querySelector('#wrap');
		var footer = document.querySelector('#footer');
		var div = document.createElement('div');
		div.setAttribute('id', id);
		div.setAttribute('class', 'layer-pop');
		div.setAttribute('tabindex', '0');

		var template = '';
		template += '<div class="layer-wrap" tabindex="0">'
		if(title) {
			template += '	<div class="layer-header">'
			template += '		<h2 class="layer-title">'+title+'</h2>'
			template += '	</div>'
		}
		template += '	<div class="layer-container">'
		template += '		<div class="layer-content">'
		template += '			<div class="layer-content-inner">'
		template += '			</div>'
		template += '		</div>'
		template += '	</div>'
		template += '	<button type="button" class="btn-layer-close" onclick="layer.remove(\''+id+'\');">닫기</button>'
		template += '</div>'

		div.innerHTML = template;

		wrap.insertBefore(div, footer);
		$(id).trigger('create');
	},
	remove : function(id) {
		var layerWrap = document.querySelector('#'+ id);
		var body = document.querySelector('body');

		// 2020.12.09
		if( !$('#reviewDetail').is(':visible') ){
			body.classList.remove('scroll-lock');
			body.style.removeProperty('width');
			$('#header .header-inner')[0].style.removeProperty('width');
		}

		// body.classList.remove('scroll-lock');
		// body.style.removeProperty('width');
		// $('#header .header-inner')[0].style.removeProperty('width');

		layerWrap.style.display = 'none';
		layerWrap.parentNode.removeChild(layerWrap);
		
		if(layer.btn[id]) {
			layer.btn[id].focus();
			delete layer.btn[id];
		}

		$(document).trigger('removed.layer');
	}
}
var layerBox = {
	active : {},
	open : function(id) {
		var _this = event.target || event.srcElement;
		if(clst.find(_this, 'button')) _this = clst.find(_this, 'button');

		var targetLayer = document.querySelector('#'+id);
		layerBox.close();
		layerBox.active['btn'] = _this;
		layerBox.active['layer'] = targetLayer;

		_this.classList.toggle('open');
		targetLayer.classList.toggle('open');
		targetLayer.addEventListener('mouseleave', function(){
			_this.classList.remove('open');
			targetLayer.classList.remove('open');
			if(id == 'layerPromoList') {slide.obj['layerPromoList'].destroy();}
		});
		if(id == 'layerPromoList') slide.create('layerPromoList');
	},
	close : function() {
		if(layerBox.active['btn']) {
			layerBox.active['btn'].classList.remove('open');
			layerBox.active['layer'].classList.remove('open');
			layerBox.active = {};
		}
	}
}

// 리뷰 상세
var reviewDetail = {
	open : function() {
		layer.open('reviewDetail');
		slide.create('reviewImg');
	}, 
	close : function() {
		layer.close('reviewDetail');
		slide.obj['reviewImg'].destroy();
	}
}

// 메인 랭킹 롤링
// var rankingRolling = function(el) {
// 	var rankingWrap = document.querySelector(el);
// 	var rankingList = rankingWrap.querySelectorAll('li');
// 	var rollingInterval;
// 	var interval = function(){ 
// 		rollingInterval = setInterval(function(){
// 			for( var idx = 0; idx < rankingList.length; idx++) {
// 				var nextBrand;
// 				if(rankingList[idx].classList.contains('active')) {
// 					var activeBrand = rankingList[idx].querySelector('.brand');
// 					rankingList[idx].classList.remove('active');
// 					slideClose(activeBrand, 800, 'open');
// 					if(idx == rankingList.length - 1) {
// 						nextBrand = rankingList[0].querySelector('.brand');
// 						rankingList[0].classList.add('active');
// 						slideOpen(nextBrand, 800, 'open');
// 					} else {
// 						nextBrand = rankingList[idx+1].querySelector('.brand');
// 						rankingList[idx+1].classList.add('active');
// 						slideOpen(nextBrand, 800, 'open');
// 					}
// 					return false;
// 				}
// 			}
// 		},3000);
// 	}
// 	interval();

// 	rankingWrap.addEventListener('mouseenter', function(){
// 		clearInterval(rollingInterval);
// 	});
// 	rankingWrap.addEventListener('mouseleave', function(){
// 		clearInterval(rollingInterval);
// 		interval();
// 	});
// }

var rankingRolling = function(el) {
	var $wrap = $(el);
	var $list = $wrap.find('> li');
	var $brand = $wrap.find('.brand');
	var index = 0;
	var maxindex = $list.length - 1;
	var timer = 0;

	$brand.each(function(i){
		var $this = $(this);
		$this.show();
		$this.data('height', $this.outerHeight());
		if (i !== 0) $this.height(0);
	});

	open($list.eq(0));
	run();

	$wrap.off('mouseenter').on('mouseenter', function(){
		clearInterval(timer);
	});

	$wrap.off('mouseleave').on('mouseleave', function(){
		run()
	});

	function run() {
		timer = setInterval(function(){
			index++;
			if (index > maxindex) {
				index = 0;
			}
			open($list.eq(index));
		}, 3000);
	}

	function open(li) {
		var brand = li.find('.brand');
		li.addClass('active');
		// brand.height(brand.data('height')); //개발에서 잘리는 증상있어 강제로 높이 조정
		if (brand.find('img').length === 0) {
			brand.css('height', '0');
		}
		else {
			brand.css('height', '197.25px');
		}


		li.siblings().removeClass('active').find('.brand').height(0);

		setTimeout(function(){
			window.panel && panel.flicking.resize();
		}, 310);

		// intimer = setInterval(function(){
		// 	window.panel && panel.flicking.resize();
		// }, 100);
	}
}

// 패밀리 사이트
var familySite = function() {
	var target = event.target || event.srcElement;
	var list = target.nextElementSibling;
	if(target.classList.contains('active')){
		target.classList.remove('active');
		slideClose(list, 300, 'open');
	} else {
		target.classList.add('active');
		slideOpen(list, 300, 'open');
	}
}


//탭
var tab = {
	wrap : null,
	init : function() {
		tab.wrap = document.querySelectorAll('.ui-tab');
		for(var idx = 0 ; idx < tab.wrap.length ; idx++) {
			var btnWrap = tab.wrap[idx].querySelector('.tab-btn');
			var btns = btnWrap.querySelectorAll('li');

			if (!$(tab.wrap[idx]).is('.initialized')) {
				tab.addEvent(btns);
			}

			$(tab.wrap[idx]).addClass('initialized');
		}
	},
	addEvent : function(btns) {
		for(var idx = 0 ; idx < btns.length ; idx++ ) {
			var btn = btns[idx].querySelector('a') || btns[idx].querySelector('button');
			btn.addEventListener('click', function(){
				var _this = this;
				var list = clst.find(_this, 'li');
				
				tab.active(list);
			
			});
		}
	},
	active : function(el, num) { 
		var wrap;
		if(num == undefined) {
			wrap = clst.find(el, 'ui-tab');
		} else {
			wrap = document.querySelector(el);
		}
		var btnWrap = childFind(wrap, 'tab-btn');
		var btns = btnWrap.querySelectorAll('li');
		var tabCont = childFind(wrap, 'tab-cont');
		
		for(var idx = 0 ; idx < btns.length ; idx++) {
			if(num == undefined && el == btns[idx]) num = idx;
			if(num == idx) {
				if(!btns[idx].classList.contains('on')) {
					btns[idx].classList.add('on');
					tabCont[idx].classList.add('on');
				}
			} else {
				btns[idx].classList.remove('on');
				tabCont[idx].classList.remove('on');
			}
		}
	},
	/**
	 * 20200709 손치용 추가
	 * @param {String} selector : #yourid, .yourclass 등 중복 없는 1개 영역 요소
	 * 
	 * 호출방법 : tab.bind('#your-tab-wrap');
	 */
	bind : function(selector) {
		tab.wrap = document.querySelector(selector);
		var btnWrap = tab.wrap.querySelector('.tab-btn');
		var btns = btnWrap.querySelectorAll('li');
		tab.addEvent(btns);
	}
}

//아코디언
var fold = {
	wrap : null,
	init : function() {
		fold.wrap = document.querySelectorAll('.ui-fold');
		for(var idx = 0 ; idx < fold.wrap.length ; idx++) {
			var btns = fold.wrap[idx].querySelectorAll('.btn-fold');
			var pw_btns = fold.wrap[idx].querySelectorAll('.icon_pw');
			// if (!$(fold.wrap[idx]).is('.initialized')) {
			// 	fold.addEvent(btns);
			// }
			 
			fold.addEvent(btns, pw_btns);
			 
			// 1대1문의 대응
			if ($(fold.wrap[idx]).is('.myqna')) {
				$(fold.wrap[idx]).find('.files .img-file img').each(function(){
					var $img = $(this);
					var originalTransform = $img[0].style.transform;

					// 가로형
					if ($img[0].naturalWidth > $img[0].naturalHeight) {
						$img.removeClass('h').addClass('w');
						if (originalTransform && originalTransform.indexOf('translateX') === -1) {
							$img.css('transform', 'translateX(-50%) ' + originalTransform);
							$img.data('originalTransform', originalTransform);
						} 
						
					}
					else {
						$img.removeClass('w').addClass('h');
						if (originalTransform && originalTransform.indexOf('translateY') === -1) {
							$img.css('transform', 'translateY(-50%) ' + originalTransform);
							$img.data('originalTransform', originalTransform);
						}
					}

				});
			}

			// $(fold.wrap[idx]).addClass('initialized');
		}
	},
	// addEvent : function(btn) {
	// 	for(var idx = 0 ; idx < btn.length ; idx++ ) {
	// 		btn[idx].addEventListener('click', function(){
	// 			var _this = this;
	// 			var list = clst.find(_this, 'li');

	// 			if(!list.classList.contains('lock')) fold.toggle(list);
	// 		});
	// 	}
	// },
	addEvent : function(btns, pw_btns) {
		
		$(btns).off('click.fold').on('click.fold', function(){
			var _this = this;
			var list = clst.find(_this, 'li');
			
			if(!list.classList.contains('lock')) fold.toggle(list);
		});
		
		$(pw_btns).off('click.fold').on('click.fold', function(){
			
			layer.open('layerDormant');
			
		});
		
	},
	toggle : function(_this) {
		var cont = childFind(_this, 'fold-cont');
		var wrap = clst.find(_this, 'ul');

		fold.close(wrap, _this);
		if(_this.classList.contains('on')) {
			_this.classList.remove('on');
			slideClose(cont, 300, 'open');
		} else {
			_this.classList.add('on');
			slideOpen(cont, 300, 'open');
		}
	},
	close : function(wrap, _this) {
		var list = wrap.querySelectorAll('li');
		var cont;
		for(var idx = 0; idx < list.length ; idx++) {
			if(_this != list[idx]) {
				if(list[idx].classList.contains('on')) {
					
					cont = childFind(list[idx], 'fold-cont');
					list[idx].classList.remove('on');
					slideClose(cont, 300, 'open');
				}
			}
		}
	},
	active : function(id, idx) {
		var wrap = document.querySelector(id);
		var list = wrap.querySelectorAll('li');
		if(list[idx] == undefined) {
			console && console.log('undefined');
		} else {
			fold.toggle(list[idx]);
		}
	}
}

/* 동영상플레이어 */
var vodPlayer = {
	ytState : false,
	viState : false,
	obj : {},
	apiSet : function(type) {
		var tag = document.createElement('script');
		if(type === 'youtube') {
			tag.src = "https://www.youtube.com/iframe_api";
			vodPlayer.ytState = true;
		}
		if(type === "vimeo") {
			tag.src = "https://player.vimeo.com/api/player.js";
			vodPlayer.viState = true;
		}
		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
	},
	create : function(vodId, tagId, type, auto, thumb, href, sticky) {

		if (auto === false) {
			auto = false;
		}
		else {
			// PC는 기본 자동 재생
			auto = 'auto';
		}

		vodPlayer.obj[tagId] = {}
		if(type == 'youtube') {

			var contWrap = $('#' + tagId).closest('.vod-cont');
			if (!contWrap.length) {
				// var playerBox = $('#' + tagId)[0];
				$('#' + tagId).closest('.vod').addClass('video-skin v-youtube').removeClass('v-video');

				var playerBox = $('#' + tagId).closest('.item')[0];
				$('#' + tagId).removeAttr('id');
			}
			else {
				var playerBox = contWrap.addClass('video-skin v-youtube').removeClass('v-video').find('.vod-box')[0];
			}

			if (!playerBox) return;
			
			playerBox.innerHTML = '';

			var markup = '';
			markup += '<div class="item-tool">'
			markup += '	<span class="time">00:59 </span>'
			markup += '	<button type="button" class="btn-play-style play"><span>플레이</span></button>'
			markup += '	<button type="button" class="pause">일시정지</button>'
			markup += '</div>'
			markup += '<div class="item-video">'
			markup += '	<div id="' + tagId + '"></div>'
			markup += '</div>'
			markup += '<div class="control">'
			markup += '	<button type="button" class="view">상세보기</button>'
			markup += '	<button type="button" class="play">재생</button>'
			markup += '	<button type="button" class="pause">정지</button>'
			markup += '	<button type="button" class="close">닫기</button>'
			markup += '</div>'

			playerBox.innerHTML = markup;

			var isPopup = $(playerBox).closest('.layer-view-vod').length ? true : false;

			if (thumb) {
				var $prnt = $('#' + tagId).parent();
				$prnt.find('.btn-thumb').remove();
				$prnt.prepend('<div class="btn-thumb" style="background-image:url('+ thumb +');"></div>');
			}
			else {
				$(playerBox).find('.item-tool').hide();
			}

			// if(vodPlayer.ytState == false) vodPlayer.apiSet(type);
			var option = {
				width: '100%',
				height: '100%',
				videoId: vodId,
				playerVars : {
					// 'controls' : 0, 
					// 'showinfo' : 0,
					'autoplay' : isPopup ? true : false,
					'rel' : 0,
					'playsinline' : 1,
					'mute' : 1 //자동재생 불가시 주석해제
					// 'loop' : 1,
					// 'playlist' : vodId
				},
				events : {
					'onReady' : function(event) {
						// if(auto == 'auto') {event.target.playVideo();}

						vodPlayer.obj[tagId]['sort'] = type;
						vodPlayer.obj[tagId]['state'] = 'ready';

						$(playerBox).addClass('ready');

						if (isPopup) {
							event.target.playVideo();
						}
						else {
							videoViewTest(tagId, auto, href, sticky);
						}
					},
					'onStateChange' : function(event) {
						if(event.data === 1) {
							vodPlayer.obj[tagId]['state'] = 'played';
						} else if(event.data === 2) {
							vodPlayer.obj[tagId]['state'] = 'pause';
						} else if(event.data === 0) {
							vodPlayer.obj[tagId]['state'] = 'ready';
							
						}

						$(vodPlayer.obj[tagId]).trigger('stateChange', event);
					}
				}
			}

			// try {
			// 	vodPlayer.obj[tagId]['vod'] = new YT.Player(tagId, option);
			// 	vodPlayer.obj[tagId]['sort'] = type;
			// } catch ($error) {
			// 	setTimeout(function(){vodPlayer.create(vodId, tagId, 'youtube', auto, thumb, href, sticky);}, 100);
			// }


			var timer = setInterval(function(){
				// if (typeof YT === 'object' && YT.Player) {
				if (window.youtubeReady === true) {
					vodPlayer.obj[tagId]['vod'] = new YT.Player(tagId, option);
					vodPlayer.obj[tagId]['sort'] = type;
					clearInterval(timer);
				}
			}, 100);

			setTimeout(function(){
				clearInterval(timer);
				if (typeof YT === 'undefined') {
					console && console.log('youtube ifraem api load error');
				}
			}, 5000);
		}
		
		if(type == 'vimeo') {
			if(vodPlayer.viState == false) vodPlayer.apiSet(type);
			var option = {
				width: '100%',
				height: '100%',
				id: vodId
			}
			try {
				vodPlayer.obj[tagId]['vod'] = new Vimeo.Player(tagId, option);
			} catch ($error) {
				setTimeout(function(){vodPlayer.create(vodId, tagId, 'vimeo', auto);}, 100);
			}
		}

		if(type == 'video') {
			
			// 비디오는 상품 상세에서만 쓰인다
			var vod = document.createElement('video');
			vod.setAttribute('src', vodId);
			vod.setAttribute('id', tagId);
			vod.muted = true;
			vod.loop = true;
			if(auto == 'auto') vod.setAttribute('autoplay','');

			var vodWrap = document.querySelector('#'+tagId);
			vod.setAttribute('class', vodWrap.className);
			vodWrap.parentNode.insertBefore(vod, vodWrap);
			vodWrap.parentNode.removeChild(vodWrap);

			vodPlayer.obj[tagId]['vod'] = vod;
			vod.addEventListener('play', function(){
				vodPlayer.obj[tagId]['state'] = 'played';
			});
			vod.addEventListener('pause', function(){
				if(this.currentTime == this.duration) {
					vodPlayer.obj[tagId]['state'] = 'ready';
				} else {
					vodPlayer.obj[tagId]['state'] = 'pause';
				}
			});
		}
		vodPlayer.obj[tagId]['sort'] = type;
		vodPlayer.obj[tagId]['state'] = 'ready';
	},
	play : function(vodId) {
		if(vodPlayer.obj[vodId] != undefined){
			if(vodPlayer.obj[vodId]['sort'] == 'video') {
				vodPlayer.obj[vodId]['vod'].play();
			} else if(vodPlayer.obj[vodId]['sort'] == 'youtube') {
				vodPlayer.obj[vodId]['vod'].playVideo();
			}
		}
	},
	pause : function(vodId) {
		if(vodPlayer.obj[vodId] != undefined){
			if(vodPlayer.obj[vodId]['sort'] == 'video') {
				vodPlayer.obj[vodId]['vod'].pause();
			} else if(vodPlayer.obj[vodId]['sort'] == 'youtube') {
				vodPlayer.obj[vodId]['vod'].pauseVideo();
			}
		}
	},
	stop : function(vodId) {
		if(vodPlayer.obj[vodId] != undefined){
			if(vodPlayer.obj[vodId]['sort'] == 'video') {
				vodPlayer.obj[vodId]['vod'].load();
			} else if(vodPlayer.obj[vodId]['sort'] == 'youtube') {
				vodPlayer.obj[vodId]['vod'].stopVideo();
			}
		}
	}
}

function videoViewTest(tagId, isAuto, href, isSticky) {
	var el = document.getElementById(tagId);
	var vobj = vodPlayer.obj[tagId];
	var $fixwrap = null;
	var ytstate;
	var vstate;
	
	if ($(el).closest('.vod-cont').length) {
		$fixwrap = $(el).closest('.vod-cont');
	} else if ($(el).closest('.vod').length){
		$fixwrap = $(el).closest('.vod');
	}
	
	if ($fixwrap === null) return;
	
	$(el).data('top', $fixwrap.offset().top);
	$(el).data('height', $fixwrap.outerHeight());
	
	/* side youtube play
	var $vnSide = $fixwrap.parents(".slide-container");
	var $vnSideID = $vnSide.parent().attr("id");
	if ($vnSide.length) {
		var slidePlay = document.getElementById($vnSideID).querySelector('.slide-auto-play');
		var slideStop = document.getElementById($vnSideID).querySelector('.slide-auto-stop');
	}
	*/
	
	if (el) {

		if (vobj.sort === 'youtube') {
			$(vobj).on('stateChange', function(event, state){
				/*
				state.data
						-1 (unstarted)
	
						0 (ended)
						1 (playing)
						2 (paused)
						3 (buffering)
						5 (video cued)
	
						YT.PlayerState.ENDED
						YT.PlayerState.PLAYING
						YT.PlayerState.PAUSED
						YT.PlayerState.BUFFERING
						YT.PlayerState.CUED
				*/
				
				ytstate = state.data;
				// console.log(ytstate + ' ' + tagId)
				
				$fixwrap.removeClass('playing');
				
				/* side youtube play
				if ($vnSide.length) {
					slide.obj[$vnSideID].autoplay.start();
					slidePlay.style.display = 'none';
					slideStop.style.display = 'inline-block';
				}
				*/
				
				if (ytstate === 3) {
					$fixwrap.addClass('playing');
					
				}
				
				if (ytstate === 2) {
					// $fixwrap.find('.btn-thumb').show();
					$fixwrap.find('.control .pause').hide();
					$fixwrap.find('.control .play').show();
				}
					
				if (ytstate === 1) {
					
					// console.log($('#' + tagId).closest('.sticky-video').length);
					$fixwrap.addClass('playing');
					// $fixwrap.find('.btn-thumb').hide();
					$fixwrap.find('.control .pause').show();
					$fixwrap.find('.control .play').hide();
					
					/* side youtube play
					if ($vnSide.length) {
						slide.obj[$vnSideID].autoplay.stop();
						slideStop.style.display = 'none';
						slidePlay.style.display = 'inline-block';
					}
					*/
					
					if ($('#' + tagId).closest('.sticky-video').length) {
						return;
					}
	
					$('.sticky-video').removeClass('sticky-video fixed');
	
					// 실행 중이던 다른 영상은 일시정지
					$.each( vodPlayer.obj, function( key, value ) {
						try {
							if (key !== tagId) {
								if (value.vod.pauseVideo) {
									value.vod.pauseVideo();
									value.state = 'pause';
								}
		
								if (value.vod.pause) {
									value.vod.pause();
									value.state = 'pause';
								}
							}
							else {
								// window.scrollBy(0,1);
							}
						}
						catch (e) {
							window.console && console.log(e);
						}
					});

					// $fixwrap.find('.control .pause').show();
					// $fixwrap.find('.control .play').hide();
	
				}
	
				if (ytstate === 0) {
					$('.sticky-video').removeClass('sticky-video fixed full');
					$('html').removeClass('scroll-lock');

					$fixwrap.find('.control .pause').hide();
					$fixwrap.find('.control .play').show();
				}
				
			});

			$fixwrap.on('click', '.item-tool .play', function(){
				$fixwrap.addClass('playing');
				vobj.vod.playVideo();
			});
			
			$fixwrap.on('click', '.item-tool .pause', function(){
				// $fixwrap.removeClass('playing');
				vobj.vod.pauseVideo();
			});

			$fixwrap.find('.control .play').off('click').on('click', function(){
				vobj.vod.playVideo();
				// $fixwrap.find('.control .pause').show();
				$(this).hide();
			});
	
			$fixwrap.find('.control .pause').off('click').on('click', function(){
				vobj.vod.pauseVideo();
				vobj.state = 'pause';
				// $fixwrap.find('.control .play').show();
				$(this).hide();
			});
	
			$fixwrap.find('.control .close').off('click').on('click', function(){

				if ($fixwrap.is('.full')) {
					$fixwrap.removeClass('full');
					if (isHitScroll(el)) $fixwrap.removeClass('fixed');
					$('html').removeClass('scroll-lock');
					return false;
				}

				vobj.vod.pauseVideo();
				vobj.vod.seekTo(vobj.vod.getDuration());
				vobj.state = 'pause';
	
				$('.sticky-video').removeClass('sticky-video fixed');
				setTimeout(function(){
					window.scrollBy(0,1);
				}, 300);
			});
	
			// $fixwrap.find('.btn-thumb').off('click').on('click', function(){
			// 	$(this).hide();
			// 	vobj.vod.playVideo();
			// });
		}
		else if (vobj.sort === 'video') {
			vstate = 'ready';

			$(vobj.vod).on('play', function(){
				// console.log('video play');

				if ($('#' + tagId).closest('.sticky-video').length) {
					return;
				}

				$('.sticky-video').removeClass('sticky-video fixed');

				// 실행 중이던 다른 영상은 일시정지
				$.each( vodPlayer.obj, function( key, value ) {
					if (key !== tagId) {
						if (value.vod && value.vod.pauseVideo) {
							value.vod.pauseVideo();
							value.state = 'pause';
						}

						if (value.vod && value.vod.pause) {
							value.vod.pause();
							value.state = 'pause';
						}
					}
					else {
						// window.scrollBy(0,1);
					}
				});

				$fixwrap.addClass('playing');
				$fixwrap.find('.control .play').hide();
				$fixwrap.find('.control .pause').show();
				vstate = 'played';
			});
		
			$(vobj.vod).on('pause', function(){
				// console.log('video pause')
				$fixwrap.removeClass('playing');
				$fixwrap.find('.control .play').show();
				$fixwrap.find('.control .pause').hide();
				vstate = 'pause';
			});
		
			$(vobj.vod).on('ended', function(){
				// console.log('video ended');
				$fixwrap.removeClass('playing');
				$fixwrap.find('.control .play').show();
				$fixwrap.find('.control .pause').hide();

				$('.sticky-video').removeClass('sticky-video fixed full');
				$('html').removeClass('scroll-lock');

				vstate = 'ready';
			});

			$fixwrap.on('click', '.item-tool .play', function(){
				$fixwrap.addClass('playing');
				vobj.vod.play();
			});

			$fixwrap.on('click', '.item-tool .play', function(){
				$fixwrap.addClass('playing');
				vobj.vod.play();
			});

			$fixwrap.on('click', '.item-tool .pause', function(){
				// $fixwrap.removeClass('playing');
				vobj.vod.pause();
			});

			$fixwrap.find('.control .play').off('click').on('click', function(){
				vobj.vod.play();
				$fixwrap.find('.control .pause').show();
				$(this).hide();
			});
	
			$fixwrap.find('.control .pause').off('click').on('click', function(){
				vobj.vod.pause();
				vstate = 'pause';
				$fixwrap.find('.control .play').show();
				$(this).hide();
			});
	
			$fixwrap.find('.control .close').off('click').on('click', function(){
				if ($fixwrap.is('.full')) {
					$fixwrap.removeClass('full');
					$('html').removeClass('scroll-lock');
					return false;
				}

				vobj.vod.pause();
				vobj.vod.currentTime = vobj.vod.duration;
				
				$('.sticky-video').removeClass('sticky-video fixed');
				setTimeout(function(){
					vobj.vod.currentTime = 0;
					vstate = 'ready';
					window.scrollBy(0,1);
				}, 300);
			});
		}

		$fixwrap.off('click.view').on('click.view', '.control .view', function(){
			if (href) {
				location.href = href;
				return false;
			}
			else {
				$fixwrap.addClass('full');
				$('html').addClass('scroll-lock');
			}
		});

		// console.log(isSticky)
		if (isSticky || isSticky === 'STICKY_PLAY') {
			setVideo();
	
			$(window).off('scroll.video' + tagId).on('scroll.video' + tagId, function(){
				setVideo();
			});
		}
		else {
			// $(window).off('scroll.video' + tagId);
			var tmptimer = 0;
			if ($fixwrap.closest('.swiper-wrapper').length) {
				$(window).off('scroll.video' + tagId).on('scroll.video' + tagId, scrollVideo);
			}
			else {
				$(window).off('scroll.video').on('scroll.video', scrollVideo);
			}

			window.scrollBy(0, 1);
		}

		function scrollVideo(){
			if (isHitScroll(el)) {
				
				// swiper인 경우
				if ($fixwrap.closest('.swiper-slide').length){
					if (!$fixwrap.closest('.swiper-slide-active').length && $fixwrap.closest('.swiper-wrapper').find('.swiper-slide').length > 1) {
						return;
					}
				}

				if (isAuto && !$('.sticky-video').length) {

					if (vobj.sort === 'youtube') {
						vobj.vod && vobj.vod.playVideo && vobj.vod.playVideo();
					}
	
					if (vobj.sort === 'video') {
						vobj.vod && vobj.vod.play && vobj.vod.play();
					}
					
				}
	
				if ($fixwrap.closest('.swiper-wrapper').length) {
					$fixwrap.closest('.swiper-wrapper').removeClass('notrans');
				}
				
			}
			else {
				if (vobj.sort === 'youtube') {
					vobj.vod && vobj.vod.pauseVideo && vobj.vod.pauseVideo();
				}

				if (vobj.sort === 'video') {
					vobj.vod && vobj.vod.pause && vobj.vod.pause();
				}
			}
		}
	}

	function setVideo(){
		if (isHitScroll(el)) {
			// console.log(isAuto);
			// console.log(vstate === 'ready')
			// console.log(!$('.sticky-video').length)

			// swiper인 경우
			if ($fixwrap.closest('.swiper-slide').length){
				if (!$fixwrap.closest('.swiper-slide-active').length) {
					return;
				}
			}
			
			if (isAuto && !$('.sticky-video').length) {
				
				if (vobj.sort === 'youtube') {
					// 사용자 일시정지 상태가 아니면 실행
					if (ytstate !== 2) {
						vobj.vod && vobj.vod.playVideo && vobj.vod.playVideo();
					}
				}

				if (vobj.sort === 'video') {
					// 사용자 일시정지 상태가 아니면 실행
					if (vstate !== 'pause') {
						vobj.vod && vobj.vod.play && vobj.vod.play();
					}
				}
				
			}

			$fixwrap.removeClass('fixed');
			$fixwrap.removeClass('sticky-video');

			if ($fixwrap.closest('.swiper-wrapper').length) {
				$fixwrap.closest('.swiper-wrapper').removeClass('notrans');
			}
			
		}
		else {
			// 현재 재생중이었다면 Sticky 처리
			if (vobj.state === 'played') {
				// console.log(11111 + ' ' + vobj.state + ' ' + tagId)
				$fixwrap.addClass('fixed');
				$fixwrap.addClass('sticky-video').data('player', vobj);
				
				if ($fixwrap.closest('.swiper-wrapper').length) {
					$fixwrap.closest('.swiper-wrapper').addClass('notrans');
				}
			}
			else {

				if ($fixwrap.is('.sticky-video') && vobj.state === 'pause'){
					// console.log(22222 + ' ' + vobj.state + ' ' + tagId)
				}
				else {
					// console.log(33333 + ' ' + vobj.state + ' ' + tagId)
					$fixwrap.removeClass('fixed');
					$fixwrap.removeClass('sticky-video');
				}
			}

		}
	}

}

function isHitScroll (el) {
	var scrollTop = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);

	if (scrollTop > $(el).data('top') + $(el).data('height')) {
		return false;
	}
	else if (scrollTop < $(el).data('top') - $(window).height()) {
		return false;
	}
	else {
		return true;
	}
	
}
//스크롤 이동
var scrollMov = function(target, time, wrap) {
	if(wrap) {
		var doc = wrap;
		if(typeof(target) == 'number') {
			var targetTop = target;
		} else {
			var targetTop = target.offsetTop - doc.offsetTop;
		}
	} else {
		var doc = document.querySelector('html');
		var header = document.querySelector('#header .header-inner').clientHeight;
		if(typeof(target) == 'number') {
			var targetTop = target;
		} else {
			var targetTop = target.offsetTop - header;
		}
		
	}
	var docTop = doc.scrollTop;
	var range = targetTop - docTop;
	var inc = 10;
	var count = 0;
	var ctime = 0;
	var mov = 0;

	for(var i = inc; i <= time ; i+=inc) count++;
	
	var per = range / count;

	var scroll = function() {
		ctime += inc;
		if(range > 0) {
			mov += per;
			doc.scrollTop = docTop + mov;
		} else {
			mov -= per;
			doc.scrollTop = docTop - mov;
		}
		if(ctime < time) {
			setTimeout(scroll, inc);
		} else {
			doc.scrollTop = targetTop;
		}
	}
	scroll();
}

// 슬라이드 열기
var slideOpen = function(el, time, cls, callBack) {
	var wrap = el;
	var wrapH = 0;
	wrap.style.cssText = 'position:absolute;display:block;opacity:0';
	wrapH = wrap.clientHeight;
	wrap.style.cssText = 'display:block;overflow:hidden;height:0;transition:height '+(time * 0.001)+'s';
	setTimeout(function(){
		wrap.style.height = wrapH + 'px';
	},10);
	setTimeout(function(){
		wrap.removeAttribute('style');
		if(cls) wrap.classList.add(cls);
		if(typeof callBack != 'undefined' && callBack){
			if(typeof callBack == 'function'){
				callBack();
			} else {
				if(callBack) { eval( callBack ); }
			}
		}
	},time);
}

// 슬라이드 닫기
var slideClose = function(el, time, cls, callBack) {
	var wrap = el;
	var wrapH = el.clientHeight;
	wrap.style.cssText = 'overflow:hidden;height:'+wrapH+'px;transition:height '+(time * 0.001)+'s';
	setTimeout(function(){
		wrap.style.height = '0';
	},10);
	setTimeout(function(){
		wrap.removeAttribute('style');
		if(cls) wrap.classList.remove(cls);
		if(typeof callBack != 'undefined' && callBack){
			if(typeof callBack == 'function'){
				callBack();
			} else {
				if(callBack) { eval( callBack ); }
			}
		}
	},time);
}
var slideToggle = function(el, time, cls, callBack) {
	(el.classList.contains(cls)) ? slideClose(el, time, cls, callBack) : slideOpen(el, time, cls, callBack);
}

// 부모 요소 찾기
var clst = {
	parent : null,
	find : function(_this, target){
		var tag = _this.parentNode.tagName.toLowerCase();
		var cls = _this.parentNode.classList;
		var id = _this.parentNode.getAttribute('id');
		clst.parent = _this.parentNode;
		if(target !== tag && !cls.contains(target) && target != id) {
			if(tag != 'html') {
				clst.find(clst.parent, target);
			} else {
				clst.parent = undefined;
			}
		}
		return clst.parent;
	}
}
// 자식 요소 찾기
var childFind = function(el, target) {
	var obj = '';
	var arr = [];
	for(var idx = 0 ; idx < el.childNodes.length; idx++) {
		if(el.childNodes[idx].nodeType == 1) {
			var tag = el.childNodes[idx].tagName.toLowerCase();
			var cls = el.childNodes[idx].classList;
			var id = el.childNodes[idx].getAttribute('id');
			if(target === tag || cls.contains(target) || target === id) {
				obj = el.childNodes[idx];
				arr.push(el.childNodes[idx]);
			}
		}
	}
	if(arr.length > 1) {
		return arr;
	} else {
		return obj;
	}
}
// 다음 요소 찾기
var nextFind = function(obj) {
	if(obj.nextSibling.nodeType == 1) {
		next = obj.nextSibling;
	} else {
		nextFind(obj.nextSibling);
	}
	return next;
}

// 체크 박스 전체 체크
var allChk = function(id) {
	var chkWrap = document.querySelector(id);
	var chkbox = chkWrap.querySelectorAll('input[type="checkbox"]');
	var allChk;
	for(var idx = 0; idx < chkbox.length; idx++) {
		if(chkbox[idx].classList.contains('allChk')) {
			allChk = chkbox[idx];
			chkbox[idx].addEventListener('click', function(){
				var _this = this;
				if(_this.checked) {
					for(var i = 0; i < chkbox.length; i++) {
						if(chkbox[i].disabled == false) {chkbox[i].checked = true;}
					} 
				} else {
					for(var i = 0; i < chkbox.length; i++) {
						chkbox[i].checked = false;
					}
				}
			});
		} else {
			chkbox[idx].addEventListener('click', function(){
				var _this = this;
				var state = true;
				if(!_this.checked) allChk.checked = false;
				for(var i = 0; i < chkbox.length; i++) {
					if(!chkbox[i].classList.contains('allChk')) {
						if(!chkbox[i].checked && chkbox[i].disabled == false) {
							state = false;
						}
					}
				}
				if(state) {allChk.checked = true}
			});
		}
	}
}

// select
var select = {
	obj : {},
	wrap : null,
	btn : null,
	listBox : null,
	list : null,
	option : null,
	type: null,
	init : function(name) {
		if(name) {
			select.obj[name] = {}
			select.obj[name]['option'] = document.querySelectorAll('input[name="'+name+'"]');
			select.obj[name]['wrap'] = clst.find(select.obj[name].option[0], 'select');
			select.obj[name]['btn'] = select.obj[name].wrap.querySelector('.sel-btn');
			
			if (select.type === 'option') {
				if (!select.obj[name]['btn'].originalText) {
					select.obj[name]['btn'].originalText = select.obj[name]['btn'].innerHTML;
				}
			}
			else {
				// select.obj[name]['btn'].originalText = select.obj[name]['btn'].innerText;
				// select.obj[name]['btn'].originalText = $(select.obj[name]['wrap']).find('input[value=""]').next().text();
				if($(select.obj[name]['wrap']).find('input[value=""]').length) {
					select.obj[name]['btn'].originalText = $(select.obj[name]['wrap']).find('input[value=""]').next()[0].innerText;
				}
				else {
					select.obj[name]['btn'].originalText = select.obj[name]['btn'].innerHTML;
				}
			}
		} else {
			select.btn = event.currentTarget || event.srcElement;
			select.wrap = clst.find(select.btn, 'select');
			select.listBox = select.wrap.querySelector('.sel-list');
			select.list = select.listBox.querySelectorAll('li');
			select.option = select.listBox.querySelectorAll('input[type="radio"]');
			
			if (select.type === 'option') {
				if (!select.btn.originalText) {
					select.btn.originalText = select.btn.innerHTML;
				}
			}
			else {
				// select.btn.originalText = select.btn.innerText;
				if($(select.listBox).find('input[value=""]').length) {
					select.btn.originalText = $(select.listBox).find('input[value=""]').next()[0].innerText;
				}
				else {
					select.btn.originalText = select.btn.innerHTML;
				}
			}
		}

	},
	reset : function(name) {
		if(name) {
			select.obj[name] = {}
			select.obj[name]['option'] = document.querySelectorAll('input[name="'+name+'"]');
			select.obj[name]['wrap'] = clst.find(select.obj[name].option[0], 'select');
			select.obj[name]['btn'] = select.obj[name].wrap.querySelector('.sel-btn');

			[].forEach.call(select.obj[name]['option'], function(obj){
				obj.checked = false;
			});

			if(select.obj[name]['btn'].originalText) select.obj[name].wrap.querySelector('.sel-btn').innerHTML = select.obj[name]['btn'].originalText;

			select.obj[name]['btn'] && select.obj[name]['btn'].classList.remove('on');
			
		} else {
			select.btn = event.currentTarget || event.srcElement;
			select.wrap = clst.find(select.btn, 'select');
			select.listBox = select.wrap.querySelector('.sel-list');
			select.list = select.listBox.querySelectorAll('li');
			select.option = select.listBox.querySelectorAll('input[type="radio"]');

			[].forEach.call(select.option, function(obj){
				obj.checked = false;
			});

			if(select.btn.originalText) selselect.btn.innerHTML = select.btn.originalText;

			select.btn && select.btn.classList.remove('on');
		}
	},
	trigger : function(type) {
		(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;
		select.type = type;
		select.init();
		var sel = document.querySelectorAll('.select'); 
		[].forEach.call(sel, function(obj){
			var btn = obj.querySelector('.sel-btn');
			if(btn != select.btn) obj.classList.remove('open');
		});
		select.wrap.classList.toggle('open');
		if(type != 'check') {
			[].forEach.call(select.list, function(obj){
				obj.addEventListener('click', function(){
					if(obj.querySelector('input[type="radio"]').disabled == false) {
						select.wrap.classList.remove('open');
						setTimeout(function(){select.btn.focus();},100);
					}
				});
			});
			[].forEach.call(select.option, function(obj){
				if(obj.checked == true) obj.focus();
				obj.addEventListener('click', function(){
					(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;
					var _this = this;
					// var txt = _this.nextSibling.nextSibling.innerText;
					var txt = _this.nextElementSibling.innerText;
					(_this.value != "") ? select.btn.classList.add('on') : select.btn.classList.remove('on');
					if(type == 'option') {
						var valStr = select.btn.querySelector('.val');
						valStr.style.display = 'inline-block';
						valStr.previousSibling.data = null;
						valStr.innerText = txt;
					} else {
						// select.btn.originalText = select.btn.innerText;
						select.btn.innerText = txt;
					}
				});
				obj.addEventListener('keydown', function(){
					if(event.keyCode == 13) {
						var _this = this;
						// var txt = _this.nextSibling.nextSibling.innerText;
						var txt = _this.nextElementSibling.innerText;
						(_this.value != "") ? select.btn.classList.add('on') : select.btn.classList.remove('on');
						if(type == 'option') {
							var valStr = select.btn.querySelector('.val');
							valStr.style.display = 'inline-block';
							valStr.previousSibling.data = null;
							valStr.innerText = txt;
						} else {
							// select.btn.originalText = select.btn.innerText;
							select.btn.innerText = txt;
						}
						select.wrap.classList.remove('open');
						setTimeout(function(){select.btn.focus();},100);
					}
				});
			});
		}
		// select.wrap.addEventListener('click', function() {
		// 	(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;
		// });

		// window.addEventListener('click', function() {
		// 	select.wrap.classList.remove('open');
		// });

		$(select.wrap).off('click.selectwrap').on('click.selectwrap', function(e){
			// e.stopPropagation();
		});

		$(window).off('click.selectremove').on('click.selectremove', function(){
			select.wrap.classList.remove('open');
		});
	},
	active : function(name, idx, type) {
		select.init(name);

		if(select.obj[name].option[idx].disabled == false) {
			select.obj[name].option[idx].checked = true;
			var val = nextFind(select.obj[name].option[idx]);
			if(type == 'option') {
				var valStr = select.obj[name].btn.querySelector('.val');
				valStr.style.display = 'inline-block';
				valStr.previousSibling.data = null;
				valStr.innerText = val.innerText;
			} else {
				select.obj[name].btn.innerText = val.innerText;
				(select.obj[name].option[idx].value != "") ? select.obj[name].btn.classList.add('on') : select.obj[name].btn.classList.remove('on');
			}
		}
	},
	value : function(name) {
		select.option = document.querySelectorAll('input[name="'+name+'"]');
		var val = '';
		[].forEach.call(select.option, function(obj){
			if(obj.checked) val = obj.value;
		});
		return val;
	},
	multi : function(obj){
		var btn = $(obj);
		var list = btn.next('.sel-list');
		var parent = btn.parent('.select');

		parent.toggleClass('open');

		return;
		// 이하 사용안함

		list.on('change', 'input', function(e){
			var $this = $(e.currentTarget);
			var markup = '';

			if ($this.is('.all')) {
				if ($this.is(':checked')) {
					list.find('input').each(function(){
						if (!$(this).is('.all')) {
							$(this).prop('checked', false);
						}
					});
				}
			}
			else {
				list.find('input.all').prop('checked', false);
			}

			list.find('input').each(function(){
				if ($(this).is(':checked')) {
					markup += '<em>' + $(this).next('span').text() + '</em>';
				}
				else {
					// if ($(this).is('.all')) {
					// 	markup += $(this).next('span').text()
					// }
				}
			});

			if (list.find('input:checked').length === 0) {
				list.find('input.all').prop('checked', true);
				markup += '<em>' + list.find('input.all').next('span').text() + '</em>';
				// setTimeout(function(){
				// 	markup += '<em>' + list.find('input.all').next('span').text() + '</em>';
				// }, 1)

			}
			// console.log(markup)

			btn.empty().html(markup);
		});
	}
}
function selectActive(name, idx, type) {
	select.init(name);
	select.active(name, idx, type);
}
// 인풋 파일
var inputFile = function() {
	var _this = event.target || event.srcElement;
	var inputWrap = clst.find(_this, 'file-search');
	var inputTxt = inputWrap.querySelector('input[type="text"]');
	var path = _this.value.lastIndexOf('\\');
	var fileName = _this.value.substring(path+1, _this.value.length)
	inputTxt.value = fileName;
}

// 좋아요 토글
var likeToggle = function(){
	if(event) {
		var _this = event.target || event.srcElement;
		if(!_this.classList.contains('on')) {
			_this.classList.add('on');
		} else {
			_this.classList.remove('on');
		}
	}
}

/* 배송지 입력 */
var toggleShow = function() {
	var _this = event.target || event.srcElement;
	var td = clst.find(_this, 'td');
	var target = td.querySelector('.selfInput');
	var input = target.querySelector('input[type="text"]');
	if(_this.value == 'selfInput') {
		target.style.display = 'block';
		setTimeout(function(){input.focus()},100);
		
	} else {
		target.style.display = 'none';
	}
}

/* 추가구성상품 선택 */
var addItemFunc = function(){
	var wrap = document.querySelector('.layer-add-item');
	var selList = wrap.querySelector('.item-sel-list');
	var radios = selList.querySelectorAll('input[type="radio"]');
	var itemBox = wrap.querySelector('.add-item-box');
	var selOpt = itemBox.querySelectorAll('input[type="radio"]');
	var btnCom = itemBox.parentNode.querySelector('[class*="btn-type"]');

	[].forEach.call(radios, function(radio){
		radio.addEventListener('change', function(){
			itemBox.style.display = 'block';
		});
	});
	// [].forEach.call(selOpt, function(option){
	// 	option.addEventListener('change', function(){
	// 		(this.value != '') ? btnCom.disabled = false : btnCom.disabled = true;
	// 	});
	// });
}

/* 현금영수증 신청 */
var receiptBoxToggle = function() {
	var _this = event.target || event.srcElement;
	var wrap = clst.find(_this, 'receipt-wrap');
	var box = wrap.querySelector('.receipt-box');
	box.classList.toggle('open');
}
var receiptSel = function() {
	var _this = event.target || event.srcElement;
	var txt = _this.getAttribute('data-plc');
	var wrap = clst.find(_this, 'receipt-box');
	var input = wrap.querySelector('input[type="text"]');
	if(txt == 'none') {
		input.disabled = true;
		input.setAttribute('placeholder', '');
	} else {
		input.disabled = false;
		input.setAttribute('placeholder', txt);
	}
}

/* 결제 수단 선택 */
var methodShow = function(state, target) {
	var _this = event.target || event.srcElement;
	var wrap = clst.find(_this, 'payment-method');
	var list = childFind(wrap, 'row-sel');
	var _thisList = clst.find(_this, 'row-sel');
	// var methodCont = document.querySelector('.payment-method-tab');
	var methodCont = document.querySelector('#'+target);
	var methodContA = wrap.querySelectorAll('.payment-method-tab');
	
	[].forEach.call(list, function(elm) {
		if(elm.classList.contains('active')) {elm.classList.remove('active');}
		_thisList.classList.add('active');
	});
	
	/* mod : 221005 begin */
	for(var idx = 0 ; idx < methodContA.length; idx++) {
		methodContA[idx].classList.remove('open');
	}
	if(state == 'show') {methodCont.classList.add('open');}
	
	tooltip();
	if($(".radio-skin input:radio[name='cardSel']").is(":checked")) {
		$(".radio-skin input:radio[name='cardSel']").prop('checked', false);
	}
	if($(".card-info input:checkbox").is(":checked")) {
		$(".card-info input:checkbox").prop('checked', false);
	}
	/* mod : 221005 end */
	// (state == 'show') ? methodCont.classList.add('open') : methodCont.classList.remove('open'); // mod : 221005
}
var methodSel = function(cls) {
	var _this = event.target || event.srcElement;
	var wrap = clst.find(_this, 'payment-method-tab');
	var contWrap = wrap.querySelector('.tab-contents');
	var cont = childFind(contWrap, 'contents');
	
	[].forEach.call(cont, function(elm){
		if(!elm.classList.contains(cls)) {
			elm.classList.remove('on');
		} else {
			elm.classList.add('on');
		}
	});
}

/* 결제금액 영역 고정 */
var paymentSticky = function() {
	var wrap = document.querySelector('.total-payment');
	var fix = function() {
		if(wrap) {	
			var scrollTop = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);
			var headH = document.querySelector('.header-inner').clientHeight;
			var rel = document.querySelector('.order-cont');
			var top = rel.offsetTop - headH;
			var bot = rel.offsetTop + rel.clientHeight;
			var stickyWrap = wrap.querySelector('.inner');
			(scrollTop >= top) ? stickyWrap.classList.add('sticky') : stickyWrap.classList.remove('sticky');
			(stickyWrap.clientHeight + scrollTop >= bot) ? stickyWrap.classList.add('end') : stickyWrap.classList.remove('end');
		}
	}
	fix();
	window.addEventListener('scroll', function(){fix()});
}
var discountListToggle = function() {
	var _this = event.currentTarget || event.srcElement;
	_this.classList.toggle('on');
	slideToggle(document.querySelector('.discount-list'), 300, 'open');
}

var anchorTabs = function() {
	var wrap = document.querySelector('.anchor-wrap');
	if(wrap) {
		var ancHorTab = childFind(wrap, 'tabs');
		var list = ancHorTab.querySelectorAll('li');
		var tabs = ancHorTab.querySelectorAll('button');
		var secTop = [];
		[].forEach.call(tabs, function(btn, idx){
			btn.addEventListener('click', function(){
				posSet();
				scrollMov(secTop[idx], 200);
			});
		});
		var posSet = function() {
			var anchorSection = childFind(wrap, 'anchor-section');
			secTop = [];
			[].forEach.call(anchorSection, function(sec){
				secTop.push(sec.offsetTop + wrap.offsetParent.offsetTop - 56);
			});
		}
		var fix = function() {
			posSet();
			var scrollTop = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);
			var anchorSection = childFind(wrap, 'anchor-section');
			var activeNum = 0;
			[].forEach.call(anchorSection, function(sec, idx){
				var thisTop = sec.offsetTop + wrap.offsetParent.offsetTop - 56;
				var thisBot = thisTop + sec.clientHeight;
				if(scrollTop >= thisTop && scrollTop < thisBot) {
					activeNum = idx;
				}
			});
			if(!list[activeNum].classList.contains('on')) {
				[].forEach.call(list, function(li){
					if(li.classList.contains('on')) li.classList.remove('on');
				})
				list[activeNum].classList.add('on');
			}
		}
		window.addEventListener('scroll', function(){fix()});
	}
}
var filterShowToggle = function() {
	var _this = event.currentTarget || event.srcElement;
	var parent = clst.find(_this, 'head');
	var target = parent.querySelector('.filter');

	_this.classList.toggle('on');
	target.classList.toggle('open');

}
window.addEventListener('load', function(){anchorTabs();});

var detailSticky = function() {
	var wrap = document.querySelector('.product-view-detail');
	var fix = function() {
		if(wrap) {
			var scrollTop = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);
			var headH = document.querySelector('.header-inner').clientHeight;
			var rel = wrap;
			var top = rel.offsetTop - headH;
			var bot = rel.offsetTop + rel.clientHeight;
			var stickyOption = wrap.querySelector('.product-view-option');
			var stickyTab = wrap.querySelector('.product-detail-tab');
			var tab = stickyTab.querySelector('.tabs');
			
			if(scrollTop >= top) {
				if(!stickyTab.classList.contains('sticky')) {
					stickyTab.classList.add('sticky');
					tab.style.width = stickyTab.clientWidth + 1 + 'px';
					window.addEventListener('resize', function(){tab.style.width = stickyTab.clientWidth + 1 + 'px';});
				}
				
				if(!stickyOption.classList.contains('sticky')) stickyOption.classList.add('sticky');
			} else {
				if(stickyTab.classList.contains('sticky')) {
					stickyTab.classList.remove('sticky');
					tab.removeAttribute('style');
				}
				if(stickyOption.classList.contains('sticky')) stickyOption.classList.remove('sticky');;
			} 
			if(stickyOption.clientHeight + scrollTop > bot - tab.clientHeight) {
				if(!stickyOption.classList.contains('end')) {
					stickyOption.classList.add('end');
				}
			} else {
				if(stickyOption.classList.contains('end')) {
					stickyOption.classList.remove('end');
				}
			}
			(tab.clientHeight + scrollTop > bot - tab.clientHeight) ? stickyTab.classList.add('end') : stickyTab.classList.remove('end');
		}
	}
	fix();
	window.addEventListener('scroll', function(){fix()});
};

var detailVisualSticky = function(){
	try {
		var visualWrap = $('.product-view-img');
		var infoWrap = $('.product-view-info');
		var visual = $('#pdViewSlide');
		var detail = $('.product-view-detail');
		var visualTop = visualWrap.offset().top;
		var detailTop = detail.offset().top;
		var visualHeight = visual.height();
		var infoHeight = infoWrap.height();

		if ( parseInt(visualHeight, 10) >= parseInt(infoHeight, 10) ) {
			return;
		}

		setFix();

		$(window).off('scroll.detailvisual').on('scroll.detailvisual', function(){
			setFix();
		});

		$(window).off('resize.detailvisual').on('resize.detailvisual', function(){
			visual = $('#pdViewSlide');
			detail = $('.product-view-detail');
			visualTop = visualWrap.offset().top;
			detailTop = detail.offset().top;
			visualHeight = visual.height();
			// console.log(visualTop);
			// console.log(detailTop);
			visual.css('width', visualWrap.width());
			setFix();
		});

		function setFix() {

			var scrollPos = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);
			if (!$('#header').is('.fixed')) {
				visual[0].classList.remove('fixed');
				visual.removeAttr('style');
				return;
			}
			
			var headerHeight = $('#header .header-inner').height() || 0;
	
			// 상단에 걸리면
			if (scrollPos > visualTop - headerHeight) {
				// visual[0].classList.add('fixed');
				// visual[0].classList.remove('bottom');
				// visual.css('width', visualWrap.width());

				// 80 : 기본여백
				if (scrollPos > detailTop - visualHeight - headerHeight - 80) {
					visual[0].classList.remove('fixed');
					visual[0].classList.add('bottom');
					visual.removeAttr('style');
					// console.log('in')
				}
				else {
					visual[0].classList.add('fixed');
					visual[0].classList.remove('bottom');
					visual.css('width', visualWrap.width());
				}
			}
			else {
				visual[0].classList.remove('fixed');
				visual[0].classList.remove('bottom');
				visual.removeAttr('style');
			}
		}
	}
	catch (e){
		// console.log(e)
	}
};

/* 약관/개인정보 취급방침 */
/*
var termsShow = function(title, page, type) {
	var httpRequest;
	var id = 'termsLayer';
	var path = '/html/terms/'

	if(document.querySelector('#'+id)) {
		layer.remove(id);
	}

	layer.create(id, title);

	var layerWrap = document.querySelector('#'+id);
	var layerInner = layerWrap.querySelector('.layer-content-inner');
	var templ = '';
	if(type == '이용약관') {
		templ += '<a href="#" class="link-offline">오프라인 멤버쉽 이용약관</a>';
	} else if(type == '개인정보') {
		templ += '<a href="#" class="link-offline">오프라인 멤버쉽 개인정보 취급방침 이용약관</a>';
	}
	templ += '<div class="scroll-box"></div>'
	templ += '<div class="btn-box"><button type="button" class="btn-type2-lg">인쇄</button></div>'

	layerInner.classList.add('layer-temrs-wrap');
	layerInner.innerHTML = templ;

	var box = layerInner.querySelector('.scroll-box');
	
	layer.open(id);

	httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200) {
			box.innerHTML = this.responseText;
		}
	}
	httpRequest.open('GET', path + page +'.html', true);
	httpRequest.send();
}
*/

var termsShow = function(title, page, page02, page03, page04, type, callback, method) {
	var httpRequest;
	var id = 'termsLayer';
	// var path = '/html/terms/'

	if(document.querySelector('#'+id)) {
		layer.remove(id);
	}

	layer.create(id, title);
	
	var layerWrap = document.querySelector('#'+id);
	var layerInner = layerWrap.querySelector('.layer-content-inner');
	var templ = '';
	// if(type == '이용약관') {
	// 	templ += '<a href="#" class="link-offline">오프라인 멤버쉽 이용약관</a>';
	// } else if(type == '개인정보') {
	// 	templ += '<a href="#" class="link-offline">오프라인 멤버쉽 개인정보 취급방침 이용약관</a>';
	// }
	templ += '<div class="tab-wrap2 ui-tab">'
	templ += '	<ul class="tabs tab-btn">'
	templ += '		<li class="on"><a href="#tab1_cont">H패션몰 서비스 이용약관</a></li>'
	templ += '		<li class=""><a href="#tab2_cont">H패션몰 멤버십 약관</a></li>'
	templ += '		<li class=""><a href="#tab3_cont">한섬 통합 멤버십 이용약관</a></li>'
	templ += '		<li class=""><a href="#tab4_cont">한섬 우수고객 서비스 이용약관</a></li>'
	templ += '	</ul>'
		
	templ += '	<!-- 탭1 -->'
	templ += '	<div id="tab1_cont" class="tab-cont on">'
	templ += '		<div class="scroll-box cont01">'
	templ += '			<div class="terms_box"></div>'
	templ += '		</div>'
	templ += '	</div>'
	
	templ += '	<!-- 탭2 -->'
	templ += '	<div id="tab2_cont" class="tab-cont">'
	templ += '		<div class="scroll-box cont02">'
	templ += '			<div class="terms_box"></div>'
	templ += '		</div>'
	templ += '	</div>'

	templ += '	<!-- 탭3 -->'
	templ += '	<div id="tab3_cont" class="tab-cont">'
	templ += '		<div class="scroll-box cont03">'
	templ += '			<div class="terms_box"></div>'
	templ += '		</div>'
	templ += '	</div>'
	
	templ += '	<!-- 탭4 -->'
	templ += '	<div id="tab4_cont" class="tab-cont">'
	templ += '		<div class="scroll-box cont04">'
	templ += '			<div class="terms_box"></div>'
	templ += '		</div>'
	templ += '	</div>'
	// templ += '<div class="scroll-box">'
	// templ += '	<div class="terms_box"></div>' //20.08.24 추가 (UI깨짐현상 방지)
	// templ += '</div>'
	templ += '<div class="btn-box"><button type="button" class="btn-type2-lg" onclick="termsPrint();">인쇄</button></div>' // onclick="termsPrint();" 추가: 개발자 요청

	layerInner.classList.add('layer-temrs-wrap');
	layerInner.innerHTML = templ;

	var box01 = layerInner.querySelector('.cont01 .terms_box'); // H패션몰 서비스 이용약관 20.08.24 수정 (원래 .scroll-box)
	var box02 = layerInner.querySelector('.cont02 .terms_box'); // H패션몰 멤버십 약관 21.02.23 수정
	var box03 = layerInner.querySelector('.cont03 .terms_box'); // H패션몰 멤버십 약관 21.02.23 수정
	var box04 = layerInner.querySelector('.cont04 .terms_box'); // #192358 22.04.07 우수고객 서비스 약관 추가

	layer.open(id);
	
	if (page) {
		var sendmethod = method || 'GET';
		httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200) {
				box01.innerHTML = this.responseText;
				callback && callback();
			}
		}
		httpRequest.open(sendmethod, page, true);
		httpRequest.send();
	}
	
	if (page02) {
		var sendmethod = method || 'GET';
		httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200) {
				box02.innerHTML = this.responseText;
				callback && callback();
			}
		}
		httpRequest.open(sendmethod, page02, true);
		httpRequest.send();
	}
	
	if (page03) {
		var sendmethod = method || 'GET';
		httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200) {
				box03.innerHTML = this.responseText;
				callback && callback();
			}
		}
		httpRequest.open(sendmethod, page03, true);
		httpRequest.send();
	}
	
	if (page04) {
		var sendmethod = method || 'GET';
		httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200) {
				box04.innerHTML = this.responseText;
				callback && callback();
			}
		}
		httpRequest.open(sendmethod, page04, true);
		httpRequest.send();
	}
	
	$(".layer-temrs-wrap .ui-tab li a").click(function(){
		$(".layer-temrs-wrap .ui-tab li a").closest("li").removeClass("on");
		$(this).closest("li").addClass("on");
		$(".layer-temrs-wrap .ui-tab .tab-cont").removeClass("on");
		$($(this).attr("href")).addClass("on");
		return false;
	});
	
}

/* 하단 고정 버튼 */
var fixedBtn = function() {
	var fixedWrap = document.querySelector('.fixed-btn');
	var fix = function(){
		var scrollTop = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);
		if(fixedWrap) {
			var footer = document.querySelector('#footer');
			var fixedWrapH = fixedWrap.clientHeight;
			var winH = window.innerHeight;
			var footerTop = footer.offsetTop;
			var fixedTop = footerTop - fixedWrapH;
			if(scrollTop + winH >= footerTop) {
				fixedWrap.style.cssText = 'position:absolute;bottom:auto;top:'+fixedTop+'px';
			} else {
				fixedWrap.removeAttribute('style');
			}
		}
	}
	window.addEventListener('scroll', function(){fix()});
}

/* 상품 퀵뷰 */
var quickView = {
	slideObj : {},
	open : function(id) {
		layer.open(id);
		slide.create(id);
	},
	close : function(id) {
		layer.close(id);
		setTimeout(function(){
			for (var s in quickView.slideObj[id]) {
				quickView.slideObj[id][s].destroy();
			}
		},300);
	}
}

/* 파이차트 */
var pieChart = function() {
	var chart = document.querySelectorAll('.piechart');
	[].forEach.call(chart, function(item){
		var rotate = item.querySelector('.rotate');
		var percent = item.querySelector('.num').innerText;
		var calc = 360 * percent / 100;
		if(calc > 180) item.classList.add('over');
		rotate.style.cssText = 'transform:rotate('+calc+'deg);'
	});
}

var pieChartSum = function() {
	var wrap = document.querySelectorAll('.piechart-wrap');
	[].forEach.call(wrap, function(elm){
		var items = elm.querySelectorAll('.piechart');
		var roll = 0;
		[].forEach.call(items, function(item){
			var rotate = item.querySelector('.rotate');
			var num = item.querySelector('.num').innerText;
			var calc = 360 * num / 100;
			if(calc > 180) item.classList.add('over');
			item.style.cssText = 'transform:rotate('+roll+'deg);';
			rotate.style.cssText = 'transform:rotate('+calc+'deg);';
			roll += calc;
		});
	});
}
/* 상품 수량 조절 */
var quantityCalc = function(state) {
	var _this = event.currentTarget || event.srcElement;
	var wrap = clst.find(_this, 'item-count');
	var inputNum = wrap.querySelector('.input-num');
	var quantity = inputNum.value;
	if(state == 'plus') {
		quantity++;
	} else if(state == 'minus' && quantity > 1) {
		quantity--;
	}	
	inputNum.value = quantity;
	inputNum.onkeyup();
}

/* 상품 최대 수량 체크 */
var quantityMax = function(max, callBack) {
	var _this = event.target || event.srcElement;;
	var wrap = clst.find(_this, 'item-count');
	var inputNum = wrap.querySelector('.input-num');
	inputNum.value = numberCheck(inputNum.value);
	if(parseInt(inputNum.value) > parseInt(max)) {
		inputNum.value = max;
		if(typeof callBack != 'undefined' && callBack){
			if(typeof callBack == 'function'){
				callBack();
			} else {
				if(callBack) { eval( callBack ); }
			}
		}
	}
}

/* 이미지 파일 등록 */
var fileDel = function(_this) {
	var wrap = clst.find(_this, 'item-box');
	var itemWrap = wrap.querySelector('.item');
	var input = wrap.querySelector('.btn-upload input');
	itemWrap.parentNode.removeChild(itemWrap);
	input.value = '';
}
var fileRe = function(_this) {
	var wrap = clst.find(_this, 'item-box');
	var input = wrap.querySelector('.btn-upload input');
	input.click();
}
var fileUpload = function(_this) {
	var wrap = clst.find(_this, 'item-box');
	var itemWrap = document.createElement("span");
	var val = _this.value;
		
	if(/\.(gif|jpg|jpeg|png)$/i.test(val)) {
		var tag = '<img src="" class="thumb">'
	} else if(/\.(mp4)$/i.test(val)) {
		var tag = '<video src="" class="thumb"></video>'
	} else {
		if(val != '') alert('등록 할 수 없는 파일 입니다.');
		return false;
	}
	var template = tag + '<button type="button" class="btn-del" onclick="fileDel(this);"><span>등록 이미지 삭제</span></button><button type="button" class="btn-re" onclick="fileRe(this);"><span>파일 재등록</span></button>'
	
	if(wrap.querySelector('.item') != null) {
		var item = wrap.querySelector('.item');
		item.parentNode.removeChild(item);
	}
	itemWrap.classList.add('item');
	itemWrap.innerHTML = template;

	if(itemWrap.length) itemWrap.parentNode.removeChild(itemWrap);

	wrap.appendChild(itemWrap);
	
	var target = wrap.querySelector('.item .thumb');

	var reader = new FileReader();

	reader.addEventListener('load', function(){
		target.src = reader.result;
	});

	reader.readAsDataURL(_this.files[0]);
}

/* 리뷰 작성 - 상품 선택 */
var reviewProductSel = function(_this) {
	var wrap = _this.parentNode;
	var list = wrap.querySelector('.list');
	slideToggle(list, 300, 'open');
	wrap.classList.toggle('active');
}
var reviewItemSel = function() {
	var _this = event.currentTarget || event.srcElement;
	var container = clst.find(_this, 'layer-container');
	var wrap = clst.find(_this, 'review-product-select');
	var btn = wrap.querySelector('.btn-sel')
	var list = wrap.querySelector('.list');
	var item = clst.find(_this, 'item');
	var brand = item.querySelector('.item-brand');
	var name = item.querySelector('.item-name');

	if(brand != null) {
		var template = '<span class="brand">'+brand.innerText+'</span><span class="name">'+name.innerText+'</span>';
	} else {
		var template = '<span class="name">'+name.innerText+'</span>';
	}

	btn.innerHTML = template;

	wrap.classList.remove('active');
	slideClose(list, 300, 'open');

	scrollMov(0, 1, container);
}

/* 숫자 체크 */
var numberCheck = function(val) {
	if((48 >= event.keyCode && event.keyCode <= 57) && (96 >= event.keyCode && event.keyCode <= 105)) {
		return val;
	} else {
		return val.replace(/[^0-9]/g,'');
	}
}
/* 세자리 콤마 */
var numberWithCommas = function(val) {
	return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
/* 금액 입력 체크 */
var typeMoney = function(_this) {
	_this.value = numberCheck(_this.value);
	_this.value = numberWithCommas(_this.value);
}

/* 상품 필터 */
var filterOpen = function() {
	var _this = event.currentTarget || event.srcElement;
	var filterWrap = clst.find(_this, 'list-filter');
	var filterMenu = filterWrap.querySelectorAll('.filter-menu');
	if(filterWrap.classList.contains('open')) {
		[].forEach.call(filterMenu, function(el){
			if(el.classList.contains('active')) el.classList.remove('active');
		});
	}
	filterWrap.classList.toggle('open');
}
var filterCateOpen = function() {
	var _this = event.currentTarget || event.srcElement;
	var filterWrap = clst.find(_this, 'list-filter');
	var filterMenu = filterWrap.querySelectorAll('.filter-menu');
	// [].forEach.call(filterMenu, function(el){
	// 	if(el.classList.contains('active')) el.classList.remove('active');
	// });
	// _this.parentNode.classList.toggle('active');

	var $this = $(_this).closest('.filter-menu');
	if ($this.is('.active')) {
		$this.removeClass('active');
		$(filterWrap).find('.btn-filter').removeClass('active');
	}
	else {
		$this.addClass('active').siblings().removeClass('active');
		$(filterWrap).find('.btn-filter').addClass('active');
	}

	$(filterWrap).off('click.hidefilter').on('click.hidefilter', '.btn-filter.active',function(){
		$(filterWrap).find('.filter-menu').removeClass('active');
	});
};
var filterCategory = function() {
	
	/**
		1. 마지막 뎁스에는 하위 뎁스가 1개만 있더라도 전체 상품 체크 항목 항상 표시
		2. 하위 뎁스에 체크된 항목이 1개라도 있을 경우 상위 뎁스에 체크 표시 on
		3. 상위 뎁스를 열어서 하위 뎁스를 펼칠 경우 전체 상품 선택 체크가 디폴트 (하위에 체크된 항목이 0일 경우)
		4. 다중 선택 가능
		5. 적용할 카테고리 버튼 목록은 마지막 뎁스 항목만, 해당 카테고리 명만 기재하여 표시하고(여성/티셔츠 X, 티셔츠 O), 사용자가 체크했던 시간 순서대로 나열
	*/

	var $catewrap = $('.filter-menu.category');
	var $hasdepth = $catewrap.find('button.filter-view-lower');
	var $sellist = $catewrap.find('.sel-list:not(".depth01")');

	function hideLower($wrap) {
		if ($wrap.is('.depth01')) {
			$catewrap.find('.depth02').hide();
			$catewrap.find('.depth03').hide();
			$catewrap.find('.depth04').hide();
			$catewrap.find('.depth05').hide();
		}

		if ($wrap.is('.depth02')) {
			$catewrap.find('.depth03').hide();
			$catewrap.find('.depth04').hide();
			$catewrap.find('.depth05').hide();
		}

		if ($wrap.is('.depth03')) {
			$catewrap.find('.depth04').hide();
			$catewrap.find('.depth05').hide();
		}

		if ($wrap.is('.depth04')) {
			$catewrap.find('.depth05').hide();
		}
	}

	function uncheckLower($wrap) {

		$wrap.find('.filter-view-lower').each(function(){
			var $this = $(this);
			var target = $this.data('target');

			setTimeout(function(){
				var $target = $('[data-rel="' + target + '"]');

				$target.find('input').prop('checked', false).trigger('change');
				$target.find('.on').removeClass('on');
				$target.find('.active').removeClass('active');
			}, 10);

		});
		
	}
	
	
	$hasdepth.on('click', function () {
		var $this = $(this);
		var $wrap = $this.closest('.sel-list');
		var $target = $('[data-rel="' + $this.data('target') + '"]');

		hideLower($wrap);

		if (!$this.is('.active')) {
			$this.siblings().removeClass('active');
			$this.addClass('active');
			$target.show();
			
			if (!$target.find('input:checked').length && !$target.find('.on').length) {
				$target.find('.check-all').prop('checked', true).trigger('change');
				$this.addClass('on');
			}

			if ($target.find('input:checked').length || $target.find('.on').length) {
				$this.addClass('on');
			}
			else {
				$this.removeClass('on');
			}

			$wrap.find('.check-all').prop('checked', false).trigger('change');
		}
		else {
			$this.removeClass('active');
		}

		$('.sel-list').niceScroll(dScroll.opt);
	});

	$catewrap.on('change', 'input', function(){
		var $this = $(this);
		var $wrap = $this.closest('.sel-list');
		var rel = $wrap.data('rel');

		if ($this.is(':checked')) {
			while ($('[data-target="' + rel + '"]').length) {
				$catewrap.find('[data-target="' + rel + '"]').addClass('on');
				rel = $catewrap.find('[data-target="' + rel + '"]').closest('.sel-list').data('rel');
			}

			var str = $this.next().clone().children().remove().end().text();

			if ($this.is('.check-all')) {
				str = $('[data-target="' + $wrap.data('rel') + '"]').find('> span').clone().children().remove().end().text();
			}
			var rand = Math.floor( Math.random() * 1000000 );
			// var $button = $('<button class="filter-rel-' + rand + '" data-ga-name="' + str + '">' + str + '</button>');
			var $button = $('<button class="filter-rel-' + rand + '" data-ga-name="카테고리"><span>' + str + '</span></button>');

			$button.data('originalTarget', $this);

			$('.selected-filter').append($button);

			$button.on('click', function(){
				var self = $(this);
				self.data('originalTarget').prop('checked', false).trigger('change');
				$('.selected-filter').find(self).remove();
			});

			$this.data('filterSelected', 'filter-rel-' + rand);
		}
		else {
			// 선택된 항목이 없다면 상위 체크 해제
			if (!$wrap.find('input:checked').length && !$wrap.find('.on').length) {
				$('[data-target="' + rel + '"]').removeClass('on');
			}

			if ($this.data('filterSelected')) {
				$('button.' + $this.data('filterSelected')).remove();
			}
		}
		
		if (!$this.is('.check-all') && $this.is(':checked')) {
			$this.parent().siblings().find('.check-all').prop('checked', false).trigger('change');

			hideLower($wrap);
		}

		if ($this.is('.check-all') && $this.is(':checked')) {
			$this.parent().siblings().find('input').prop('checked', false).trigger('change');
			$this.parent().siblings().removeClass('active on');

			hideLower($wrap);
			uncheckLower($wrap);
		}

		if (!$this.is('.check-all')) {
			$this.parent().siblings().removeClass('active');
		}
		
	});

};

var filterCategoryLoad = function(){
	var $catewrap = $('.filter-menu.category');
	$catewrap.find('input:checked').each(function(){
		var $this = $(this);

		$this.trigger('change');
	});
};

var filterSelLoad = function(){
	var $filterWrap = $('.filter-menu:not(.category)');

	$filterWrap.find('input:checked').each(function(){
		var $this = $(this);
		$this.trigger('click');
	});
};

var filterPriceLoad = function(){
	var priceBar = $('#priceFilter');
	var priceWrap = priceBar.closest('.filterSlideWrap');

	if (!priceWrap.find("[data-name=fPriceSelf1]").val() && !priceWrap.find("[data-name=fPriceSelf2]").val()) return;

	priceWrap.find("[data-name=fPriceSelf1]").trigger('input');
	priceWrap.find("[data-name=fPriceSelf2]").trigger('input');
};

var filterSaleLoad = function(){
	var saleBar = $('#saleFilter');
	var saleWrap = saleBar.closest('.filterSlideWrap');

	if (!saleWrap.find("[data-name=fSaleSelf1]").val() && !saleWrap.find("[data-name=fSaleSelf2]").val()) return;
	saleWrap.find("[data-name=fSaleSelf1]").trigger('input');
	saleWrap.find("[data-name=fSaleSelf2]").trigger('input');
};

// 초기에 선택된 필터 항목들이 있을 때 호출
var filterLoad = function(){
	filterCategoryLoad();
	filterSelLoad();
	filterPriceLoad();
	filterSaleLoad();
};

var nextDepthOpen = function() {
	var _this = event.currentTarget || event.srcElement;
	var cell = clst.find(_this, 'sel-list');
	var next = nextFind(cell);
	next.classList.add('open');
	$('.sel-list').niceScroll(dScroll.opt);
	filterSel();
}
var filterSel = function() {

	// (event.preventDefault) ? event.preventDefault() : event.returnValue = false;
	
	var selectedWrap = document.querySelector('.selected-filter'); 
	var selFilter = selectedWrap.querySelectorAll('button');

	var target = event.target || event.srcElement;
	var label = clst.find(target, 'label');
	var _this = label.querySelector('input');
	// var name = _this.getAttribute('name');
	var name = $(_this).data('name');
	var item = _this.nextElementSibling.cloneNode(true);

	var tag = document.createElement('button');
	tag.setAttribute('type', 'button');
	tag.setAttribute('class', name);
	tag.setAttribute('onclick', 'filterDel()');
	tag.appendChild(item);

	// 개발 요청 추가 , undefined 조건 추가
	if(typeof $(target).closest('.filter-menu').children('button')[0] != 'undefined'){
		$(tag).attr('data-ga-name', $(target).closest('.filter-menu').children('button')[0].innerText);
	}

	if(tag.querySelector('.num') != null) {
		var num = tag.querySelector('.num');
		num.parentNode.removeChild(num);
	}

	if(_this.checked) {
		_this.checked = false;
		[].forEach.call(selFilter, function(obj){
			if(obj.classList.contains(name)) {
				obj.parentNode.removeChild(obj);
			}
		});
		if(selFilter.length == 0) {selectedWrap.classList.remove('show');}
	} else {
		_this.checked = true;
		if(selFilter.length) {
			[].forEach.call(selFilter, function(obj){
				if(obj.classList.contains(name)) {
					obj.parentNode.removeChild(obj);
					selectedWrap.appendChild(tag);
				} else {
					selectedWrap.appendChild(tag);
				}
			});
		} else {
			selectedWrap.appendChild(tag);
		}
	};
	try {
		// _this.onchange();
		$(_this).trigger('change');
	} catch(e) {
		console && console.log(e);
	}
}
var priceInit = function(min, max) {
	var priceBar = document.querySelector('#priceFilter');
	var wrap = clst.find(priceBar, 'filterSlideWrap');
	var className = 'fPrice';
	
	var tag = document.createElement('button');
	tag.setAttribute('type', 'button');
	tag.setAttribute('class', className);
	tag.setAttribute('onclick', 'filterDel()');

	// 개발 요청 추가
	$(tag).attr('data-ga-name', $(wrap).closest('.filter-menu').children('button')[0].innerText);

	var minInput = wrap.querySelector('input[data-name="fPriceSelf1"]');
	var maxInput = wrap.querySelector('input[data-name="fPriceSelf2"]');
	var btn = wrap.querySelector('.btn-search');

	minInput.addEventListener('keyup', function(){numberCheck(this.value);});
	maxInput.addEventListener('keyup', function(){numberCheck(this.value);});

	var minVal = wrap.querySelector('input[data-name="fPriceMin"]');
	var maxVal = wrap.querySelector('input[data-name="fPriceMax"]');
	minVal.value = min * 10000;
	maxVal.value = max * 10000;

	minInput.addEventListener('keyup', function(){numberCheck(this.value);});
	maxInput.addEventListener('keyup', function(){numberCheck(this.value);});

	// btn.addEventListener('click', function(){
		
	// 	var selectedWrap = document.querySelector('.selected-filter'); 
	// 	if(minInput.value != '' && maxInput.value != '') {
	// 		var item = '<span>'+numberWithCommas(minInput.value)+'원 ~  '+numberWithCommas(maxInput.value)+'원</span>'
	// 		tag.innerHTML = item;
	// 		minVal.value = minInput.value;
	// 		maxVal.value = maxInput.value;
			
	// 		if(selectedWrap.querySelector(className)) {
	// 			selectedWrap.querySelector(className).innerHTML = item;
	// 		} else {
	// 			tag.innerHTML = item;
	// 			selectedWrap.appendChild(tag);
	// 		}
	// 	} else {
	// 		return false;
	// 	}
	// 	minVal.onchange();
	// 	maxVal.onchange();
	// });

	// var minTxt = priceBar.querySelector('.min-txt span');
	// var maxTxt = priceBar.querySelector('.max-txt span');
	// minTxt.innerText = min;
	// maxTxt.innerText = max;

	noUiSlider.create(priceBar, {
		start: [min, max],
		connect: true,
		tooltips: [true, true],
		range: {
			'min': min,
			'max': max
		},
		format: {
			to : function(value) {
				return Math.floor(value);
			},
			from : function(value) {
				return Math.floor(value);
			}
		} 
	});
	priceBar.noUiSlider.on('change', function(values, handle){
		var selectedWrap = document.querySelector('.selected-filter'); 

		if (handle) {
			if(values[handle] > 0) max = values[handle] + '만';
			maxVal.value = values[handle] * 10000;
		} else {
			if(values[handle] > 0) min = values[handle] + '만';
			minVal.value = values[handle] * 10000;
		}

		var item = '<span>'+min+'원 ~ '+max+'원</span>'

		minVal.onchange();
		maxVal.onchange();

		if(selectedWrap.querySelector(className)) {
			selectedWrap.querySelector(className).innerHTML = item;
		} else {
			tag.innerHTML = item;
			selectedWrap.appendChild(tag);
		}
	});

	priceBar.noUiSlider.on('update', function (values, handle) {
		$(priceBar).find('.noUi-handle-lower .noUi-tooltip').text(values[0] + '만원');
		$(priceBar).find('.noUi-handle-upper .noUi-tooltip').text(values[1] + '만원');
	});

	priceBar.noUiSlider.on('slide', function (values, handle) {
		
		$(minVal).val(values[0] * 10000);
		$(maxVal).val(values[1] * 10000);

		$(minInput).val(values[0] * 10000);
		$(maxInput).val(values[1] * 10000);

		min = values[0] + '만';
		max = values[1] + '만';
	});

	$(minInput).on('input', function () {
		priceBar.noUiSlider.set([this.value / 10000, null]);

		if (maxInput.value === '') {
			maxInput.value = 500;
		}

		// $(btn).trigger('click');
		setSelected();
	});

	$(maxInput).on('input', function () {
		priceBar.noUiSlider.set([null, this.value / 10000]);

		if (minInput.value === '') {
			minInput.value = 0;
		}

		// $(btn).trigger('click');
		setSelected();
	});

	function setSelected(){
		var selectedWrap = document.querySelector('.selected-filter'); 
		if(minInput.value != '' && maxInput.value != '') {
			var item = '<span>'+numberWithCommas(minInput.value)+'원 ~ '+numberWithCommas(maxInput.value)+'원</span>'
			tag.innerHTML = item;
			minVal.value = minInput.value;
			maxVal.value = maxInput.value;
			
			if(selectedWrap.querySelector(className)) {
				selectedWrap.querySelector(className).innerHTML = item;
			} else {
				tag.innerHTML = item;
				selectedWrap.appendChild(tag);
			}
		} else {
			return false;
		}
		minVal.onchange();
		maxVal.onchange();
	}
}

var saleInit = function(min, max) {
	var saleBar = document.querySelector('#saleFilter');
	var wrap = clst.find(saleBar, 'filterSlideWrap');
	var className = 'fSale';
	
	var tag = document.createElement('button');
	tag.setAttribute('type', 'button');
	tag.setAttribute('class', className);
	tag.setAttribute('onclick', 'filterDel()');

	// 개발 요청 추가
	$(tag).attr('data-ga-name', $(wrap).closest('.filter-menu').children('button')[0].innerText);

	var minInput = wrap.querySelector('input[data-name="fSaleSelf1"]');
	var maxInput = wrap.querySelector('input[data-name="fSaleSelf2"]');
	var btn = wrap.querySelector('.btn-search');

	var minVal = wrap.querySelector('input[data-name="fSaleMin"]');
	var maxVal = wrap.querySelector('input[data-name="fSaleMax"]');
	minVal.value = min;
	maxVal.value = max;

	// btn.addEventListener('click', function(){

	// 	var selectedWrap = document.querySelector('.selected-filter'); 
	// 	if(minInput.value != '' && maxInput.value != '') {
	// 		var item = '<span>'+minInput.value+'% ~ '+maxInput.value+'%</span>';

	// 		tag.innerHTML = item;
	// 		minVal.value = minInput.value;
	// 		maxVal.value = maxInput.value;
			
	// 		if(selectedWrap.querySelector(className)) {
	// 			selectedWrap.querySelector(className).innerHTML = item;
	// 		} else {
	// 			tag.innerHTML = item;
	// 			selectedWrap.appendChild(tag);
	// 		}
	// 	} else {
	// 		return false;
	// 	}
	// 	minVal.onchange();
	// 	maxVal.onchange();
	// });

	noUiSlider.create(saleBar, {
		start: [min, max],
		connect: true,
		tooltips: [true, true],
		range: {
			'min': min,
			'max': max
		},
		format: {
			to : function(value) {
				return Math.floor(value);
			},
			from : function(value) {
				return Math.floor(value);
			}
		} 
	});
	saleBar.noUiSlider.on('change', function(values, handle){
		var selectedWrap = document.querySelector('.selected-filter'); 
		if (handle) {
			max = values[handle];
			// maxVal.value = max.split('%')[0];
			maxVal.value = max;
		} else {
			min = values[handle];
			// minVal.value = min.split('%')[0];
			minVal.value = min;
		}
		minVal.onchange();
		maxVal.onchange();

		var item = '<span>'+min+'% ~ '+max+'%</span>'

		if(selectedWrap.querySelector(className)) {
			selectedWrap.querySelector(className).innerHTML = item;
		} else {
			tag.innerHTML = item;
			selectedWrap.appendChild(tag);
		}
	});

	saleBar.noUiSlider.on('update', function (values, handle) {
		$(saleBar).find('.noUi-handle-lower .noUi-tooltip').text(values[0] + '%');
		$(saleBar).find('.noUi-handle-upper .noUi-tooltip').text(values[1] + '%');
	});

	saleBar.noUiSlider.on('slide', function (values, handle) {
		
		$(minVal).val(values[0]);
		$(maxVal).val(values[1]);

		$(minInput).val(values[0]);
		$(maxInput).val(values[1]);

		min = values[0];
		max = values[1];
	});

	$(minInput).on('input', function () {
		saleBar.noUiSlider.set([this.value, null]);

		if (maxInput.value === '') {
			maxInput.value = 100;
		}

		// $(btn).trigger('click');
		setSelected();
	});

	$(maxInput).on('input', function () {
		saleBar.noUiSlider.set([null, this.value]);

		if (minInput.value === '') {
			minInput.value = 0;
		}

		// $(btn).trigger('click');
		setSelected();
	});

	function setSelected(){
		var selectedWrap = document.querySelector('.selected-filter'); 
		if(minInput.value != '' && maxInput.value != '') {
			var item = '<span>'+minInput.value+'% ~ '+maxInput.value+'%</span>';

			tag.innerHTML = item;
			minVal.value = minInput.value;
			maxVal.value = maxInput.value;
			
			if(selectedWrap.querySelector(className)) {
				selectedWrap.querySelector(className).innerHTML = item;
			} else {
				tag.innerHTML = item;
				selectedWrap.appendChild(tag);
			}
		} else {
			return false;
		}
		minVal.onchange();
		maxVal.onchange();
	}
}

var filterReset = function() {
	var wrap = document.querySelector('.selected-filter');
	var btn = wrap.querySelectorAll('button');
	var filterWrap = document.querySelector('.list-filter');
	var input = filterWrap.querySelectorAll('input');

	// [].forEach.call(btn, function(obj) {
	// 	if(!obj.classList.contains('btn-reset')) obj.parentNode.removeChild(obj);
	// });
	// [].forEach.call(input, function(_this){
	// 	if(_this.checked == true) {
	// 		_this.checked = false;
	// 	} else if (_this.value.length > 0) {
	// 		_this.value = '';
	// 	}
	// });

	var $catewrap = $('.filter-menu.category');
	$catewrap.find('.depth02').hide();
	$catewrap.find('.depth03').hide();
	$catewrap.find('.depth04').hide();
	$catewrap.find('.on').removeClass('on');
	$catewrap.find('.active').removeClass('active');

	document.querySelector('#priceFilter') && document.querySelector('#priceFilter').noUiSlider.set([0, 500]);
	document.querySelector('#saleFilter') && document.querySelector('#saleFilter').noUiSlider.set([0, 100]);
}
var filterDel = function() {
	var _this = event.target || event.srcElement;
	var cls = _this.className;
	var filterWrap = document.querySelector('.list-filter');
	var input = filterWrap.querySelectorAll('input');

	_this.parentNode.removeChild(_this);
	// [].forEach.call(input, function(_this){
	// 	if(_this.getAttribute('name') == cls) {
	// 		_this.checked = false;
	// 	}
	// });

	$('[data-name="' + cls + '"]').prop('checked', false).trigger('change');

	var selectedWrap = document.querySelector('.selected-filter'); 
	var selFilter = selectedWrap.querySelectorAll('button');
	if(selFilter.length < 2) {selectedWrap.classList.remove('show');}

	if ($(_this).is('.fPrice')) {
		document.querySelector('#priceFilter').noUiSlider.set([0, 500]);
		$('#priceFilter').parent().find('input').val('');
		$('#priceFilter').trigger('delete');
	}

	if ($(_this).is('.fSale')) {
		document.querySelector('#saleFilter').noUiSlider.set([0, 100]);
		$('#saleFilter').parent().find('input').val('');
		$('#saleFilter').trigger('delete');
	}
}

var filterPadding = function(){
	$(document).on('click', '.list-head', function(e){
		if ($('.filter-menu.active').length) {
			$(e.currentTarget).css('margin-bottom', $('.filter-menu.active').find('.filter-sub').outerHeight(true) + 20 + 'px');
		}
		else {
			$(e.currentTarget).removeAttr('style');
		}
	});
};

/* 상품 필터 */
var imgActive = function(el) {
	var src = el.querySelector('img').getAttribute('src');
	var wrap = clst.find(el, 'swiper-slide');
	var img = wrap.querySelector('.item-img img');

	tabActive(el, 'item-thumb', 'li', 'active');

	img.setAttribute('src', src);
}

/* 탭 활성화 */
var tabActive = function(_this, wrapEl, listEl, className) {
	var tabWrap = clst.find(_this, wrapEl);
	var list = childFind(tabWrap, listEl);
	[].forEach.call(list, function(_this) {
		if(_this.classList.contains(className)) _this.classList.remove(className);
	});
	_this.parentNode.classList.add(className);
}

/* 탭 앵커 */
var anchor = function(id) {
	var _this = event.target || event.srcElement;

	if( clst.find(_this, 'promo-list-Anchor') ){
		tabActive(_this, 'ul', 'li', 'active');
	}

	if(document.querySelector(id)) {
		var elm = document.querySelector(id);
		scrollMov(elm, 200);
	}
}

/* 기획전 탭 앵커 스크롤 */
var anchorScroll = function(id) {
	var offset = -77;
	var _this = event.target || event.srcElement;

	if(document.querySelector(id)) {
		var elm = document.querySelector(id);
		// scrollMov(elm, 200);

		$('html, body').animate({
			scrollTop: $(elm).offset().top + (offset ? offset : 0)
		}, 300, function(){
			
		});
	}
}

/* 이미지 전체 화면 보기 */
var layerViewImg = function(img, idx) {

	layer.create('layerViewImgs');
	var layerWrap = document.querySelector('#layerViewImgs');
	var layerContainer = layerWrap.querySelector('.layer-container');

	layerWrap.classList.add('attached-img');
	var template = '';
	template += '<div class="layer-view-img">'
	template += '	<div class="slide-nav">';
	template += '		<button type="button" class="slide-nav-prev">이전</button>';
	template += '		<button type="button" class="slide-nav-next">다음</button>';
	template += '	</div>';
	template += '	<div class="slide-container">';
	template += '		<ul class="swiper-wrapper">';
	template += '		</ul>';
	template += '		<div class="slide-pagination type1"></div>';
	template += '	</div>';
	template += '</div>'

	layerContainer.innerHTML = template;

	var imgSrc = [];
	var index = 0;
	if(!img) {
		var _this = event.target || event.srcElement;
		var wrap = clst.find(_this, 'files');
		var list = wrap.querySelectorAll('.img-file');
		[].forEach.call(list, function(el, idx){
			var prnt = $(_this).closest('li')[0];
			if(prnt === el) index = idx;
			// var img = el.querySelector('img');
			// imgSrc.push(img.cloneNode(true));

			var img = el.querySelector('img');
			var cl = $(img).clone();

			if ($(img).data('originalTransform')) {
				cl[0].style.transform = $(img).data('originalTransform');
			}
			
			imgSrc.push(cl[0]);
		});
	} else {
		imgSrc = img;
		index = idx;
	}
	
	var slideWrap = document.querySelector('#layerViewImgs');
	var slideWrapper = slideWrap.querySelector('.swiper-wrapper');
	imgSrc.forEach(function(node){
		var slideList = document.createElement('li');
		slideList.setAttribute('class', 'swiper-slide');
		slideList.innerHTML = '<div class="box"></div>';
		var box = slideList.querySelector('.box');
		if(node.tagName == "IMG") {
			slideList.innerHTML = '<div class="box"><div class="img"></div></div>';
			box = slideList.querySelector('.img') 
		}
		box.appendChild(node);
		slideWrapper.appendChild(slideList);
	});

	layer.open('layerViewImgs');
	$('#layerViewImgs').css('opacity', 0);
	setTimeout(function(){
		slide.create('layerViewImgs');

		if (slide.obj.layerViewImgs) {
			// loop모드 일 경우
			if (slide.obj.layerViewImgs.params.loop) {
				slide.obj.layerViewImgs.slideToLoop(index, 0);
			}
			else {
				slide.obj.layerViewImgs.slideTo(index + 1, 0);
			}
		}

		$('#layerViewImgs').css('opacity', 1);
		
	}, 100)
	
	
}
/* 동영상 전체 화면 보기 */
var layerViewVod = function(vodId, tagId, type) {

	layer.create('layerViewVod');
	var layerWrap = document.querySelector('#layerViewVod');
	var layerContainer = layerWrap.querySelector('.layer-container');

	layerWrap.classList.add('attached-img');
	layerWrap.classList.add('layer-vod-full');
	var template = '';
	template += '<div class="layer-view-vod">'
	template += '	<div class="vod-cont">'
	template += '		<div class="vod-box">'
	template += '			<div id="'+tagId+'"></div>'
	template += '		</div>'
	template += '	</div>'
	template += '</div>'

	layerContainer.innerHTML = template;

	vodPlayer.create(vodId, tagId, type, 'auto');
	layer.open('layerViewVod');
}

/* 토글 버튼 */
var toggleBtn = function(_this) {
	var wrap = clst.find(_this, 'toggle-wrap');
	var list = wrap.querySelector('.toggle-box');
	slideToggle(list, 300, 'open');
	wrap.classList.toggle('active');
}

// 이벤트 댓글 자세히 보기 버튼
var commentDetail = function(_this) {
	var commentWrap = clst.find(_this, 'cmt-content');
	commentWrap.classList.toggle('show');
}

// 댓글 버튼 노출 함수 - 20.10.08 추가 
function commentAllbutton() {
	$('.cmt-txt').each(function() {
		
		var clientHeight = $(this).prop("clientHeight");
		var scrollHeight = $(this).prop("scrollHeight");									

		if($(this).siblings('.cmt-img').length > 0 || clientHeight < scrollHeight) {
			$(this).siblings('.btn-cmt-all').css("display","block");
		}
	});
}

/* 툴팁 */
var tooltip = function(cls, type, ajaxurl, ajaxcallback, ajaxmethod) {
	var _this = event.target || event.srcElement;
	var tooltipLayer = document.createElement('div');
	tooltipLayer.classList.add('layerTooltip');
	tooltipLayer.innerHTML = '<div class="cont"></div><button type="button" class="btnTooltipClose">툴팁닫기</button>';
	var layer = clst.find(_this, 'layer-pop');
	var wrap, posX, posY;
	(layer == undefined) ? wrap = document.body : wrap = layer;
	var pos = function(){
		var _thisPos = _this.getBoundingClientRect();
		var scrTop;
		if(layer == undefined) {
			scrTop = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);
		} else {
			scrTop = wrap.scrollTop;
		}
		
		posX = _thisPos.left;
		posY = _thisPos.top + scrTop + 35;

		if(wrap.scrollHeight <= tooltipWrap.clientHeight + posY) posY = _thisPos.top + scrTop - tooltipWrap.clientHeight - 10;
		if(wrap.scrollWidth <= tooltipWrap.clientWidth + posX) posX = posX - tooltipWrap.clientWidth + 18;
		
		tooltipWrap.style.cssText = 'position:absolute;top:'+posY+'px; left:'+posX+'px;';
	}


	if(document.querySelector('.layerTooltip')) {
		var tooltipWrap = document.querySelector('.layerTooltip');
		tooltipWrap.parentNode.removeChild(tooltipWrap);
	} 
	(type == 'fix') ? _this.parentNode.appendChild(tooltipLayer) : wrap.appendChild(tooltipLayer);

	var tooltipWrap = document.querySelector('.layerTooltip');
	var btnClose = tooltipWrap.querySelector('.btnTooltipClose');

	tooltipWrap.addEventListener('mouseleave', function(){
		(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;
		tooltipWrap.parentNode.removeChild(tooltipWrap);
	});
	
	btnClose.addEventListener('click', function(){
		(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;
		tooltipWrap.parentNode.removeChild(tooltipWrap);
	});

	if(!document.querySelector('.'+cls)) {

		if (ajaxurl) {
			var sendmethod = ajaxmethod || 'GET';

			httpRequest = new XMLHttpRequest();
			httpRequest.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200) {
					var tempWrap = document.createElement('div');
					tempWrap.innerHTML = this.responseText;
					var elm = tempWrap.querySelector('.'+cls);
					tooltipWrap.querySelector('.cont').appendChild(elm);
					if(type != 'fixed') {
						pos();
						window.addEventListener('resize', function(){
							pos();
						});
					}

					ajaxcallback && ajaxcallback();
				}
			}

			httpRequest.open(sendmethod, ajaxurl, true);
			httpRequest.send();
		}
	} else {
		var clone = document.querySelector('.'+cls).cloneNode(true);
		clone.removeAttribute('style');
		tooltipWrap.querySelector('.cont').appendChild(clone);
		if(type != 'fixed') {
			pos();
			window.addEventListener('resize', function(){
				pos();
			});
		}
	}
}

var brandlistShow = function() {
	(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;
	var _this = event.target || event.srcElement;
	var parent = clst.find(_this, 'item-brand');
	parent.classList.toggle('open');
	window.addEventListener('click', function(){
		parent.classList.remove('open');
	});
}

/* 디자인 스크롤 */
var dScroll = {
	opt : {
		cursorcolor: '#ccc',
		cursorwidth: '6px',
		cursorborder: 0,
		autohidemode: false,
	},
	active : function() {
		$('html').niceScroll(dScroll.opt);
	}
}

/* 인풋 작성 값 삭제, 패스워드 보기 */
var inputBox = function(wrap) {
	var wrap = document.querySelector(wrap);
	if(wrap) {
		var inputBox = wrap.querySelectorAll('.input-box');
		[].forEach.call(inputBox, function(box){
			var input = box.querySelector('.inp-reset');
			var btnClear = box.querySelector('.btn-clear');
			var btnPwShow = box.querySelector('.btn-masking');
			if(btnClear) {
				input.addEventListener('keyup', function(){
					var val = this.value;
					(val.length > 0) ? btnClear.style.display = 'inline-block' : btnClear.style.display = 'none';
				});
				btnClear.addEventListener('click', function(){
					input.value = '';
					btnClear.style.display = 'none';
				});
			}
			if(btnPwShow) {
				btnPwShow.addEventListener('click', function(){
					if(input.getAttribute('type') == 'password') {
						input.setAttribute('type', 'text');
						this.classList.add('text');
					} else {
						input.setAttribute('type', 'password');
						this.classList.remove('text');
					}
				});
			}
		});
	}
}

var popupOnedayClose = function () {
	var _this = event.target || event.srcElement;
	var wrap = clst.find(_this, 'popup-oneday');
	var chk = _this.parentNode.querySelector('input[type="checkbox"]');
	if (chk.checked == true) {
		setCookie(chk.getAttribute('name'), 'hide', 1);
	}
	wrap.style.display = 'none';
}
var bannerOnedayClose = function (cookieNm, classNm) {
	var _this = event.target || event.srcElement;
	var wrap = clst.find(_this, classNm);
	setCookie(cookieNm, 'hide', 1);
	wrap.style.display = 'none';
}
/* 쿠키 */
var setCookie = function(name, value, expiredays) {
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
}
var getCookie = function(key) {
	var cook = document.cookie + ";";
	var idx = cook.indexOf(key, 0);
	var val = "";

	if(idx != -1) {
		cook = cook.substring(idx, cook.length);
		begin = cook.indexOf("=", 0) + 1;
		end = cook.indexOf(";", begin);
		val = unescape( cook.substring(begin, end) );
	}
	return val;
}

var htv = function () {
	var wrap = document.querySelector('.style-tv-top');
	var thumb = wrap.querySelector('.thumbnail-slide');
	var slide = thumb.querySelector('.slide-wrapper');
	var li = slide.querySelectorAll('li');
	var liLeng = li.length;
	var liFisrt = li[0];
	[].forEach.call(li, function (obj, idx) {
		obj.setAttribute('data-idx', idx);
		var clone = obj.cloneNode(true);
		slide.appendChild(clone);
	});

	[].forEach.call(li, function (obj) {
		var clone = obj.cloneNode(true);
		slide.insertBefore(clone, liFisrt);
	});
	slide.style.cssText = 'margin-top: -' + liFisrt.offsetTop + 'px';
	liFisrt.classList.add('current');
	liFisrt.classList.add('active');

	cloneLi = slide.querySelectorAll('li');

	var btnUp = thumb.querySelector('.slide-nav-up');
	var btnDown = thumb.querySelector('.slide-nav-down');
	var eventState = true;
	var active;

	btnUp.addEventListener('click', function () {
		if (eventState == true) {
			eventState = false;
			setTimeout(function () {
				eventState = true;
			}, 1000);
			[].forEach.call(cloneLi, function (obj, idx) {
				if (obj.classList.contains('current')) {
					active = idx;
					obj.classList.remove('current');
					slide.style.cssText = 'margin-top: -' + cloneLi[active - 1].offsetTop + 'px; transition: margin .5s;';
				}
			});
			if (active == liLeng) {
				active = cloneLi.length - liLeng - 1;
				cloneLi[active].classList.add('current');
				setTimeout(function () {
					slide.style.cssText = 'margin-top: -' + cloneLi[active].offsetTop + 'px;'
				}, 500);
			} else {
				active -= 1;
				cloneLi[active].classList.add('current');
			}
		}
	});
	btnDown.addEventListener('click', function () {
		if (eventState == true) {
			eventState = false;
			setTimeout(function () {
				eventState = true;
			}, 1000);
			[].forEach.call(cloneLi, function (obj, idx) {
				if (obj.classList.contains('current')) {
					active = idx;
					obj.classList.remove('current');
					slide.style.cssText = 'margin-top: -' + cloneLi[active + 1].offsetTop + 'px; transition: margin .5s;';
				}
			});
			if (active == liLeng * 2 - 1) {
				active = liLeng;
				cloneLi[active].classList.add('current');
				setTimeout(function () {
					slide.style.cssText = 'margin-top: -' + cloneLi[active].offsetTop + 'px;'
				}, 500);
			} else {
				active += 1;
				cloneLi[active].classList.add('current');
			}
		}
	});

	var btn = slide.querySelectorAll('button');
	var vodWrap = wrap.querySelector('.vod-cont');
	var vodBox = vodWrap.querySelector('.vod-box');
	var sticky = '';
	[].forEach.call(btn, function (obj) {
		obj.addEventListener('click', function () {
			var _this = event.target || event.srcElement;
			var src = _this.getAttribute('data-src');
			var type = _this.getAttribute('data-type');
			sticky = _this.getAttribute('data-sticky');
			var _thisIdx = _this.parentNode.getAttribute('data-idx');
			$('.vod-info').hide();
			$('.vod-info.idx' + _thisIdx).show();
			[].forEach.call(cloneLi, function (el) {
				if (el.classList.contains('active')) el.classList.remove('active');
				if (_thisIdx == el.getAttribute('data-idx')) el.classList.add('active');
			});
			_this.parentNode.classList.add('active');
			

			// vodBox.innerHTML = '<div id="hTubeVod"></div>';
			// vodPlayer.create(src, 'hTubeVod', type, 'auto');

			vodPlayer.create(src, 'hTubeVod', type, 'auto', $(obj).data('thumb'), $(obj).data('href'), $(obj).data('sticky'));

			if ($(obj).data('auto')) { 
				$(vodWrap).addClass('playing');
			}
			else {
				$(vodWrap).removeClass('playing');
			}
		});
	});
	
	setTimeout(function(){
		if (vodPlayer.obj["hTubeVod"].state === 'played') {
			$(vodWrap).addClass('playing');
		}
	}, 1000);

	var fixState = true;
	var fix = function () {
		var scrollTop = window.scrollY || window.pageYOffset || document.body.scrollTop + (document.documentElement && document.documentElement.scrollTop || 0);
		if (sticky == 'STICKY_PLAY') {
			if (wrap.offsetTop + wrap.clientHeight < scrollTop) {
				if (fixState === true && !vodWrap.classList.contains('fixed')) vodWrap.classList.add('fixed');
			} else {
				if (vodWrap.classList.contains('fixed')) vodWrap.classList.remove('fixed');
				fixState = true;
			}
		}
	}
	// fix();
	// window.addEventListener('scroll', function () {
	//     fix()
	// });

	// var btnPlay = vodWrap.querySelector('.play');
	// var btnPause = vodWrap.querySelector('.pause');
	// var btnClose = vodWrap.querySelector('.close');
	// btnPlay.addEventListener('click', function () {
	//     vodPlayer.play('hTubeVod');
	// });
	// btnPause.addEventListener('click', function () {
	//     vodPlayer.pause('hTubeVod');
	// });
	// btnClose.addEventListener('click', function () {
	//     vodPlayer.pause('hTubeVod');
	//     vodWrap.classList.remove('fixed');
	//     fixState = false;
	// });
}

// 카테고리 버튼
/*
var cateBtn = function(){
	var cateGroup = document.querySelector('.cate-group');
	if(cateGroup) {
		if( cateGroup.querySelector('.keyword-list').clientHeight > 55 ) {
			cateGroup.classList.add('show-btn');
		}
	}
	
}*/
var cateBtn = function(){
	
	if($(".cate-group").length>0){
		
		$(".cate-group").each(function(){
			
			var $this= $(this);
			var cateBrnWrap = $this.find('.keyword-list');
			var cateBrnWrap02 = $this.find('.dp-tab');
			var cateBrnWrap03 = $this.find('.product-tab');
			
			for(var idx = 0 ; idx < cateBrnWrap.length; idx++) {
				if( cateBrnWrap.height() > 55 ) {
					$this.addClass('show-btn');
				}
			}
			
			for(var idx = 0 ; idx < cateBrnWrap02.length; idx++) {
				if( cateBrnWrap02.height() > 60 ) {
					$this.addClass('show-btn');
				}
			}
			
			for(var idx = 0 ; idx < cateBrnWrap03.length; idx++) {
				if( cateBrnWrap03.height() > 60 ) {
					cateBrnWrap03.closest(".cate-group").addClass('show-btn');
				}
			}
		});
	}
	
}

// 2020.09.01 상품상세 사이즈 차트 탭
var sizechartView = function(value){
	if( value === 'sizechart1' ) {
		$('.sizechart-item').hide();
		$('.sizechart1').show();
	} else if( value === 'sizechart2' ) {
		$('.sizechart-item').hide();
		$('.sizechart2').show();
	} else if( value === 'sizechart3' ) {
		$('.sizechart-item').hide();
		$('.sizechart3').show();
	} else if( value === 'sizechart4' ) {
		$('.sizechart-item').hide();
		$('.sizechart4').show();
	}
}

// 2020.12.16 연결된 하위 이벤트
var subEventTab = function(){
	var wrap = $('.sub-event-tab');
	var tabBox = wrap.find('.tabs-box');
	var tabBtn = tabBox.find('li');

	tabBtn.off('click').on('click', function(e){
		var idx = $(e.currentTarget).index();

		$(e.currentTarget).addClass('on').siblings('li').removeClass('on');
		wrap.find('.tab-cont').eq(idx).show().siblings('.tab-cont').hide();
	});
}

var fnDrawListW = function(){
	var listMax = 0;
	
	$(".fn-draw-ListW").find("li").each(function(e){
		
		listMax = listMax + ($(this).outerWidth() + parseInt($(this).css("margin-left")));
		
	});
	$(".fn-ListW-btn").css({width : listMax});
}

window.addEventListener('load', function(){
	header.init();
	header.fixed();
	fixedBtn();
	paymentSticky();
	detailSticky();
	detailVisualSticky();
	fold.init();
	tab.init();
	inputBox('#wrap');
	cateBtn();
	//dScroll.active();

	filterPadding();

	window.scrollWidth = getScrollbarWidth();
	
	// jQuery UI Datepicker
	$.datepicker.setDefaults({
		selectOtherMonths: true,
		showOtherMonths: true,
		numberOfMonths: 1,
		yearSuffix: ' .',
		dateFormat: 'yy-mm-dd',
		monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
		dayNamesMin: ['SU', 'MO', 'TH', 'WE', 'TH', 'FR', 'SA'],
		showMonthAfterYear: true,
		showOn: 'button',
		buttonImage: '/common/images/btn_calendar.png',
		buttonImageOnly: false,
		buttonText: '날짜 선택',
		currentText: '오늘',
		prevText: '이전달',
		nextText: '다음달'
	});
});
$(window).resize(function(){
	if($(".cate-group").length>0){
		cateBtn();
	}
});
var spinner = (

    function spinner($) {

		var spinner_html = '';
		spinner_html += '<div class="spinner">';
		spinner_html += '	<svg class="circular" viewBox="25 25 50 50">';
		spinner_html += '		<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>';
		spinner_html += '	</svg>';
		spinner_html += '</div>';

		var type = 'body';

		var Public = {
			/**
			 * @param {string} t : body 혹은 대상 목록의 아이디, spinner.show(); spinner.show('body'); spinner.show(대상 목록의 아이디);
			 *                     생략 시 body 기본값
			 */
            show: function (t) {
				type = t || 'body';

				if (type === 'body') {
					dim();
				}
				append();
			},

			/**
			 * @param {string} t : body 혹은 대상 목록의 아이디, spinner.show(); spinner.show('body'); spinner.show(대상 목록의 아이디);
			 *                     생략 시 body 기본값
			 */
			hide: function (t) {
				type = t || 'body';

				remove();

				if (type === 'body') {
					$('.spinner-dim').remove();
				}
			}
        };

		function append() {
			remove();
			
			if (type === 'body') {
				$('body').append(spinner_html);
			}

			if (document.getElementById(type)) {
				$('#' + type).append(spinner_html);
			}
		}

		function dim() {
			$('.spinner-dim').remove();
			$('body').append('<div class="spinner-dim"></div>');
		}

		function remove() {
			if (type === 'body') {
				$('.spinner').remove();
			}
			if (document.getElementById(type)) {
				$('.spinner', $('#' + type)).remove();
			}
		}

        // finally
        return Public;
    }

)(window.jQuery);
