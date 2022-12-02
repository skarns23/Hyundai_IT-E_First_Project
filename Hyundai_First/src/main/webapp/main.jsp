<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div id="container" style="padding-top: 90px;">
	<section class="dp-section main-back-video" id="video-box">
		<video muted autoplay loop style="width:100%;">
			<source src="videos/hfashionVideo.mp4" type="video/mp4">
		</video>
		
		<div class="arrow-down">
            <a id="arrow" href="#ranking" onclick="scrollMov(900, 100)">
                <span></span>
                <span></span>
                <span></span>
            </a>
        </div>
     
	</section>
	<section class="dp-section main-keyword-ranking" id="ranking">
		<div class="keyword-ranking">
			<h2 class="title">BEST <br>RANKING</h2>
			<ul id="mainCnrKeywordRanking" class="list" style="">
				<c:forEach var="blist" items="${bestItemList}">
				<c:set var="i" value="${i+1}"/>
				<li class="active"><a href="javascript:void(0)" onclick="fn_searchLink('타미'); return false;" class="category"> <span class="num">${i}</span> <span class="name">${blist.productName}</span> <span
						class="state-mid">상승</span>
				</a>
					<c:if test="${i eq 1}">
					
					<div class="brand open" style="height: 197.25px;">
						<div class="inner" id="hotKwdGod0">
							<a href="javascript:void(0);" onclick="clickRecommendProducts(this);" godno="GM0122080576703"
								clicklogurl="https://lc.recopick.com/1/banner/2734/pick?uid=93719615.1667805260852&amp;source=&amp;pick=GM0122080576703&amp;method=75&amp;channel=empty&amp;reco_type=search-item&amp;product_type=R&amp;reco_list=%5B%22GM0122080576703%22%2C%22GM0122080576705%22%2C%22GM0121070567067%22%2C%22GM0121070567063%22%2C%22GM0122091490058%22%2C%22GM0121110195519%22%2C%22GM0121110195520%22%2C%22GM0122090787781%22%2C%22GM0122090787780%22%2C%22115317205%22%5D&amp;keyword=%ED%83%80%EB%AF%B8">
								<figure data-ga-id="GM0122080576703" data-ga-name="피마 코튼 캐시미어 크루넥 스웨터" data-ga-brand="TOMMY HILFIGER MEN" data-ga-price="219000">
									<img src="${contextPath}/${blist.mainImgslist.get(0)}">
									
								</figure>
							</a> <a href="javascript:void(0);" onclick="clickRecommendProducts(this);" godno="GM0122080576705"
								clicklogurl="https://lc.recopick.com/1/banner/2734/pick?uid=93719615.1667805260852&amp;source=&amp;pick=GM0122080576705&amp;method=75&amp;channel=empty&amp;reco_type=search-item&amp;product_type=R&amp;reco_list=%5B%22GM0122080576703%22%2C%22GM0122080576705%22%2C%22GM0121070567067%22%2C%22GM0121070567063%22%2C%22GM0122091490058%22%2C%22GM0121110195519%22%2C%22GM0121110195520%22%2C%22GM0122090787781%22%2C%22GM0122090787780%22%2C%22115317205%22%5D&amp;keyword=%ED%83%80%EB%AF%B8">
								<figure data-ga-id="GM0122080576705" data-ga-name="피마 코튼 캐시미어 크루넥 스웨터" data-ga-brand="TOMMY HILFIGER MEN" data-ga-price="219000">
									<img src="${contextPath}/${blist.mainImgslist.get(1)}">
									
								</figure>
							</a> <a href="javascript:void(0);" onclick="clickRecommendProducts(this);" godno="GM0122091490058"
								clicklogurl="https://lc.recopick.com/1/banner/2734/pick?uid=93719615.1667805260852&amp;source=&amp;pick=GM0122091490058&amp;method=75&amp;channel=empty&amp;reco_type=search-item&amp;product_type=R&amp;reco_list=%5B%22GM0122080576703%22%2C%22GM0122080576705%22%2C%22GM0121070567067%22%2C%22GM0121070567063%22%2C%22GM0122091490058%22%2C%22GM0121110195519%22%2C%22GM0121110195520%22%2C%22GM0122090787781%22%2C%22GM0122090787780%22%2C%22115317205%22%5D&amp;keyword=%ED%83%80%EB%AF%B8">
								<figure data-ga-id="GM0122091490058" data-ga-name="[ALASKA Series] 알래스카 푸퍼" data-ga-brand="TOMMY JEANS" data-ga-price="378000">
									<img src="${contextPath}/${blist.mainImgslist.get(2)}">
									
								</figure>
							</a> <a href="javascript:void(0);" onclick="clickRecommendProducts(this);" godno="GM0122090787780"
								clicklogurl="https://lc.recopick.com/1/banner/2734/pick?uid=93719615.1667805260852&amp;source=&amp;pick=GM0122090787780&amp;method=75&amp;channel=empty&amp;reco_type=search-item&amp;product_type=R&amp;reco_list=%5B%22GM0122080576703%22%2C%22GM0122080576705%22%2C%22GM0121070567067%22%2C%22GM0121070567063%22%2C%22GM0122091490058%22%2C%22GM0121110195519%22%2C%22GM0121110195520%22%2C%22GM0122090787781%22%2C%22GM0122090787780%22%2C%22115317205%22%5D&amp;keyword=%ED%83%80%EB%AF%B8">
								<figure data-ga-id="GM0122090787780" data-ga-name="크롭 다운 푸퍼 (2way)" data-ga-brand="TOMMY JEANS" data-ga-price="358000">
									<img src="${contextPath}/${blist.mainImgslist.get(1)}">
									
								</figure>
							</a>
						</div>
					</div> 
					<a href="javascript:void(0)" onclick="fn_searchLink('타미'); return false;" class="link">더보기</a></li>
					</c:if>
					<a href="javascript:void(0)" onclick="fn_searchLink('타미'); return false;" class="link"></a></li>
				</c:forEach>
				
			</ul>
		</div>
		<div class="keyword-items">
			<div class="inner">
				<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
				<div class="box" data-ga-id="GM0122092695369" data-ga-name="다이아 퀼티드 자켓" data-ga-brand="TOMMY HILFIGER MEN" data-ga-price="620000">
					<a href="javascript:void(0)" onclick="goGodDetail('GM0122092695369')"> <img
						src="https://cdn.hfashionmall.com/goods/THBR/22/09/26/GM0122092695369_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="다이아 퀼티드 자켓"
						onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
						<div class="over-view">
							<div class="item-info">
								<div class="item-brand">TOMMY HILFIGER MEN</div>
								<div class="item-name">다이아 퀼티드 자켓</div>
								<div class="item-price">
									<span class="price">620,000</span>
								</div>
							</div>
						</div>
					</a>
					<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122092695369">
						<span>좋아요</span>
					</button>
				</div>
				<div class="cell">
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					<div class="box" data-ga-id="GM0122111515567" data-ga-name="로미 스웨이드 부츠" data-ga-brand="TOMMY SHOES" data-ga-price="299000">
						<a href="javascript:void(0)" onclick="goGodDetail('GM0122111515567')"> <img
							src="https://cdn.hfashionmall.com/goods/THBR/22/11/15/GM0122111515567_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="로미 스웨이드 부츠"
							onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
							<div class="over-view">
								<div class="item-info">
									<div class="item-brand">TOMMY SHOES</div>
									<div class="item-name">로미 스웨이드 부츠</div>
									<div class="item-price">
										<span class="price">299,000</span>
									</div>
								</div>
							</div>
						</a>
						<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122111515567">
							<span>좋아요</span>
						</button>
					</div>
					<div class="box">
						<a href="">
							<div class="txt-wrap">
								<span class="title">MUST HAVE ITEM</span> <span class="sub">놓치면 후회할 겨울 아이템</span>
							</div>
						</a>
					</div>
				</div>
				<div class="cell">
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					<div class="box" data-ga-id="GM0122111013992" data-ga-name="페이크퍼 크롭 자켓" data-ga-brand="TOMMY JEANS" data-ga-price="298000">
						<a href="javascript:void(0)" onclick="goGodDetail('GM0122111013992')"> <img
							src="https://cdn.hfashionmall.com/goods/THBR/22/11/10/GM0122111013992_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="페이크퍼 크롭 자켓"
							onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
							<div class="over-view">
								<div class="item-info">
									<div class="item-brand">TOMMY JEANS</div>
									<div class="item-name">페이크퍼 크롭 자켓</div>
									<div class="item-price">
										<span class="price">298,000</span>
									</div>
								</div>
							</div>
						</a>
						<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122111013992">
							<span>좋아요</span>
						</button>
					</div>
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					<div class="box" data-ga-id="GM0122102005774" data-ga-name="울 블렌디드 후디 니트 탑" data-ga-brand="DKNY MEN" data-ga-price="558000">
						<a href="javascript:void(0)" onclick="goGodDetail('GM0122102005774')"> <img
							src="https://cdn.hfashionmall.com/goods/DKBR/22/10/20/GM0122102005774_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="울 블렌디드 후디 니트 탑"
							onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
							<div class="over-view">
								<div class="item-info">
									<div class="item-brand">DKNY MEN</div>
									<div class="item-name">울 블렌디드 후디 니트 탑</div>
									<div class="item-price">
										<span class="price">558,000</span>
									</div>
								</div>
							</div>
						</a>
						<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122102005774">
							<span>좋아요</span>
						</button>
					</div>
				</div>
				<div class="cell">
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					<div class="box" data-ga-id="GM0122092896561" data-ga-name="씨엘로 T 솔더" data-ga-brand="DECKE" data-ga-price="185500">
						<a href="javascript:void(0)" onclick="goGodDetail('GM0122092896561')"> <img
							src="https://cdn.hfashionmall.com/goods/HFBR/22/09/28/GM0122092896561_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="씨엘로 T 솔더"
							onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
							<div class="over-view">
								<div class="item-info">
									<div class="item-brand">DECKE</div>
									<div class="item-name">씨엘로 T 솔더</div>
									<div class="item-price">
										<span class="price">185,500</span> <span class="percent">30%</span>
									</div>
								</div>
							</div>
						</a>
						<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122092896561">
							<span>좋아요</span>
						</button>
					</div>
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					<div class="box" data-ga-id="GM0122091992185" data-ga-name="구스다운 코듀로이 집업 숏 패딩" data-ga-brand="ck Calvin Klein WOMEN" data-ga-price="958000">
						<a href="javascript:void(0)" onclick="goGodDetail('GM0122091992185')"> <img
							src="https://cdn.hfashionmall.com/goods/CKBR/22/09/19/GM0122091992185_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="구스다운 코듀로이 집업 숏 패딩"
							onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
							<div class="over-view">
								<div class="item-info">
									<div class="item-brand">ck Calvin Klein WOMEN</div>
									<div class="item-name">구스다운 코듀로이 집업 숏 패딩</div>
									<div class="item-price">
										<span class="price">958,000</span>
									</div>
								</div>
							</div>
						</a>
						<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122091992185">
							<span>좋아요</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
