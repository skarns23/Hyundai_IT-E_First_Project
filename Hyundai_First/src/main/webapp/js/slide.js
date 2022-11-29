var slide = {
	obj : {},
	opt : function(id, type, wrap) {
		var option = {
			speed : 800,
			on: {
				init: function(s) {
					var slideWrap = document.querySelector('#'+id);
					if (!slideWrap) return;
					var _this = this;
					slide.obj[id] = _this;
					if(type.indexOf('qv') >= 0) {
						var count = wrap.find('.slide-active');
						var activeList = wrap.find('.swiper-slide-active li');
						count.text(activeList.length);
					}
					if(type.indexOf('auto') >= 0) {
						var btnPlay = slideWrap.querySelector('.slide-auto-play');
						var btnStop = slideWrap.querySelector('.slide-auto-stop');
						btnPlay.addEventListener('click', function(){
							slide.obj[id].autoplay.start();
							btnPlay.style.display = 'none';
							btnStop.style.display = 'inline-block';
						});
						btnStop.addEventListener('click', function(){
							slide.obj[id].autoplay.stop();
							btnStop.style.display = 'none';
							btnPlay.style.display = 'inline-block';
						});
					}
					if(type.indexOf('tab') >= 0) {
						var tab = slideWrap.querySelector('.slide-tab');
						var tabBtn = tab.querySelectorAll('button');
						for(var btn = 0; btn < tabBtn.length; btn++) {
							tabBtn[btn].addEventListener('click', function(){
								var _this = this;
								for(var idx = 0; idx < tabBtn.length; idx++) {
									_this.classList.add('on');
									if(_this === tabBtn[idx]) {
										slide.obj[id].slideTo(idx + 1);
										return false;
									}
								}
							});
						}
					}
					if(type.indexOf('height') >= 0) {
						var slider = $('#'+id);
						var slideItem = slider.find('.swiper-slide');

						slideItem.find('img').on('load', function(){
							var _this = $(this);
							_this.closest('.swiper-slide').height(_this.height());
							if(_this.closest('.swiper-slide').hasClass('swiper-slide-active')) {
								slider.find('.swiper-wrapper').height(_this.height());
							}
						});
						
						window.addEventListener('resize', function(){
							setTimeout(function(){
								slideItem.each(function(){
									var _this = $(this);
									_this.height(_this.find('img').height());
								});
							},100);
						});
					}
					if(type.indexOf('imgView') >= 0) {
						var slider = $('#'+id);
						var list = slider.find('.swiper-slide');
						var imgSrc = [];
						list.each(function(){
							var _this = $(this);
							if(!_this.hasClass('swiper-slide-duplicate')) {
								if(_this.find('.vod').length) {
									var vod = _this.find('.vod').clone();
									vod.innerHTML = '<div class="item"></div>';
									imgSrc.push(vod[0]);
								}
								if(_this.find('img').length) imgSrc.push(_this.find('img')[0].cloneNode(true));
							}
						})
						list.on('click', function(){
							var _this = $(this);
							var idx = _this.data('swiper-slide-index');
							var player = _this.find('.vod');
							var target = player.find('.item');
							var vodId = target.attr('id');
							if(target.attr('autoplay')) target.removeAttr('autoplay');
							if(vodPlayer.obj[vodId] && vodPlayer.obj[vodId].state == 'played') {
								// vodPlayer.pause(vodId);
							}
							
							layerViewImg(imgSrc, idx);

							setTimeout(function(){
								$('#layerViewImgs').addClass('imgview-' + id)
							}, 500);
						});
					}
					if(type.indexOf('vod') >= 0) {
						// console.log(s.initialized)
						setTimeout(function(){
							var slider = $('#'+id);
							var vod = slider.find('.vod');
							vod.each(function(idx){
								var _this = $(this);
								var item = _this.find('.item');
								var src = _this.data('src');
								var type = _this.data('type');
								item.attr('id',id+idx);

								vodPlayer.create(src, id+idx, type, _this.data('auto') && 'auto',  _this.data('thumb'), _this.data('href'), _this.data('sticky'));

								// if(idx == 0) {
								// 	// vodId, tagId, type, auto, thumb, href, sticky
								// 	vodPlayer.create(src, id+idx, type, 'auto');
								// } else {
								// 	vodPlayer.create(src, id+idx, type);
								// }
							});
						}, 100);
					}
					if(type.indexOf('look') >= 0) {
						var list = $(slideWrap).find('.swiper-slide');
						var btn = list.find('button');
						var timer;
						var clickTime = function(idx) {
							timer = setTimeout(function(){
								_this.slideToLoop(idx, 1);
							}, 400);
						}
						
						btn.on('click', function(){
							var $this = $(this);
							var idx = $this.parent().data('swiper-slide-index');
							_this.slideTo(_this.clickedIndex, 400);
							clearTimeout(timer);
							clickTime(idx);
						})
					}

					// 20200708 손치용 추가
					if(type.indexOf('count') >= 0) {
						(function(){
							var totalcount = _this.slides.length - _this.loopedSlides * 2;
							var total = totalcount >= 10 ? totalcount : '0' + totalcount; //210702
							// var total = totalcount >= 10 ? totalcount : totalcount;
							$(slideWrap).find('.slide-total').text(total);
						})();
					}
				},
				slideChange: function() {
					var slideWrap = document.querySelector('#'+id);
					var _this = this;
					if(type.indexOf('count') >= 0) {
						var activeNum = _this.realIndex + 1;
						var active = slideWrap.querySelector('.slide-active');
						if(activeNum < 10) activeNum = '0' + activeNum;
						// if(activeNum < 10) activeNum = activeNum;
						
						active.innerHTML = activeNum;
					}
					if(type.indexOf('tit') >= 0) {
						var activeNum = _this.realIndex;
						var tit = slideWrap.querySelector('.dp-title');
						var str = tit.querySelector('.str');
						var layer = tit.querySelector('.more-layer');
						var links = layer.querySelectorAll('a');
						for(var idx = 0; idx < links.length; idx++) {
							links[idx].classList.remove('active');
						}
						links[activeNum].classList.add('active');
						str.textContent = links[activeNum].innerText;
					}
					if(type.indexOf('tab') >= 0) {
						var activeNum = _this.realIndex;
						var tab = slideWrap.querySelector('.slide-tab');
						var tabBtn = tab.querySelectorAll('button');
						for(var btn = 0; btn < tabBtn.length; btn++) {
							tabBtn[btn].classList.remove('on');
						}
						tabBtn[activeNum].classList.add('on');
					}
					if(type.indexOf('bg') >= 0) {
						setTimeout(function(){
							var activeSlide = slideWrap.querySelector('.swiper-slide-active');
							var slideNav = slideWrap.querySelector('.slide-nav');
							(activeSlide.classList.contains('nav2')) ? slideNav.classList.add('on') : slideNav.classList.remove('on');
						},100)
					}
					if(type.indexOf('look') >= 0) {
						setTimeout(function(){
							var showWrap = slideWrap.querySelector('.show-wrap');
							var showImg = showWrap.querySelector('img');
							var showDiv = showWrap.querySelector('.str');
							var activeSlide = slideWrap.querySelector('.swiper-slide-active');
							var src = activeSlide.querySelector('img').getAttribute('src');
							var str = activeSlide.querySelector('.str').innerHTML;
							showImg.setAttribute('src', src);
							showDiv.innerHTML = str;

							(activeSlide.classList.contains('type2')) ? showWrap.classList.add('type2') : showWrap.classList.remove('type2');
						}, 100);
					}
				},
				slideChangeTransitionEnd : function(s) {

					var slideWrap = document.querySelector('#'+id);
					if(type.indexOf('qv') >= 0) {
						var count = wrap.find('.slide-active');
						var countLeng = Number(count.text());
						var totalLeng = wrap.find('.slide-total').text();
						var activeList = wrap.find('.swiper-slide-active li');
						if(countLeng != totalLeng) {
							countLeng += activeList.length;
							count.text(countLeng);
						} else if(countLeng >= totalLeng) {
							count.text(activeList.length);
						}
					}
					if(type.indexOf('vod') >= 0) {
						// console.log(s.initialized)
						var active = slideWrap.querySelector('.swiper-slide-active');
						// if(active != null && s.initialized) {
						if(active != null) {
							var player = active.querySelector('.vod');

							if (!player) return;
							// $(player).data('id', $(player).find('.item-video').children().last().attr('id'));

							var target = player.querySelector('video') || player.querySelector('iframe');
							// // $(slideWrap).find('#' + $(player).data('id'))

							// console.log($(player).find('.item-video').children().last().attr('id'));

							// // $(player).removeAttr('class').addClass('vod-cont');
							// // $(player).find('.vod-box').removeClass('ready').empty().append('<div id="' + $(player).data('id') + '0"></div>');
							// // vodPlayer.create(vodId, tagId, 'youtube', auto, thumb, href, sticky);
							
							// return;

							if(target) {
								var vodId = target.getAttribute('id');
								// if(vodPlayer.obj[vodId] && vodPlayer.obj[vodId].state == 'pause') vodPlayer.play(vodId);

								if ($(player).data('auto') === false) {
									//
								}
								else {
									if(vodPlayer.obj[vodId]) vodPlayer.play(vodId);
								}
							} else {
								return false;
							}
						}
					}
				},
				slideChangeTransitionStart : function() {
					// if(type.indexOf('opt13') >= 0) {
					// 	var slider = $('#'+id);
					// 	var active = slider.find('.swiper-slide-active img');
					// 	var nav = slider.find('.slide-nav');
					// 	var navBtn = nav.find('[class*="slide-nav"]');
					// 	nav.width(active.width() + 'px');
					// 	navBtn.css('top', active.height()/2 + 'px');
					// 	window.addEventListener('resize', function(){
					// 		nav.width(active.width() + 'px');
					// 		navBtn.css('top', active.height()/2 + 'px');
					// 	});
					// }
				}
			}
		}
		if(type.indexOf('opt') >= 0) {
			option.autoplay = {delay: 5000};
		}
		if(type.indexOf('opt1') >= 0) {
			option.loop = true;
			option.autoplay = {delay: 5000, disableOnInteraction: false};
		}
		if(type.indexOf('opt2') >= 0) {
			option.loop = true;
			option.slidesPerView = 3;
		}
		if(type.indexOf('opt3') >= 0) {
			option.loop = true;
			option.autoplay = {delay: 5000};
			option.slidesPerView = 3;
		}
		if(type.indexOf('opt4') >= 0) {
			option.loop = true;
			option.autoplay = {delay: 5000, disableOnInteraction: false};
			option.slidesPerView = 5;
		}
		if(type.indexOf('opt5') >= 0) {
			option.loop = true;
			option.autoplay = false;
		}
		if(type.indexOf('opt6') >= 0) {
			option.loop = true;
			option.autoplay = {delay: 5000};
			option.slidesPerView = 3;
			option.centeredSlides = true;
		}
		if(type.indexOf('opt6-2') >= 0) {
			option.loop = true;
			option.autoplay = {delay: 5000};
			// option.slidesPerView = 'auto';
			option.slidesPerView = 5.6;
			option.centeredSlides = true;
		}
		if(type.indexOf('opt7') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 'auto';
		}
		if(type.indexOf('opt8') >= 0) {
			option.loop = false;
			option.autoplay = false;
			option.slidesPerView = 'auto';
		}
		if(type.indexOf('opt9') >= 0) {
			option.loop = true;
			option.autoplay = {delay: 5000};
			option.slidesPerView = 2;
		}
		if(type.indexOf('opt10') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 3;
		}
		if(type.indexOf('opt11') >= 0) {
			option.loop = false;
			option.autoplay = false;
			option.slidesPerView = 5;
			option.slidesPerGroup = 2;
		}
		if(type.indexOf('opt12') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 5;
			option.slidesPerGroup = 5;
			option.loopFillGroupWithBlank = true;
		}
		if(type.indexOf('opt13') >= 0) {
			option.loop = true;
			option.autoplay = false;
		}
		if(type.indexOf('opt14') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 2;
		}
		if(type.indexOf('opt15') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 4;
			option.slidesPerGroup = 4;
			option.loopFillGroupWithBlank = true;
		}
		if(type.indexOf('opt16') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 6;
		}
		if(type.indexOf('opt17') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 3;
			option.slidesPerGroup = 3;
			option.loopFillGroupWithBlank = true;
		}
		// if(type.indexOf('opt18') >= 0) {
		// 	option.loop = false;
		// 	option.slidesPerView = 1;
		// 	option.spaceBetween = 2;
		// 	option.autoplay = false;
		// 	option.freeMode = true;
		// 	option.scrollbar = {el: '.swiper-scrollbar'};
		// }
		if(type.indexOf('opt19') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 4;
			option.slidesPerGroup = 4;
			// option.spaceBetween = 5;
			option.loopFillGroupWithBlank = true;
			option.allowTouchMove = false;
		}
		if(type.indexOf('opt20') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 3;
			option.direction = 'vertical';
		}
		if(type.indexOf('opt21') >= 0) {
			option.loop = false;
			option.autoplay = false;
			option.slidesPerView = 3;
			// option.spaceBetween = 15;
		}
		if(type.indexOf('opt22') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 1;
			option.autoHeight = 'auto';
		}
		if(type.indexOf('opt23') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 1;
			option.speed = 0;
			option.allowTouchMove = false;
		}
		if(type.indexOf('opt24') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 1;
			option.speed = 0;
			option.allowTouchMove = false;
		}
		if(type.indexOf('opt25') >= 0) {
			option.loop = true;
			option.autoplay = {delay: 5000};
			option.slidesPerView = 'auto';
		} //20.09.05 추가 - 공지 팝업

		if(type.indexOf('opt26') >= 0) {
			option.loop = false;
			option.autoplay = {delay: 5000};
			option.slidesPerView = 'auto';
		} //20200924

		// 2020.11.13 magazine > style
		if(type.indexOf('opt27') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 'auto';
			option.centeredSlides = true;
			option.allowTouchMove = false;
		}
		// 2020.11.13 magazine > htv
		if(type.indexOf('opt28') >= 0) {
			option.loop = true;
			option.autoplay = false;
			option.slidesPerView = 'auto';
			option.centeredSlides = true;
			option.spaceBetween = 243;
			option.allowTouchMove = false;
		}

		if(type.indexOf('page') >= 0) {
			if(wrap) {
				option.pagination = {
					el: '.slide-pagination',
					clickable: true,
					renderBullet: function (index, className) {
						return '<button type="button" class="' + className + '">' + (index + 1) + '</button>';
					}
				}
			} else {
				option.pagination = {
					el: '#'+id+' .slide-pagination',
					clickable: true,
					renderBullet: function (index, className) {
						return '<button type="button" class="' + className + '">' + (index + 1) + '</button>';
					}
				}
			}
		}
		if(type.indexOf('nav') >= 0) {
			if(wrap) {
				option.navigation = {
					prevEl: '.slide-nav-prev',
					nextEl: '.slide-nav-next',
				}
			} else {
				option.navigation = {
					prevEl: '#'+id+' .slide-nav-prev',
					nextEl: '#'+id+' .slide-nav-next',
				}
			}
		}

		if(type.indexOf('notouch') >= 0) {
			option.allowTouchMove = false;
		}
		
		return option;
	},
	slickInit : function(id, type) {
		var slideWrap = $('#'+id+' .slide-container');
		slideWrap.on('init', function(){
			var wrap = document.querySelector('#'+id);
			if(type.indexOf('nav') >= 0) {
				var slidePrev = wrap.querySelector('.slide-nav-prev');
				var slideNext = wrap.querySelector('.slide-nav-next');
				slidePrev.addEventListener('click', function(){
					slideWrap.slick('slickPrev');
				});
				slideNext.addEventListener('click', function(){
					slideWrap.slick('slickNext');
				});
			}
			if(type.indexOf('auto') >= 0) {
				var slidePlay = wrap.querySelector('.slide-auto-play');
				var slideStop = wrap.querySelector('.slide-auto-stop');
				
				slidePlay.addEventListener('click', function(){
					slideWrap.slick('slickPlay');
					slidePlay.style.display = 'none';
					slideStop.style.display = 'inline-block';
				});
				slideStop.addEventListener('click', function(){
					slideWrap.slick('slickPause');
					slideStop.style.display = 'none';
					slidePlay.style.display = 'inline-block';
				});
			}
		});
	},
	slickOpt : function(type) {
		var option = {
			infinite: true,
			speed: 800,
			slidesToShow: 1,
			variableWidth: true,
			arrows: false,
			pauseOnHover: false,
		}
		if(type.indexOf('auto') >= 0) {
			option.autoplay = true;
		}
		return option;
	},
	create : function(id, idx) {
		var swiper;
		var slick;

		if ($('#' + id).find('.swiper-slide').length === 1) {
			var $sel = $('#' + id);
			$sel.find('.slide-container').addClass('noswipe');
			return;
		}

		if ($('#' + id + ' .swiper-slide').length) {
			$('#' + id).attr('data-slide-length', $('#' + id + ' .swiper-slide').length);
		}

		if(id == 'mainSlide') {
			var leng = $('#'+id+' .swiper-slide').length;
			var total = $('#'+id+' .slide-total');
			if(leng < 10) leng = '0'+leng;
			total.text(leng);
			
			// swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt3 page nav count auto'));

			var autoBtns = $('#mainSlide').find('.slide-auto');
			var mainslideWrapper = $('#mainSlide .swiper-wrapper');
			
			var mainslideSlick = mainslideWrapper.slick({
				draggable: false,
				autoplay: true,
				autoplaySpeed: 5000,
				infinite: true,
				slidesToShow: 3,
				slidesToScroll: 1,
				dots: true,
				nextArrow: $('#mainSlide').find('.slide-nav-next'),
				prevArrow: $('#mainSlide').find('.slide-nav-prev'),
				appendDots: $('#mainSlide').find('.slide-pagination')
			});

			autoBtns.find('.slide-auto-stop').off('click').on('click', function(){
				mainslideWrapper.slick('slickPause');
				autoBtns.find('.slide-auto-stop').hide();
				autoBtns.find('.slide-auto-play').show();
			});

			autoBtns.find('.slide-auto-play').off('click').on('click', function(){
				mainslideWrapper.slick('slickPlay');
				autoBtns.find('.slide-auto-play').hide();
				autoBtns.find('.slide-auto-stop').show();
			});

			mainslideWrapper.on('afterChange', function(event, slick, currentSlide, nextSlide){
				var num = mainslideWrapper.slick('slickCurrentSlide') + 1;
				if(num < 10) num = '0' + num;

				$('#' + id + ' .slide-active').text(num);
			});
			
		}
		if(id == 'lpSlide') {
			var leng = $('#'+id+' .swiper-slide').length;
			var total = $('#'+id+' .slide-total');
			if(leng < 10) leng = leng;
			total.text(leng);
			
			var lpSlideWrapper = $('#lpSlide .swiper-wrapper');
			
			var lpSlideSlick = lpSlideWrapper.slick({
				draggable: true,
				autoplay: true,
				autoplaySpeed: 5000,
				infinite: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				dots: false,
				nextArrow: $('#lpSlide').find('.slide-nav-next'),
				prevArrow: $('#lpSlide').find('.slide-nav-prev')
			});
			
			lpSlideWrapper.on('afterChange', function(event, slick, currentSlide, nextSlide){
				var num = lpSlideWrapper.slick('slickCurrentSlide') + 1;
				if(num < 10) num = num;
				
				$('#' + id + ' .slide-active').text(num);
				
				setTimeout(function(){
					fnColorcheck();
				}, 100);
				
			});
			
			var fnColorcheck =  function(){
				if ($("#lpSlide").find('.slick-slide.slick-active .popup-cont').hasClass("colorWhite") ){
					$("#lpSlide").removeClass('colorblack').addClass('colorWhite');
				}
				
				if ($("#lpSlide").find('.slick-slide.slick-active .popup-cont').hasClass("colorblack") ){
					$("#lpSlide").removeClass('colorWhite').addClass('colorblack');
				}
			}
			
			fnColorcheck();
			
		}
		
		if($("#visualSlide").hasClass("swiper-autoplay-off")){ // 20210316 서브 메인 상단 자동 슬라이드 비적용 / 적용
			
			if(id == 'visualSlide') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 page nav count'));
			
		} else {
			
			if(id == 'visualSlide') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt1 page nav count auto'));
			
		}
		
		if(id == 'visualSlide2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt6 nav'));
		//if(id == 'visualSlide2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt6 page nav count auto'));
		if(id == 'visualSlide3') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt8 nav'));
		if(id == 'visualSlide4') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt15 page nav auto'));
		
		// if(id == 'visualSlide5') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt6 page nav'));
		if(id == 'visualSlide5') {
			swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt6-2 page nav'))
			// window.addEventListener('resize', function(){
			// 	swiper.update();
			// });
		};
		
		if(id == 'visualSlide6') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt9 nav auto'));
		if(id == 'visualSlide7') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt1 page nav count notouch auto'));
		if(id == 'visualSlide8') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt2 nav'));
		if(id == 'visualSlide9') {
			slide.slickInit(id, 'nav auto');
			(function(){
				var imgArr = [];
				var direction = 'right';
				
				$('#' + id + ' .slide-container').find('img').each(function(){
					var $this = $(this).clone();
					imgArr.push($this[0]);
				});

				var keyslide = jQuery('#' + id).find('.key-slide');
				var currentIndex = 0;
				var nextIndex = imgArr.length - 1;

				slick = $('#'+id+' .slide-container').slick(slide.slickOpt('auto'));

				slick.on('beforeChange', function(event, sl, currentSlide, nextSlide){
					if (Math.abs(nextSlide - currentSlide) == 1) {
						direction = (nextSlide - currentSlide > 0) ? "right" : "left";
					}
					else {
						direction = (nextSlide - currentSlide > 0) ? "left" : "right";
					}
					
					// 기본
					if (direction === 'right') {
						// console.log('right')
						nextIndex = nextIndex + 1;
						if (nextIndex > imgArr.length - 1) {
							nextIndex = 0;
						}
					}
					else {
						// console.log('left')
						nextIndex = nextIndex - 1;
						if (nextIndex < 0) {
							nextIndex = imgArr.length - 1;
						}
					}

					keyslide.find('.next').addClass(direction);
					keyslide.find('.next').empty().append(imgArr[nextIndex]);
					setTimeout(function(){
						keyslide.find('.next').addClass('move');
					}, 100);
					
				});

				slick.on('afterChange', function(event, sl, currentSlide, nextSlide){
					var img = keyslide.find('.next img');
					keyslide.find('.next').removeClass('move left right').empty();
					keyslide.find('.current').empty().append(img)
				});
			})();
		}
		
	    if(id == 'visualSlide10') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		//if(id == 'visualSlide10') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav count auto'));
		if(id == 'visualSlide10_2' || 'visualSlide10_3') {
			
			var fnBestSlide =  function(){
				
				var autoBtns = $('#'+id).find('.main-best-cont.on .slide-auto');
				var brandSlideWrapper = $('#'+id).find('.main-best-cont.on .swiper-wrapper');
				
				var brandSlideSlick = brandSlideWrapper.slick({
					draggable : true,
					infinite : true,
					slidesToShow : 5,
					slidesToScroll : 1,
					autoplay : true,
					autoplaySpeed : 5000,
					dots : true,
					nextArrow : $('#'+id).find('.main-best-cont.on .slide-nav-next'),
					prevArrow : $('#'+id).find('.main-best-cont.on .slide-nav-prev'),
					appendDots : $('#'+id).find('.main-best-cont.on .slide-pagination')
				});
				
				autoBtns.find('.slide-auto-stop').off('click').on('click', function(){
					brandSlideWrapper.slick('slickPause');
					autoBtns.find('.slide-auto-stop').hide();
					autoBtns.find('.slide-auto-play').show();
				});
				
				autoBtns.find('.slide-auto-play').off('click').on('click', function(){
					brandSlideWrapper.slick('slickPlay');
					autoBtns.find('.slide-auto-play').hide();
					autoBtns.find('.slide-auto-stop').show();
				});
				
				brandSlideWrapper.on('afterChange', function(event, slick, currentSlide, nextSlide){
					var num = brandSlideWrapper.slick('slickCurrentSlide') + 1;
					if(num < 10) num = '0' + num;
					
					$('#' + id + ' .slide-active').text(num);
				});
				
			}
			
			var innerProList = $('#'+id+' .main-best-cont.on .slide-container');
			innerProList.each(function(){
				
				fnBestSlide();
				
			});
			
			$('#'+id).closest(".dp-section").find(".tit-tab-wrap .tit-tab a").click(function(e){
				e.preventDefault();
				
				$('#'+id).closest(".dp-section").find(".tit-tab-wrap .tit-tab").removeClass("on");
				$(this).closest(".tit-tab").addClass("on");
				$('#'+id).find(".main-best-cont").removeClass("on");
				$($(this).attr("href")).addClass("on");
				
				var autoBtns = $('#'+id).find('.main-best-cont.on .slide-auto');
				var brandSlideWrapper = $('#'+id).find('.main-best-cont.on .swiper-wrapper');
				
				if($('#'+id).find('.main-best-cont.on .swiper-wrapper').hasClass("slick-slider") == false) {
					
					fnBestSlide();
					
				} else {
					
					brandSlideWrapper.slick('setPosition');
					// brandSlideWrapper.slick('goTo', 0);
					
				}
				
				// $('#'+id).find('.main-best-cont:not(".on") .swiper-wrapper').slick('slickPause');
				// brandSlideWrapper.slick('slickPlay');
				
				if($(".cate-group").length > 0 ){
					
					if($(".cate-group").hasClass('expand')  ){
						$(this).parents('.dp-section').find(".cate-group").removeClass('expand');
					}
					
					cateBtn();
					
				}
				
				if($(".cate-group").length > 0 ){
					
					if($(".cate-group").hasClass('expand')  ){
						$(this).parents('.dp-section').find(".cate-group").removeClass('expand');
					}
					
					cateBtn();
				
				}
				
				
			});
			
		}
		
		if(id == 'visualSlide11') {
			var tabSlide = new Swiper('#'+id+' .slide-tab', {
				loop: true,
				slidesPerView: 'auto',
				centeredSlides: true,
				navigation: {
					prevEl: '#'+id+' .slide-nav-prev',
					nextEl: '#'+id+' .slide-nav-next',
				},
				allowTouchMove: false
			});
			var contSlide = new Swiper('#'+id+' .slide-cont', {
				loop: true,
				navigation: {
					prevEl: '#'+id+' .slide-nav-prev',
					nextEl: '#'+id+' .slide-nav-next',
				},
				allowTouchMove: false
			});
			var innerBanner = $('#'+id+' .brand-banner .slide-container');
			innerBanner.each(function(){
				var innerSwiper = new Swiper(this, slide.opt(id, 'opt1 page'), wrap);
			});
		}
		if(id == 'visualSlide12') {
			slide.slickInit(id, 'nav auto');
			slick = $('#'+id+' .slide-container').slick(slide.slickOpt('auto'));
		}
		if(id == 'visualSlide13') {
			var wrap = document.querySelector('#'+id);
			var slideLeng = wrap.querySelectorAll('.swiper-slide').length
			var util = wrap.querySelector('.slide-util');
			var total = wrap.querySelector('.slide-total');
			if(slideLeng > 1) {
				swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt1 page auto count'));
				if(slideLeng < 10) slideLeng = '0'+slideLeng;
				total.innerText = slideLeng;
			} else {
				util.parentNode.removeChild(util);
			}
		}
		// if(id == 'visualSlide15') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt12 nav auto'));
		if(id == 'visualSlide15') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt12 page nav count auto'));

		if(id == 'brandList') {
			var slideWrap = $('#'+id);
			var list = slideWrap.find('.swiper-slide');
			var nav = slideWrap.find('.slide-nav');
			if(list.length > 6) {
				swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt16 nav'));
			} else {
				nav.remove();
			}
		}
		
		if(id == 'styleTopVisual') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt1 page nav bg'));
		// if(id == 'outletSlide1') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'outletSlide1') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));
		// if(id == 'outletSlide2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'outletSlide2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));
		// if(id == 'outletSlide3') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'outletSlide3') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));
		// if(id == 'outletSlide4') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'outletSlide4') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));
		// if(id == 'themeSlide1') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'themeSlide1') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));
		//if(id == 'themeSlide2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'themeSlide2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));
		// if(id == 'themeSlide3') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'themeSlide3') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));
		// if(id == 'themeSlide4') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'themeSlide4') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));
		// if(id == 'themeSlide5') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 nav auto'));
		if(id == 'themeSlide5') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt4 page nav auto'));

		if(id == 'layerPromoList') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt10 nav'));
		if(id == 'promoChoice') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt11 nav page'));

		if(id == 'newPdBanner') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt1 page'));
		if(id == 'newPdSlide') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt2 page nav'));
		if(id == 'banner1') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt1 page nav'));

		if(id == 'moreEvent') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt21 page nav'));
		
		if(id == 'gnb') {
			var gnb = $('#gnb');
			var gnbSlide = gnb.find('.swiper-container');
			gnbSlide.each(function(){
				swiper = new Swiper(this, slide.opt(id, 'opt5 nav'), wrap);
			});
		}
		if(id == 'pdList') {
			var imgBox = $('.product-list .img-box');
			
			$(".content-response .tit-tab-wrap .tit-tab a").click(function(e){
				e.preventDefault();
				
				$(".content-response .tit-tab-wrap .tit-tab a").closest(".tit-tab").removeClass("on");
				$(this).closest(".tit-tab").addClass("on");
				$(".content-response .best-cont").removeClass("on");
				$($(this).attr("href")).addClass("on");
				
				// $('.product-list .img-box').slick('setPosition');
				
				// var imgBox = $('.product-list .img-box');
				
				imgBox.each(function(){
					var _this = $(this);
					var link = _this.find('> a');
					var img = _this.find('.img');
					
					if(img.length > 1) {
						
						_this.append(nav);
						link.on('init', function(){
							var slidePrev = _this.find('.slide-nav-prev');
							var slideNext = _this.find('.slide-nav-next');
							slidePrev.on('click', function(){
								link.slick('slickPrev');
							});
							slideNext.on('click', function(){
								link.slick('slickNext');
							});
						});
						
						slick = link.slick('setPosition');
						
					}
					
				});
				
				if($(".cate-group").length > 0 ){
					
					if($(".cate-group").hasClass('expand')  ){
						$(this).parents('.content-response').find(".cate-group").removeClass('expand');
					}
					
					cateBtn();
				
				}
			});
			
			imgBox.each(function(){
				var _this = $(this);
				var link = _this.find('> a');
				var img = _this.find('.img');
				var nav = '<div class="slide-nav type3"><button type="button" class="slide-nav-prev">이전</button><button type="button" class="slide-nav-next">다음</button></div>'
				
				if(img.length > 1) {
					_this.append(nav);
					link.on('init', function(){
						var slidePrev = _this.find('.slide-nav-prev');
						var slideNext = _this.find('.slide-nav-next');
						slidePrev.on('click', function(){
							link.slick('slickPrev');
						});
						slideNext.on('click', function(){
							link.slick('slickNext');
						});
					});
					
					slick = link.slick({
						arrows: false,
						slidesToShow: _this.closest('li').is('.product-sp') ? 2 : 1
					});
				}
								
			});
			
		}
		if(id == 'quickView') {
			var slideWrap = $('#'+id);
			var list = slideWrap.find('.swiper-slide');
			var nav = slideWrap.find('.slide-nav');
			if(list.length > 1) {
				swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 nav'), wrap);
			} else {
				nav.remove();
			}
		}
		if(id == 'quickViewHistory') {
			var slideWrap = $('#'+id+' .slide-wrap');
			var key = '';
			quickView.slideObj[id] = {};
			slideWrap.each(function(idx){
				var _this = $(this);
				var cont = _this.find('.slide-container');
				var list = _this.find('li');
				var nav = _this.find('.slide-nav');
				var box = _this.closest('.box');
				var total = box.find('.slide-total');
				total.text(list.length);
				key = 's'+idx;
				swiper = new Swiper(cont, slide.opt(id, 'opt24 nav qv', box), wrap);
				quickView.slideObj.quickViewHistory[key] = swiper;
				if(_this.hasClass('list-type1') && list.length < 1 || _this.hasClass('list-type2') && list.length < 5) nav.hide();
			});
		}
		if(id == 'reviewImg') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 page'));
		if(id == 'pdViewSlide') {
			$(document).ready(function(){
				swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt14 page nav imgView vod'));
				swiper.on('slideChange',function(){
					var active = $('#'+id).find('.swiper-slide-active');
					var player = active.find('.vod');
					var target = player.find('.item');
					var vodId = target.attr('id');
					if(target.attr('autoplay')) target.removeAttr('autoplay');
					if(vodPlayer.obj[vodId] && vodPlayer.obj[vodId].state == 'played') {
						vodPlayer.stop(vodId);
					}
				});
				swiper.on('slideChangeTransitionEnd',function(){
					var active = $('#'+id).find('.swiper-slide-active');
					var player = active.find('.vod');
					var target = player.find('.item');
					var vodId = target.attr('id');
					if(vodPlayer.obj[vodId]) {
						vodPlayer.play(vodId);
					}
				});
			});
		}
		if(id == 'productSlideList') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt12 page nav'));
		if(id == 'productSlideList2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt12 page nav'));
		if(id == 'productSlideList3') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt12 page nav'));
		if(id == 'viewContentsList') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt15 nav page'));
		if(id == 'viewContentsList2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt15 nav page'));

		if(id == 'layerViewImgs') {
			swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt13 page nav vod'));
			swiper.on('slideChange',function(){
				var active = $('#'+id).find('.swiper-slide-active');
				var player = active.find('.vod');
				var target = player.find('.item');
				var vodId = target.attr('id');
				if(target.attr('autoplay')) target.removeAttr('autoplay');
				if(vodPlayer.obj[vodId] && vodPlayer.obj[vodId].state == 'played') {
					vodPlayer.stop(vodId);
				}
			});
			swiper.on('slideChangeTransitionEnd',function(){
				var active = $('#'+id).find('.swiper-slide-active');
				var player = active.find('.vod');
				var target = player.find('.item');
				var vodId = target.attr('id');
				if(vodPlayer.obj[vodId]) {
					vodPlayer.play(vodId);
				}
			});
		}

		if(id == 'chartSlide') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt14 page nav'));
		if(id == 'giftSlide') {
			var slideWrap = $('#'+id);
			var list = slideWrap.find('.swiper-slide');
			var nav = slideWrap.find('.slide-nav');
			if(list.length > 1) {
				swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 nav'), wrap);
			} else {
				nav.remove();
			}
		}
		if(id == 'shoppingBagItem')  swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt12 page nav'));
		
		if(id == 'styleHtop') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 nav page'));
		if(id == 'thumbnailSlide') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt20 nav page'));

		if(id == 'lookbookSlide') {
			var slideWrap = $('#'+id);
			var wrapper = slideWrap.find('.swiper-wrapper');
			var clone = function() {
				var list = slideWrap.find('.swiper-slide');
				if(list.length < 30) {
					wrapper.append(wrapper.html());
					clone();
				} else {
					swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt7 nav look'));
					return false;
				}
			}
			clone();
		}
		
		if(id == 'styleSlide') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 nav'));
		if(id == 'styleSlide2') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 nav'));
		if(id == 'styleSlide3') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 nav'));
		if(id == 'styleSlide4') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 nav'));
		if(id == 'styleSlide5') swiper = new Swiper('#'+id+' .slide-container', slide.opt(id, 'opt5 nav'));
	},

	/**
	 *
	 * @param {String} selector : #yourid, .yourclass
	 * @param {String} options : 'opt4 nav auto' 등 이전 사용되던 옵션 방식
	 *
	 * 호출방법 :
	 *          1. slide.bind('.visual-slide10', 'opt4 nav auto')  >> .visual-slide10를 모두 찾아 반복문을 통해 스와이퍼 실행, 이미 id가 있다면 바로 사용, 없으면 id 생성해서 사용.
	 *          2. slide.bind('#visualSlide10-1', 'opt4 nav auto') >> #visualSlide10-1 아이디를 찾아 단독 스와이퍼 실행.
	 *          3. 옵션은 slider.opt 참고해서 사용
	 */
	bind: function(selector, options) {
		var swiperOption = {};

		if ($(selector).find('.swiper-slide').length === 1) {
			var $sel = $(selector);

			if(options.indexOf('vod') >= 0) {

				(function(){
					var slider = $(selector);
					var vod = slider.find('div.vod');
					var rand = Math.floor( Math.random() * 1000000 );
					var divid = vod.find('.item').attr('id');
					
					if (!divid) {
						vod.find('.item').attr('id', 'vod-' + rand);
						divid = 'vod-' + rand;
					}
					
					vodPlayer.create(
						vod.data('src'),
						divid,
						vod.data('type'),
						'auto',
						vod.data('thumb'),
						vod.data('href'),
						vod.data('sticky')
					);
				})();
			}
			
			$sel.find('.slide-container').addClass('noswipe');

			return;
		}

		// if ($(selector).find('.swiper-slide').length) {
		// 	$(selector).attr('data-slide-length', $(selector).find('.swiper-slide').length);
		// }

		if (selector.startsWith('#')) {
			if ($(selector).find('.swiper-slide').length) {
				$(selector).attr('data-slide-length', $(selector).find('.swiper-slide').length);
			}

			if (options) {
				swiperOption = slide.opt(selector.substring(1), options);
			}
			return new Swiper(selector + ' .slide-container', swiperOption);
		}
		else if (selector.startsWith('.')) {
			if (options) {
				swiperOption = slide.opt(null, options);
			}
			$(selector).each(function(){
				var that = $(this);

				if (that.find('.swiper-slide').length) {
					that.attr('data-slide-length', that.find('.swiper-slide').length);
				}

				if(that.find('.swiper-notification').length) return;

				if (that.attr('id')) {
					swiperOption = slide.opt(that.attr('id'), options);
				}
				else {
					(function(){
						var rand_id = 'sliderid-' + Math.floor( Math.random() * 1000000 );
						that.attr('id', rand_id);
						swiperOption = slide.opt(rand_id, options);
					})();
				}
				// that.data('swiper', new Swiper(that[0].querySelector('.slide-container'), swiperOption));
				that.data('swiper', new Swiper('#' + that.attr('id') + ' .slide-container', swiperOption));
			});
		}
	}
}