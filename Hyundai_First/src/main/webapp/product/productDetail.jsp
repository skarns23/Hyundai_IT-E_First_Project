<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script type="text/javascript" src="${contextPath}/js/product/productDetail.js"></script>

<div id="container">
	<div class="content-response">
		<div class="product-view-top">
			<div class="product-view-img">
				<div id="pdViewSlide" class="product-view-slide" data-slide-length="6">
					<div class="slide-container swiper-container-horizontal">
						<div id="productImgSlide" class="swiper-wrapper" style="transform: translate3d(-1300px, 0px, 0px); transition-duration: 0ms;">
							<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_5_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'">
							</div>
							<div class="swiper-slide swiper-slide-duplicate swiper-slide-prev" data-swiper-slide-index="5" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_6_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'">
							</div>
							<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="0" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_1_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'" data-gtm-vis-first-on-screen-32062759_265="265" data-gtm-vis-first-on-screen-32062759_407="265"
									data-gtm-vis-recent-on-screen-32062759_265="49351" data-gtm-vis-total-visible-time-32062759_265="2000" data-gtm-vis-recent-on-screen-32062759_407="49352"
									data-gtm-vis-total-visible-time-32062759_407="2000" data-gtm-vis-has-fired-32062759_265="1" data-gtm-vis-has-fired-32062759_407="1">
							</div>
							<div class="swiper-slide swiper-slide-next" data-swiper-slide-index="1" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_2_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'" data-gtm-vis-first-on-screen-32062759_265="265" data-gtm-vis-first-on-screen-32062759_407="265"
									data-gtm-vis-recent-on-screen-32062759_265="49352" data-gtm-vis-total-visible-time-32062759_265="2000" data-gtm-vis-recent-on-screen-32062759_407="49352"
									data-gtm-vis-total-visible-time-32062759_407="2000" data-gtm-vis-has-fired-32062759_265="1" data-gtm-vis-has-fired-32062759_407="1">
							</div>
							<div class="swiper-slide" data-swiper-slide-index="2" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_3_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'">
							</div>
							<div class="swiper-slide" data-swiper-slide-index="3" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_4_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'">
							</div>
							<div class="swiper-slide" data-swiper-slide-index="4" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_5_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'">
							</div>
							<div class="swiper-slide swiper-slide-duplicate-prev" data-swiper-slide-index="5" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_6_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'">
							</div>
							<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_1_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'" data-gtm-vis-polling-id-32062759_265="241" data-gtm-vis-polling-id-32062759_407="244"
									data-gtm-vis-recent-on-screen-32062759_265="265" data-gtm-vis-first-on-screen-32062759_265="265" data-gtm-vis-total-visible-time-32062759_265="100"
									data-gtm-vis-recent-on-screen-32062759_407="265" data-gtm-vis-first-on-screen-32062759_407="265" data-gtm-vis-total-visible-time-32062759_407="100">
							</div>
							<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1" style="width: 650px;">
								<img src="https://cdn.hfashionmall.com/goods/DKBR/22/10/31/GM0122103109697_2_ORGINL.jpg?RS=960x960&amp;AR=0&amp;CS=640x960" alt="퀼팅 다운 점퍼"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'" data-gtm-vis-polling-id-32062759_265="242" data-gtm-vis-polling-id-32062759_407="245"
									data-gtm-vis-recent-on-screen-32062759_265="265" data-gtm-vis-first-on-screen-32062759_265="265" data-gtm-vis-total-visible-time-32062759_265="100"
									data-gtm-vis-recent-on-screen-32062759_407="265" data-gtm-vis-first-on-screen-32062759_407="265" data-gtm-vis-total-visible-time-32062759_407="100">
							</div>
						</div>
						<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
					</div>
					<div class="slide-pagination swiper-pagination-clickable swiper-pagination-bullets">
						<button type="button" class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 1">1</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2">2</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3">3</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4">4</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 5">5</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 6">6</button>
					</div>
					<div class="slide-nav type6">
						<button type="button" class="slide-nav-prev" tabindex="0" role="button" aria-label="Previous slide">이전</button>
						<button type="button" class="slide-nav-next" tabindex="0" role="button" aria-label="Next slide">다음</button>
					</div>
				</div>
			</div>

			<div class="product-view-info">
				<div class="etc-btn">
					<button type="button" class="btn-like " onclick="addBukmk(this,addBukmkCallback);" godno="GM0122103109697">
						<strong class="godBukmkCnt" cnt="6" godno="GM0122103109697"></strong> <span>좋아요</span>
					</button>
					<span class="bar">|</span>
					<button type="button" class="btn-share" onclick="layerBox.open('layerShare');">
						<span>공유</span>
					</button>
				</div>

				<p class="item-brand">
					<a href="#"> ${pVO.pro_gender}</a>
				</p>

				<p class="item-tag">
					<span class="code">${pVO.brand_name}</span>
				</p>
				<p class="item-name">${pVO.pro_name}</p>

				<div class="item-price">
					<p class="price">
						<span> ${pVO.pro_price_f}</span>
					</p>
				</div>
				<div class="product-view-option">
					<div class="size-wrap">
						<c:forEach var="sVO" items="${sList}">
							<div class="size-btn-wrap">
								<button id="size${sVO.size_name}" class="size-btn" onclick="optionSelect('${sVO.size_name}')" value="${sVO.size_name}">${sVO.size_name}</button>
							</div>
						</c:forEach>

					</div>
					<div class="option-bot">
						<div name="qtyDiv" class="row quantity gnrlOptQty" style="" godno="GM0122080876890" selectoptionyn="Y">
							<strong class="tit">06</strong> <span class="item-count">
								<button type="button" class="btn-minus" onclick="quantityCalc('minus');">
									<span>빼기</span>
								</button> <input type="number" name="qtySpinner" godno="GM0122080876890" minordqty="1" maxordqty="6" class="input-num" value="1" onkeyup="changeQty(this);">
								<button type="button" class="btn-plus" onclick="quantityCalc('plus');">
									<span>더하기</span>
								</button>
							</span> <span class="price"> <span class="num">150,500</span>
								<button type="button" class="btn-reset" onclick="resetOptionDiv(this);">
									<span>옵션초기화</span>
								</button>
							</span>
						</div>


						<div class="total" style="">
							<strong class="tit">합계</strong> <span class="num">150,500</span>
						</div>
						<div class="btn-box">
							<button name="btnShoppingBag" type="button" class="btn-type4-xlg btnShoppingBag">
								<span>장바구니 보기</span>
							</button>
							<button name="btnBuynow" type="button" class="btn-type2-xlg">
								<span> <input type="hidden" id="godSaleSectCd" value="N"> 장바구니 담기
								</span>
							</button>
							<form id="addCartForm" name="addCartForm" action="${contextPath}/Hfashion?command=addCart" method="get" style="display: none;">
								<input id="pro_no" name="pro_no" value="1"> 
								<input id="size_name" name="size_name" value=""> 
								<input id="size_amount" name="size_amount" value="1">
							</form>
						</div>
					</div>
				</div>
				<div class="info-bot">
					<ul class="list">
						<li class="row"><span class="tit">배송비</span> <span> <input type="hidden" id="otskrDlvAditCost" value="Y"> 30,000이상 구매시 무료(도서산간추가 3000원)
								<button type="button" class="btn-tooltip" onclick="tooltip('dlv-hardarea'); $('.list-common.address').niceScroll(dScroll.opt);">툴팁보기</button>
						</span>

							<div class="dlv-hardarea" style="display: none;">
								<ul class="txt-list">
									<li>구매하신 상품에 따라 배송비가 부과됩니다.</li>
									<li>도서산간 지역은 배송비가 추가 될 수 있습니다.<br> 해당 지역은 FAQ를 통해 확인하실 수 있습니다.
									</li>
									<li>H.Point, 한섬마일리지, H.Plus 등의 할인수단으로<br> 배송비 결제가 불가합니다.
									</li>
								</ul>
							</div></li>

						<li><span class="tit">한섬마일리지</span> <span>최대 6% 적립
								<button type="button" class="btn-tooltip" onclick="tooltip('mileage-info2');">
									<span>툴팁보기</span>
								</button>
								<li><span class="tit">H포인트</span> <span>0.1% 적립
										<button type="button" class="btn-tooltip" onclick="tooltip('hpoint-info2', null, null,null,null);">
											<span>툴팁보기</span>
										</button>
								</span></li>
					</ul>
				</div>
			</div>

		</div>
		<div class="product-view-detail">
			<div class="product-detail-tab tab-wrap2 anchor-wrap">
				<!-- 상품 상세 정보 -->
				<section id="tabContentReview" class="anchor-section product-detail-review">
					<h3 class="sec-title">리뷰</h3>
					<div class="review-total">
						<div class="member-total-point">
							<h4 class="tit">사용자 총 평점</h4>
							<p class="point size-l">
								<span class="ico" style="width: 96%;">별점</span> <span class="num">4.8</span>
							</p>
						</div>
					</div>
					<div class="product-detail-review-list">
						<div class="head">
							<div id="prdReviewFilter" class="opt">
								<div class="select">
									<button type="button" class="sel-btn" onclick="select.trigger();">최신순</button>
									<div id="reviewSortFilter" class="sel-list">
										<ul>
											<li><label><input type="radio" name="rvList" value="new"> <span>최신순</span></label></li>
											<li><label><input type="radio" name="rvList" value="like"> <span>공감순</span></label></li>
										</ul>
									</div>
								</div>
								<div class="select">
									<button type="button" class="sel-btn on" onclick="select.trigger();">S</button>
									<div class="sel-list">
										<ul>
											<li><label> <input type="radio" name="optValCd1" value="XS"> <span>XS</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1" value="S"> <span>S</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1" value="M"> <span>M</span>
											</label></li>
											<li><label> <input type="radio" name="optValCd1" value="L"> <span>L</span>
											</label></li>
										</ul>
									</div>
								</div>
								<button type="button" class="btn-type1-sm" onclick="getReviewList('1','F','F',null);">
									<span>필터적용</span>
								</button>
							</div>
							<div class="opt"></div>
						</div>
						<div id="allReviewList" class="board-list board-review ui-fold" style="">
							<ul class="list-content">
								<li class="on">
									<div class="list-row fold-header">
										<div class="cell-title">
											<ul class="etc-info">
												<li><span class="point size-m"><span class="ico" style="width: 100%">별점 5점</span></span></li>
												<li>
													<button type="button" class="btn-like2" onclick="addGodEvlLikeCount(this,addLikeList);" godevlturn="1" reviewgodno="GM0122092795931">
														<span class="like-count" likecnt="1"> 1</span>
													</button>
												</li>
												<li><span class="date">2022.10.25</span></li>
											</ul>
											<p class="title-review">
												부드럽고 좋아요<i class="icon-attach">이미지 첨부</i>
											</p>
											<button type="button" class="btn-fold">열기</button>
										</div>
									</div>
									<div class="fold-cont open">
										<div class="review-group">
											<ul class="review-prd-info">
												<li>
													<div class="prd-name">sil*****&nbsp;</div>
												</li>
												<li>
													<div class="prd-option">

														&nbsp;155cm ,통통한편 &nbsp;/ &nbsp; 구매옵션 : S<em class="prd-option-color"> <span class="pdColor-/colorchips/GM0122092795931_COLORCHIP.jpg">BLACK</span>
														</em>
													</div>
												</li>
											</ul>
											<ul class="files">
												<li class="img-file">
													<button type="button" onclick="layerViewImg();" style="background-image: url(https://cdn.hfashionmall.com/contents/review/734372004212235.jpeg); transform: rotate(0deg);">
														<img src="https://cdn.hfashionmall.com/contents/review/734372004212235.jpeg" alt="7AE074DE-6EE9-4107-BFFF-4E1874F1AB83" style="transform: rotate(0deg);">
													</button>
												</li>
											</ul>
											<div class="txt-box">배송 빨라요. 촉감이 부드러워요. 기본 아이템이로 딱입니다. 다른 색도 구매하고 싶어요. 코디하기 좋습니다.</div>
											<div class="review-report">
												<button type="button" class="btn-report" onclick="alert('로그인 후 참여 가능합니다.');location.href='/public/member/login'"></button>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>