<!-- 삭제 시작!! -->
	<!-- <section class="dp-section main-best-seller" id="mainSectionBestSeller" style="">

		<h2 class="dp-title tit-tab-wrap eng" id="bestTitle">
			<span class="tit-tab pl113 on" id="brand"> <a href="javascript:undefined;">BRAND BEST</a>
				<button type="button" onclick="location.href ='/display/best'" class="btn_more">전체보기</button>
			</span> <span class="tit-tab" id="category"> <a href="javascript:undefined;">CATEGORY BEST</a>
				<button type="button" onclick="location.href ='/display/best'" class="btn_more">전체보기</button>
			</span>
		</h2>
		<div id="visualSlide10_2" class="visual-slide14">
			탭 콘텐츠1
			<div id="mBest-tab-cont1" class="main-best-cont on">
				<div class="slide-container product-list cont1">
					<ul id="ulBestKwdCnrGodList1" class="swiper-wrapper slick-initialized slick-slider slick-dotted">
						<div class="slick-list draggable">
							<div class="slick-track" style="opacity: 1; width: 11070px; transform: translate3d(-1968px, 0px, 0px);">
								<div class="slick-slide slick-cloned" data-slick-index="-5" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871936" data-ga-name="하프문 크로스" data-ga-brand="DECKE" data-ga-price="136500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871936')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871936_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="하프문 크로스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871936" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871936');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871936')" tabindex="-1"> <span class="item-rank rank-top"> 16<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">하프문 크로스</div>
														<div class="item-price">
															<span class="price">136,500</span>
															<del class="regular">195,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="-4" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122083084352" data-ga-name="볼륨 카드슬롯" data-ga-brand="DECKE" data-ga-price="55300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122083084352')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/08/30/GM0122083084352_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="볼륨 카드슬롯"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122083084352" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122083084352');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122083084352')" tabindex="-1"> <span class="item-rank rank-top"> 17<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">볼륨 카드슬롯</div>
														<div class="item-price">
															<span class="price">55,300</span>
															<del class="regular">79,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="-3" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122101302273" data-ga-name="스윙 양말" data-ga-brand="DECKE" data-ga-price="13000">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302273')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/10/13/GM0122101302273_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="스윙 양말"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122101302273" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122101302273');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302273')" tabindex="-1"> <span class="item-rank rank-top"> 18<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">스윙 양말</div>
														<div class="item-price">
															<span class="price">13,000</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="-2" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122060961786" data-ga-name="보우 미니크로스" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122060961786')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/06/09/GM0122060961786_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="보우 미니크로스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122060961786" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122060961786');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122060961786')" tabindex="-1"> <span class="item-rank rank-top"> 19<span class="state-down">-10</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">보우 미니크로스</div>
														<div class="item-price">
															<span class="price">115,500</span>
															<del class="regular">165,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071170580" data-ga-name="베르디" data-ga-brand="DECKE" data-ga-price="164500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071170580')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/11/GM0122071170580_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="베르디"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071170580" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071170580');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071170580')" tabindex="-1"> <span class="item-rank rank-top"> 20<span class="state-up">7</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">베르디</div>
														<div class="item-price">
															<span class="price">164,500</span>
															<del class="regular">235,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="0" aria-hidden="true" style="width: 246px;" role="tabpanel" id="slick-slide20" tabindex="-1" aria-describedby="slick-slide-control20">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071972421" data-ga-name="아망떼 카드 지퍼지갑" data-ga-brand="DECKE" data-ga-price="62300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972421')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/19/GM0122071972421_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="아망떼 카드 지퍼지갑"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071972421" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071972421');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972421')" tabindex="-1"> <span class="item-rank rank-top"> 1<span class="state-up">2</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">아망떼 카드 지퍼지갑</div>
														<div class="item-price">
															<span class="price">62,300</span>
															<del class="regular">89,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="1" aria-hidden="true" style="width: 246px;" role="tabpanel" id="slick-slide21" aria-describedby="slick-slide-control21" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122103109780" data-ga-name="탐탐 미니백" data-ga-brand="DECKE" data-ga-price="68600">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122103109780')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/10/31/GM0122103109780_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="탐탐 미니백"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122103109780" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122103109780');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122103109780')" tabindex="-1"> <span class="item-rank rank-top"> 2<span class="state-down">-1</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">탐탐 미니백</div>
														<div class="item-price">
															<span class="price">68,600</span>
															<del class="regular">98,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="2" aria-hidden="true" style="width: 246px;" role="tabpanel" id="slick-slide22" aria-describedby="slick-slide-control22" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122081779096" data-ga-name="씨엘로 토트" data-ga-brand="DECKE" data-ga-price="227500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122081779096')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GM0122081779096_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="씨엘로 토트"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122081779096" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122081779096');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122081779096')" tabindex="-1"> <span class="item-rank rank-top"> 3<span class="state-up">10</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">씨엘로 토트</div>
														<div class="item-price">
															<span class="price">227,500</span>
															<del class="regular">325,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-current slick-active" data-slick-index="3" aria-hidden="false" style="width: 246px;" role="tabpanel" id="slick-slide23" aria-describedby="slick-slide-control23">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122050648354" data-ga-name="쁘띠 플로우" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648354')" tabindex="0">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/05/06/GM0122050648354_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="쁘띠 플로우"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122050648354" tabindex="0">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122050648354');" tabindex="0">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648354')" tabindex="0"> <span class="item-rank rank-top"> 4<span class="state-up">7</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">쁘띠 플로우</div>
														<div class="item-price">
															<span class="price">115,500</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-active" data-slick-index="4" aria-hidden="false" style="width: 246px;" role="tabpanel" id="slick-slide24" aria-describedby="slick-slide-control24">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122022222416" data-ga-name="탐탐 미니백" data-ga-brand="DECKE" data-ga-price="68600">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122022222416')" tabindex="0">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/02/22/GM0122022222416_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="탐탐 미니백"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122022222416" tabindex="0">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122022222416');" tabindex="0">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122022222416')" tabindex="0"> <span class="item-rank rank-top"> 5<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">탐탐 미니백</div>
														<div class="item-price">
															<span class="price">68,600</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-active" data-slick-index="5" aria-hidden="false" style="width: 246px;" role="tabpanel" id="slick-slide25" aria-describedby="slick-slide-control25">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122081879748" data-ga-name="노이 미니 지퍼돌이" data-ga-brand="DECKE" data-ga-price="62300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122081879748')" tabindex="0">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/08/18/GM0122081879748_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="노이 미니 지퍼돌이"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122081879748" tabindex="0">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122081879748');" tabindex="0">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122081879748')" tabindex="0"> <span class="item-rank rank-top"> 6<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">노이 미니 지퍼돌이</div>
														<div class="item-price">
															<span class="price">62,300</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-active" data-slick-index="6" aria-hidden="false" style="width: 246px;" role="tabpanel" id="slick-slide26" aria-describedby="slick-slide-control26">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071972424" data-ga-name="노이 미니 지퍼돌이" data-ga-brand="DECKE" data-ga-price="62300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972424')" tabindex="0">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/19/GM0122071972424_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="노이 미니 지퍼돌이"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071972424" tabindex="0">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071972424');" tabindex="0">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972424')" tabindex="0"> <span class="item-rank rank-top"> 7<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">노이 미니 지퍼돌이</div>
														<div class="item-price">
															<span class="price">62,300</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-active" data-slick-index="7" aria-hidden="false" style="width: 246px;" role="tabpanel" id="slick-slide27" aria-describedby="slick-slide-control27">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871934" data-ga-name="필로우" data-ga-brand="DECKE" data-ga-price="108500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871934')" tabindex="0">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871934_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="필로우"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871934" tabindex="0">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871934');" tabindex="0">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871934')" tabindex="0"> <span class="item-rank rank-top"> 8<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">필로우</div>
														<div class="item-price">
															<span class="price">108,500</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="8" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide28" aria-describedby="slick-slide-control28">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871931" data-ga-name="오푸스" data-ga-brand="DECKE" data-ga-price="199500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871931')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871931_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="오푸스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871931" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871931');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871931')" tabindex="-1"> <span class="item-rank rank-top"> 9<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">오푸스</div>
														<div class="item-price">
															<span class="price">199,500</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="9" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide29" aria-describedby="slick-slide-control29">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071972423" data-ga-name="노이 미니 지퍼돌이" data-ga-brand="DECKE" data-ga-price="62300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972423')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/19/GM0122071972423_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="노이 미니 지퍼돌이"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071972423" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071972423');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972423')" tabindex="-1"> <span class="item-rank rank-top"> 10<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">노이 미니 지퍼돌이</div>
														<div class="item-price">
															<span class="price">62,300</span>
															<del class="regular">89,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="10" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide210" aria-describedby="slick-slide-control210">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122101302240" data-ga-name="레슬리 22" data-ga-brand="DECKE" data-ga-price="295000">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302240')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/10/13/GM0122101302240_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="레슬리 22"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122101302240" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122101302240');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302240')" tabindex="-1"> <span class="item-rank rank-top"> 11<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">레슬리 22</div>
														<div class="item-price">
															<span class="price">295,000</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="11" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide211" aria-describedby="slick-slide-control211">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122062265318" data-ga-name="스윙" data-ga-brand="DECKE" data-ga-price="195000">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122062265318')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/06/22/GM0122062265318_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="스윙"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122062265318" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122062265318');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122062265318')" tabindex="-1"> <span class="item-rank rank-top"> 12<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">스윙</div>
														<div class="item-price">
															<span class="price">195,000</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="12" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide212" aria-describedby="slick-slide-control212">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122050648350" data-ga-name="보우 미니크로스" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648350')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/05/06/GM0122050648350_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="보우 미니크로스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122050648350" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122050648350');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648350')" tabindex="-1"> <span class="item-rank rank-top"> 13<span class="state-down">-3</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">보우 미니크로스</div>
														<div class="item-price">
															<span class="price">115,500</span>
															<del class="regular">165,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="13" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide213" aria-describedby="slick-slide-control213">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122050648356" data-ga-name="쁘띠 플로우" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648356')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/05/06/GM0122050648356_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="쁘띠 플로우"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122050648356" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122050648356');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648356')" tabindex="-1"> <span class="item-rank rank-top"> 14<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">쁘띠 플로우</div>
														<div class="item-price">
															<span class="price">115,500</span>
															<del class="regular">165,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="14" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide214" aria-describedby="slick-slide-control214">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871933" data-ga-name="필로우" data-ga-brand="DECKE" data-ga-price="108500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871933')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871933_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="필로우"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871933" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871933');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871933')" tabindex="-1"> <span class="item-rank rank-top"> 15<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">필로우</div>
														<div class="item-price">
															<span class="price">108,500</span>
															<del class="regular">155,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="15" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide215" aria-describedby="slick-slide-control215">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871936" data-ga-name="하프문 크로스" data-ga-brand="DECKE" data-ga-price="136500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871936')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871936_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="하프문 크로스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871936" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871936');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871936')" tabindex="-1"> <span class="item-rank rank-top"> 16<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">하프문 크로스</div>
														<div class="item-price">
															<span class="price">136,500</span>
															<del class="regular">195,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="16" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide216" aria-describedby="slick-slide-control216">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122083084352" data-ga-name="볼륨 카드슬롯" data-ga-brand="DECKE" data-ga-price="55300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122083084352')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/08/30/GM0122083084352_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="볼륨 카드슬롯"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122083084352" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122083084352');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122083084352')" tabindex="-1"> <span class="item-rank rank-top"> 17<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">볼륨 카드슬롯</div>
														<div class="item-price">
															<span class="price">55,300</span>
															<del class="regular">79,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="17" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide217" aria-describedby="slick-slide-control217">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122101302273" data-ga-name="스윙 양말" data-ga-brand="DECKE" data-ga-price="13000">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302273')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/10/13/GM0122101302273_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="스윙 양말"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122101302273" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122101302273');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302273')" tabindex="-1"> <span class="item-rank rank-top"> 18<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">스윙 양말</div>
														<div class="item-price">
															<span class="price">13,000</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="18" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide218" aria-describedby="slick-slide-control218">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122060961786" data-ga-name="보우 미니크로스" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122060961786')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/06/09/GM0122060961786_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="보우 미니크로스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122060961786" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122060961786');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122060961786')" tabindex="-1"> <span class="item-rank rank-top"> 19<span class="state-down">-10</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">보우 미니크로스</div>
														<div class="item-price">
															<span class="price">115,500</span>
															<del class="regular">165,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide" data-slick-index="19" aria-hidden="true" style="width: 246px;" tabindex="-1" role="tabpanel" id="slick-slide219" aria-describedby="slick-slide-control219">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071170580" data-ga-name="베르디" data-ga-brand="DECKE" data-ga-price="164500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071170580')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/11/GM0122071170580_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="베르디"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071170580" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071170580');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071170580')" tabindex="-1"> <span class="item-rank rank-top"> 20<span class="state-up">7</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">베르디</div>
														<div class="item-price">
															<span class="price">164,500</span>
															<del class="regular">235,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="20" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071972421" data-ga-name="아망떼 카드 지퍼지갑" data-ga-brand="DECKE" data-ga-price="62300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972421')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/19/GM0122071972421_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="아망떼 카드 지퍼지갑"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071972421" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071972421');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972421')" tabindex="-1"> <span class="item-rank rank-top"> 1<span class="state-up">2</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">아망떼 카드 지퍼지갑</div>
														<div class="item-price">
															<span class="price">62,300</span>
															<del class="regular">89,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="21" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122103109780" data-ga-name="탐탐 미니백" data-ga-brand="DECKE" data-ga-price="68600">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122103109780')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/10/31/GM0122103109780_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="탐탐 미니백"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122103109780" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122103109780');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122103109780')" tabindex="-1"> <span class="item-rank rank-top"> 2<span class="state-down">-1</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">탐탐 미니백</div>
														<div class="item-price">
															<span class="price">68,600</span>
															<del class="regular">98,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="22" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122081779096" data-ga-name="씨엘로 토트" data-ga-brand="DECKE" data-ga-price="227500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122081779096')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GM0122081779096_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="씨엘로 토트"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122081779096" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122081779096');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122081779096')" tabindex="-1"> <span class="item-rank rank-top"> 3<span class="state-up">10</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">씨엘로 토트</div>
														<div class="item-price">
															<span class="price">227,500</span>
															<del class="regular">325,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="23" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122050648354" data-ga-name="쁘띠 플로우" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648354')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/05/06/GM0122050648354_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="쁘띠 플로우"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122050648354" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122050648354');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648354')" tabindex="-1"> <span class="item-rank rank-top"> 4<span class="state-up">7</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">쁘띠 플로우</div>
														<div class="item-price">
															<span class="price">115,500</span>
															<del class="regular">165,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="24" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122022222416" data-ga-name="탐탐 미니백" data-ga-brand="DECKE" data-ga-price="68600">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122022222416')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/02/22/GM0122022222416_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="탐탐 미니백"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122022222416" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122022222416');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122022222416')" tabindex="-1"> <span class="item-rank rank-top"> 5<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">탐탐 미니백</div>
														<div class="item-price">
															<span class="price">68,600</span>
															<del class="regular">98,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="25" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122081879748" data-ga-name="노이 미니 지퍼돌이" data-ga-brand="DECKE" data-ga-price="62300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122081879748')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/08/18/GM0122081879748_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="노이 미니 지퍼돌이"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122081879748" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122081879748');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122081879748')" tabindex="-1"> <span class="item-rank rank-top"> 6<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">노이 미니 지퍼돌이</div>
														<div class="item-price">
															<span class="price">62,300</span>
															<del class="regular">89,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="26" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071972424" data-ga-name="노이 미니 지퍼돌이" data-ga-brand="DECKE" data-ga-price="62300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972424')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/19/GM0122071972424_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="노이 미니 지퍼돌이"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071972424" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071972424');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972424')" tabindex="-1"> <span class="item-rank rank-top"> 7<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">노이 미니 지퍼돌이</div>
														<div class="item-price">
															<span class="price">62,300</span>
															<del class="regular">89,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="27" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871934" data-ga-name="필로우" data-ga-brand="DECKE" data-ga-price="108500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871934')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871934_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="필로우"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871934" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871934');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871934')" tabindex="-1"> <span class="item-rank rank-top"> 8<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">필로우</div>
														<div class="item-price">
															<span class="price">108,500</span>
															<del class="regular">155,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="28" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871931" data-ga-name="오푸스" data-ga-brand="DECKE" data-ga-price="199500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871931')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871931_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="오푸스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871931" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871931');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871931')" tabindex="-1"> <span class="item-rank rank-top"> 9<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">오푸스</div>
														<div class="item-price">
															<span class="price">199,500</span>
															<del class="regular">285,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="29" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071972423" data-ga-name="노이 미니 지퍼돌이" data-ga-brand="DECKE" data-ga-price="62300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972423')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/19/GM0122071972423_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="노이 미니 지퍼돌이"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071972423" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071972423');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071972423')" tabindex="-1"> <span class="item-rank rank-top"> 10<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">노이 미니 지퍼돌이</div>
														<div class="item-price">
															<span class="price">62,300</span>
															<del class="regular">89,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="30" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122101302240" data-ga-name="레슬리 22" data-ga-brand="DECKE" data-ga-price="295000">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302240')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/10/13/GM0122101302240_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="레슬리 22"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122101302240" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122101302240');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302240')" tabindex="-1"> <span class="item-rank rank-top"> 11<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">레슬리 22</div>
														<div class="item-price">
															<span class="price">295,000</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="31" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122062265318" data-ga-name="스윙" data-ga-brand="DECKE" data-ga-price="195000">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122062265318')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/06/22/GM0122062265318_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="스윙"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122062265318" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122062265318');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122062265318')" tabindex="-1"> <span class="item-rank rank-top"> 12<span class="state-up">9</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">스윙</div>
														<div class="item-price">
															<span class="price">195,000</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="32" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122050648350" data-ga-name="보우 미니크로스" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648350')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/05/06/GM0122050648350_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="보우 미니크로스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122050648350" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122050648350');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648350')" tabindex="-1"> <span class="item-rank rank-top"> 13<span class="state-down">-3</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">보우 미니크로스</div>
														<div class="item-price">
															<span class="price">115,500</span>
															<del class="regular">165,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="33" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122050648356" data-ga-name="쁘띠 플로우" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648356')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/05/06/GM0122050648356_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="쁘띠 플로우"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122050648356" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122050648356');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122050648356')" tabindex="-1"> <span class="item-rank rank-top"> 14<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">쁘띠 플로우</div>
														<div class="item-price">
															<span class="price">115,500</span>
															<del class="regular">165,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="34" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871933" data-ga-name="필로우" data-ga-brand="DECKE" data-ga-price="108500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871933')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871933_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="필로우"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871933" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871933');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871933')" tabindex="-1"> <span class="item-rank rank-top"> 15<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">필로우</div>
														<div class="item-price">
															<span class="price">108,500</span>
															<del class="regular">155,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="35" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071871936" data-ga-name="하프문 크로스" data-ga-brand="DECKE" data-ga-price="136500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871936')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/18/GM0122071871936_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="하프문 크로스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071871936" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071871936');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071871936')" tabindex="-1"> <span class="item-rank rank-top"> 16<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">하프문 크로스</div>
														<div class="item-price">
															<span class="price">136,500</span>
															<del class="regular">195,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="36" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122083084352" data-ga-name="볼륨 카드슬롯" data-ga-brand="DECKE" data-ga-price="55300">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122083084352')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/08/30/GM0122083084352_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="볼륨 카드슬롯"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122083084352" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122083084352');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122083084352')" tabindex="-1"> <span class="item-rank rank-top"> 17<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">볼륨 카드슬롯</div>
														<div class="item-price">
															<span class="price">55,300</span>
															<del class="regular">79,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="37" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122101302273" data-ga-name="스윙 양말" data-ga-brand="DECKE" data-ga-price="13000">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302273')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/10/13/GM0122101302273_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="스윙 양말"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122101302273" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122101302273');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122101302273')" tabindex="-1"> <span class="item-rank rank-top"> 18<span class="state-up">8</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">스윙 양말</div>
														<div class="item-price">
															<span class="price">13,000</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="38" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122060961786" data-ga-name="보우 미니크로스" data-ga-brand="DECKE" data-ga-price="115500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122060961786')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/06/09/GM0122060961786_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="보우 미니크로스"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122060961786" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122060961786');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122060961786')" tabindex="-1"> <span class="item-rank rank-top"> 19<span class="state-down">-10</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">보우 미니크로스</div>
														<div class="item-price">
															<span class="price">115,500</span>
															<del class="regular">165,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
								<div class="slick-slide slick-cloned" data-slick-index="39" aria-hidden="true" style="width: 246px;" tabindex="-1">
									<div>
										<li class="swiper-slide" style="width: 100%; display: inline-block;">
											<figure class="item-box" data-ga-id="GM0122071170580" data-ga-name="베르디" data-ga-brand="DECKE" data-ga-price="164500">
												<div class="item-img">
													<div class="img-box">
														<a href="javascript:void(0)" onclick="goGodDetail('GM0122071170580')" tabindex="-1">
															<div class="img">
																<img src="https://cdn.hfashionmall.com/goods/HFBR/22/07/11/GM0122071170580_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="베르디"
																	onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
															</div>
														</a>
													</div>
													<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122071170580" tabindex="-1">
														<span>좋아요</span>
													</button>
													<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122071170580');" tabindex="-1">
														<span>상품 퀵뷰</span>
													</button>
												</div>
												<figcaption class="item-info">
													<a href="javascript:void(0)" onclick="goGodDetail('GM0122071170580')" tabindex="-1"> <span class="item-rank rank-top"> 20<span class="state-up">7</span>
													</span>
														<div class="item-brand">DECKE</div>
														<div class="item-name">베르디</div>
														<div class="item-price">
															<span class="price">164,500</span>
															<del class="regular">235,000</del>
															<span class="percent">30%</span>
														</div>
													</a>
												</figcaption>
											</figure>
										</li>
									</div>
								</div>
							</div>
						</div>
					</ul>
				</div>
				<div class="slide-nav type18" id="mainCnrBestSellerSlideBtn1" style="">
					<button type="button" class="slide-nav-prev slick-arrow" style="">이전</button>
					<button type="button" class="slide-nav-next slick-arrow" style="">다음</button>
				</div>
				<div class="slide-util" id="mainCnrBestSellerSlideBtn2" style="">
					<span class="slide-active">04</span> <span class="slide-pagination"><ul class="slick-dots" role="tablist" style="">
							<li class="" role="presentation"><button type="button" role="tab" id="slick-slide-control20" aria-controls="slick-slide20" aria-label="1 of 4" tabindex="-1">1</button></li>
							<li role="presentation" class=""><button type="button" role="tab" id="slick-slide-control21" aria-controls="slick-slide21" aria-label="2 of 4" tabindex="-1">2</button></li>
							<li role="presentation" class=""><button type="button" role="tab" id="slick-slide-control22" aria-controls="slick-slide22" aria-label="3 of 4" tabindex="-1">3</button></li>
							<li role="presentation" class="slick-active"><button type="button" role="tab" id="slick-slide-control23" aria-controls="slick-slide23" aria-label="4 of 4" tabindex="0" aria-selected="true">4</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control24" aria-controls="slick-slide24" aria-label="5 of 4" tabindex="-1">5</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control25" aria-controls="slick-slide25" aria-label="6 of 4" tabindex="-1">6</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control26" aria-controls="slick-slide26" aria-label="7 of 4" tabindex="-1">7</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control27" aria-controls="slick-slide27" aria-label="8 of 4" tabindex="-1">8</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control28" aria-controls="slick-slide28" aria-label="9 of 4" tabindex="-1">9</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control29" aria-controls="slick-slide29" aria-label="10 of 4" tabindex="-1">10</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control210" aria-controls="slick-slide210" aria-label="11 of 4" tabindex="-1">11</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control211" aria-controls="slick-slide211" aria-label="12 of 4" tabindex="-1">12</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control212" aria-controls="slick-slide212" aria-label="13 of 4" tabindex="-1">13</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control213" aria-controls="slick-slide213" aria-label="14 of 4" tabindex="-1">14</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control214" aria-controls="slick-slide214" aria-label="15 of 4" tabindex="-1">15</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control215" aria-controls="slick-slide215" aria-label="16 of 4" tabindex="-1">16</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control216" aria-controls="slick-slide216" aria-label="17 of 4" tabindex="-1">17</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control217" aria-controls="slick-slide217" aria-label="18 of 4" tabindex="-1">18</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control218" aria-controls="slick-slide218" aria-label="19 of 4" tabindex="-1">19</button></li>
							<li role="presentation"><button type="button" role="tab" id="slick-slide-control219" aria-controls="slick-slide219" aria-label="20 of 4" tabindex="-1">20</button></li>
						</ul></span> <span class="slide-total"></span> <span class="slide-auto type2">
						<button type="button" class="slide-auto-play">자동 슬라이드 시작</button>
						<button type="button" class="slide-auto-stop">자동 슬라이드 정지</button>
					</span>
				</div>
			</div>
			탭 콘텐츠2
			<div id="mBest-tab-cont2" class="main-best-cont">

				<div class="product-tab">
					<button type="button" onclick="goBestLink(this);" dspctgryno="">
						<span>ALL</span>
					</button>
					<button type="button" onclick="goBestLink(this);" dspctgryno="HFMA01">
						<span>MEN</span>
					</button>
					<button type="button" onclick="goBestLink(this);" dspctgryno="HFMA02">
						<span>WOMEN</span>
					</button>
					<button type="button" onclick="goBestLink(this);" dspctgryno="HFMA03">
						<span>KIDS</span>
					</button>
					<button type="button" onclick="goBestLink(this);" dspctgryno="HFMA04">
						<span>BAG&amp;ACC</span>
					</button>
					<button type="button" onclick="goBestLink(this);" dspctgryno="HFM" otltyn="Y">
						<span>OUTLET</span>
					</button>
				</div>
				<div class="slide-container product-list cont2">
					<ul id="ulBestKwdCnrGodList2" class="swiper-wrapper"></ul>
				</div>
				<div class="slide-nav type18" id="mainCnrBestSellerSlideBtn1" style="display: none;">
					<button type="button" class="slide-nav-prev">이전</button>
					<button type="button" class="slide-nav-next">다음</button>
				</div>
				<div class="slide-util" id="mainCnrBestSellerSlideBtn2" style="display: none;">
					<span class="slide-active">04</span> <span class="slide-pagination"></span> <span class="slide-total"></span> <span class="slide-auto type2">
						<button type="button" class="slide-auto-play">자동 슬라이드 시작</button>
						<button type="button" class="slide-auto-stop">자동 슬라이드 정지</button>
					</span>
				</div>
			</div>

		</div>
	</section>
	
	
	<section class="dp-section main-pick-tube">
		<h2 class="dp-title eng">
			<a href="/article/list?contType=htv" class="link"> H - TV</a>
		</h2>
		<div id="visualSlide2" class="visual-slide2" data-slide-length="8">
			<div class="slide-container swiper-container-horizontal">
				<div class="swiper-wrapper" style="transition-duration: 800ms; transform: translate3d(-3200px, 0px, 0px);">
					<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('MbZ50kJN4oQ','cmmnCnrHtvVideo7', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/67/4767/IMG2_4767_KOR_20221017172020.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4767/view">TOMMY JEANS 22 F/W 시즌 뮤즈로 돌아온 나연</a>
						</span>
					</div>
					<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('PPUOied6byE','cmmnCnrHtvVideo8', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/68/4768/IMG2_4768_KOR_20221017172334.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4768/view">TOMMY JEANS 22 F/W 나연 PICK! 아이템</a>
						</span>
					</div>
					<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('GGSYT-dA8Pw','cmmnCnrHtvVideo9', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/69/4769/IMG2_4769_KOR_20221017172830.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4769/view">DKNY 22 F/W #TODAY I FEEL</a>
						</span>
					</div>
					<div class="swiper-slide" data-swiper-slide-index="0" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('nklCruD0FCs','cmmnCnrHtvVideo2', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/76/4976/IMG2_4976_KOR_20221116150929.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4976/view">Oh, My Dear!</a>
						</span>
					</div>
					<div class="swiper-slide" data-swiper-slide-index="1" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('BgyGRyOGF-8','cmmnCnrHtvVideo3', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/63/4763/IMG2_4763_KOR_20221017170150.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4763/view">빈지노 IN NYC with TOMMY HILFIGER🗽 </a>
						</span>
					</div>
					<div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="2" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('gIEsgD95fO8','cmmnCnrHtvVideo4', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/40/4540/IMG2_4540_KOR_20220913104442.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4540/view">Falling in Fall</a>
						</span>
					</div>
					<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="3" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('zBAO89A2EeI','cmmnCnrHtvVideo5', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/65/4765/IMG2_4765_KOR_20221017170916.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4765/view">빈지노의 타미힐피거 뉴욕패션위크</a>
						</span>
					</div>
					<div class="swiper-slide swiper-slide-next" data-swiper-slide-index="4" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('1n44XiWFi8I','cmmnCnrHtvVideo6', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/66/4766/IMG2_4766_KOR_20221017171428.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4766/view">SWEATER WEATHER</a>
						</span>
					</div>
					<div class="swiper-slide" data-swiper-slide-index="5" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('MbZ50kJN4oQ','cmmnCnrHtvVideo7', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/67/4767/IMG2_4767_KOR_20221017172020.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4767/view">TOMMY JEANS 22 F/W 시즌 뮤즈로 돌아온 나연</a>
						</span>
					</div>
					<div class="swiper-slide" data-swiper-slide-index="6" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('PPUOied6byE','cmmnCnrHtvVideo8', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/68/4768/IMG2_4768_KOR_20221017172334.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4768/view">TOMMY JEANS 22 F/W 나연 PICK! 아이템</a>
						</span>
					</div>
					<div class="swiper-slide" data-swiper-slide-index="7" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('GGSYT-dA8Pw','cmmnCnrHtvVideo9', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/69/4769/IMG2_4769_KOR_20221017172830.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4769/view">DKNY 22 F/W #TODAY I FEEL</a>
						</span>
					</div>
					<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('nklCruD0FCs','cmmnCnrHtvVideo2', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/76/4976/IMG2_4976_KOR_20221116150929.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4976/view">Oh, My Dear!</a>
						</span>
					</div>
					<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="1" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('BgyGRyOGF-8','cmmnCnrHtvVideo3', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/63/4763/IMG2_4763_KOR_20221017170150.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4763/view">빈지노 IN NYC with TOMMY HILFIGER🗽 </a>
						</span>
					</div>
					<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="2" style="width: 640px;">
						<button type="button" class="btn-play" onclick="layerViewVod('gIEsgD95fO8','cmmnCnrHtvVideo4', 'youtube');">
							<img src="https://cdn.hfashionmall.com/display/trnd/40/4540/IMG2_4540_KOR_20220913104442.jpg?RS=700" alt="1">
						</button>
						<span class="txt"> <a href="/article/htv/4540/view">Falling in Fall</a>
						</span>
					</div>
				</div>
				<div class="slide-nav type4">
					<button type="button" class="slide-nav-prev" tabindex="0" role="button" aria-label="Previous slide">이전</button>
					<button type="button" class="slide-nav-next" tabindex="0" role="button" aria-label="Next slide">다음</button>
				</div>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
			</div>
		</div>
	</section> -->
	<!-- 삭제끝 -->
	
	
	<section class="dp-section bg-section main-review-plus">
		<h2 class="dp-title">
			BEST REVIEW
			<button type="button" class="btn_more" onclick="location.href='review/reviewList'">전체보기</button>
		</h2>
		<div class="review-plus-list">
			<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
<c:forEach var="rvbestlist" items="${BestReviewList}">
						<!-- rvbestlist 변수 선언 -->
						<div class="review-plus-cont" onclick="frmSubmit('${rvbestlist.r_no}');">
							<a href="javascript:undefined;"
								onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');">
								<figure class="item" data-ga-name="아이코닉 토트백">
									<div class="img">
										<span> <img
											src='${contextPath}/\images/review/${rvbestlist.r_img}'
											alt="" style="transform: rotate(0deg)">
									</div>
								</figure>
							</a>
							<div class="product-list-sub">
								<a href="javascript:undefined;"
									onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');">
								</a>
								<figure class="item-box">
										<span class="item-rank rank-top">BEST <span
											class="state">REVIEW</span></span>
											 <span class="item-img"> 
											<img src='<c:url value='${rvbestlist.img_loc}'></c:url>'>									
									</span>								
									</a>
									<figcaption class="item-info">
										<a href="javascript:undefined;"
											onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');">
										</a><a href="javascript:void(0)"
											onclick="goGodDetail('GM0122093098215')">
											<form
												action="${contextPath}/Hfashion?command=reviewdetail&R_no=${rvbestlist.r_no}"
												method="post"
												id = "frm${rvbestlist.r_no}">
												<!-- 리뷰 디테일 jsp로 변수 전달 -->
												<input type="hidden" name="proname"
													value="${rvbestlist.pro_name}"> <input type="hidden"
													name="b_name" value="${rvbestlist.brand_name}"> <input
													type="hidden" name="img_loc" value="${rvbestlist.img_loc}" style="transform:rotate(90deg);">
													<input type="hidden" name="r_img" value="${rvbestlist.r_img}" style="transform:rotate(90deg);">
											
											</form>
											<div class="item-brand">${rvbestlist.brand_name}</div>
											<div class="item-name">${rvbestlist.pro_name}</div>
											<div class="item-price">
												<span class="price"><fmt:formatNumber value="${rvbestlist.pro_price}" pattern="#,###" /></span>
											</div>
											<div class="item-size">
												<span>${rvbestlist.size_name}</span>
											</div>
										</a>
									</figcaption>
								</figure>
							</div>
							<figure class="item">
								<figcaption class="info">

									<div class="point-wrap">									
										<div class="item-color">
											<span class="color" style="font-size: 13px;">SIZE: ${rvbestlist.size_name}          좋아요 수: ${rvbestlist.r_like}
											</span>
										</div>
									</div>

									<div class="item-comment">
										<span class="comment-txt"> ${rvbestlist.r_content}</span>
									</div>
								</figcaption>
							</figure>

						</div>
					</c:forEach>
		</div>
	</section>
</div>
<div class="fixed-btn">
	
	
	<button type="button" class="top" onclick="scrollMov(0, 200);"><span>TOP</span></button>
</div>
<script>

function frmSubmit(i){
	$("#frm"+i).submit();
}
</script>



<%@ include file="layout/footer.jsp"%>