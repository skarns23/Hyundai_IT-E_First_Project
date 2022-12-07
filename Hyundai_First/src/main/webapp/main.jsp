<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div id="container" style="padding-top: 90px;">
	<!-- 메인 영상 section -->
	<section class="dp-section main-back-video" id="video-box">
		<video muted autoplay loop style="width: 100%;">
			<source src="videos/hfashionVideo.mp4" type="video/mp4">
		</video>
		<div class="arrow-down">
			<a id="arrow" href="#ranking" onclick="scrollMov(900, 100)"> <span></span> <span></span> <span></span>
			</a>
		</div>
	</section>
	
	<!-- 베스트 랭킹 section -->
	<section class="dp-section main-keyword-ranking" id="ranking">
		<div class="keyword-ranking">
			<h2 class="title">
				BEST <br>RANKING
			</h2>
			<ul id="mainCnrKeywordRanking" class="list" style="">
				<c:forEach var="blist" items="${bestItemList}">
					<c:set var="i" value="${i+1}" />
					<li class="active"><a href="javascript:void(0)" onclick="fn_searchLink('타미'); return false;" class="category"> <span class="num">${i}</span> <span class="name">${blist.productName}</span>
							<span class="state-mid">상승</span>
					</a> <c:if test="${i eq 1}">

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
					<a href="javascript:void(0)" onclick="fn_searchLink('타미'); return false;" class="link"></a>
					</li>
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

	<!-- 베스트 리뷰 section -->
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
					<a href="javascript:undefined;" onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');">
						<figure class="item" data-ga-name="아이코닉 토트백">
							<div class="img">
								<span> <img src='${contextPath}/\images/review/${rvbestlist.r_img}' alt="" style="transform: rotate(0deg)">
							</div>
						</figure>
					</a>
					<div class="product-list-sub">
						<a href="javascript:undefined;" onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');"> </a>
						<figure class="item-box">
							<span class="item-rank rank-top">BEST <span class="state">REVIEW</span></span>
							<span class="item-img"> <img src='<c:url value='${rvbestlist.img_loc}'></c:url>'>
							</span>
							</a>
							<figcaption class="item-info">
								<a href="javascript:undefined;" onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');"> </a><a href="javascript:void(0)" onclick="goGodDetail('GM0122093098215')">
									<form action="${contextPath}/Hfashion?command=reviewdetail&R_no=${rvbestlist.r_no}" method="post" id="frm${rvbestlist.r_no}">
										<!-- 리뷰 디테일 jsp로 변수 전달 -->
										<input type="hidden" name="proname" value="${rvbestlist.pro_name}"> <input type="hidden" name="b_name" value="${rvbestlist.brand_name}"> <input type="hidden" name="img_loc"
											value="${rvbestlist.img_loc}" style="transform: rotate(90deg);"> <input type="hidden" name="r_img" value="${rvbestlist.r_img}" style="transform: rotate(90deg);">

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
									<span class="color" style="font-size: 13px;">SIZE: ${rvbestlist.size_name} 좋아요 수: ${rvbestlist.r_like} </span>
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

<!-- 페이지 가장 위로 올라가는 top 버튼 -->
<div class="fixed-btn">
	<button type="button" class="top" onclick="scrollMov(0, 200);">
		<span>TOP</span>
	</button>
</div>

<script>
function frmSubmit(i){
	$("#frm"+i).submit();
}
</script>

<%@ include file="layout/footer.jsp"%>