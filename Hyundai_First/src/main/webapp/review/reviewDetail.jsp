<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/ui.min.css">
<div id="container">
	<!-- s : 리뷰 작성 / 수정 레이어 팝업-->
	<div id="reviewDetail" class="layer-pop lg review-layer" tabindex="0"
		style="display: block;">
		
		<div class="layer-wrap" tabindex="0">
			<div class="layer-header">
				<h2 class="layer-title">REVIEW</h2>
			</div>
			<div class="layer-container review-detail">
				<section class="review-content">
					<div class="cont">
						<div id="reviewImg" class="img-wrap" data-slide-length="2">
							<div class="slide-container swiper-container-horizontal">
								<ul class="swiper-wrapper"
									style="transition-duration: 0ms; transform: translate3d(-800px, 0px, 0px);">
									<li
										class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
										data-swiper-slide-index="1" style="width: 400px;"><img
										src="https://cdn.hfashionmall.com/contents/review/2340456459650473.jpg?RS=400&amp;AO=1"
										style="transform: rotate(90deg)"></li>
									<li
										class="swiper-slide swiper-slide-prev swiper-slide-duplicate-next"
										data-swiper-slide-index="0" style="width: 400px;"><img
										src="https://cdn.hfashionmall.com/contents/review/2166442984415459.jpg?RS=400&amp;AO=1"
										style="transform: rotate(90deg)"></li>
									<li class="swiper-slide swiper-slide-active"
										data-swiper-slide-index="1" style="width: 400px;"><img
										src="https://cdn.hfashionmall.com/contents/review/2340456459650473.jpg?RS=400&amp;AO=1"
										style="transform: rotate(90deg)"></li>
									<li
										class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev"
										data-swiper-slide-index="0" style="width: 400px;"><img
										src="https://cdn.hfashionmall.com/contents/review/2166442984415459.jpg?RS=400&amp;AO=1"
										style="transform: rotate(90deg)"></li>
								</ul>
								<span class="swiper-notification" aria-live="assertive"
									aria-atomic="true"></span>
							</div>
							<div
								class="slide-pagination swiper-pagination-clickable swiper-pagination-bullets"></div>
						</div>
						<div class="cont-wrap">
							<h3 class="title">예뻐요</h3>
							<div class="opt-wrap">
								<p class="point size-m">
									<span class="ico" style="width: 100%">별점 5점</span>
								</p>
							</div>
							<div class="txt-wrap">
								<p class="txt">6세 아들 조금 여유있게 8사이즈 샀는데 소매한번 접어입히고 길이랑 폼은 예쁘게
									여유있어요 스판이라 활동하기에 편한지 입으면 좋아해요</p>
							</div>

						</div>

					</div>
					<div class="column-wrap">
						<section class="review-item"
							onclick="goGodDetail('GM0122072975341');">
							<h3 class="sub-title">상품정보</h3>
							<figure>
								<div class="item-img">
									<img
										src="https://cdn.hfashionmall.com/goods/THBR/22/07/29/GM0122072975341_1_ORGINL.jpg"
										alt="스트레치 데님 셔츠">
								</div>
								<figcaption class="item-info">
									<div class="item-brand">TOMMY HILFIGER KIDS</div>
									<div class="item-name">스트레치 데님 셔츠</div>
									<div class="item-price">
										<span class="price">80,500</span>

									</div>
								</figcaption>
							</figure>
						</section>
						<section>
							<h3 class="sub-title">고객 선택정보</h3>
							<table class="buy-info">
								<caption>구매 상품 사이즈, 구매옵션</caption>
								<tbody>
									<tr>
										<th scope="row">리뷰 고객님 사이즈</th>
										<td><span>118cm</span></td>
									</tr>
									<tr>
										<th scope="row">구매옵션</th>
										<td><span>08</span> <span class="pdColor-"></span></td>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</section>

				<section class="product-detail-review">
					<div class="chart-wrap" id="chartSlide"></div>

					<script>
						pieChartSum();
						window.addEventListener('load', function() {
							slide.create('chartSlide');
						});
					</script>
				</section>

			</div>
			<button type="button" class="btn-layer-close"
				onclick="reviewDetail.close();">닫기</button>
		</div>
	</div>
	<div id="reviewWrite" class="layer-pop lg review-layer" tabindex="0">
	</div>
</div>
