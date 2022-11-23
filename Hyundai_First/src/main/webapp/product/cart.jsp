<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">
	<section class="content-wrap">
		<h3 class="page-title">장바구니</h3>

		<div id="cartContentList">
			<div class="tab-wrap">
				<ul class="tabs tab-btn">
					<li class="on">
						<button type="button"
							onclick="javascript:view('GNRL_DLV');event.stopImmediatePropagation();">
							<span class="gnrlCartCnt">택배(0)</span>
						</button>
					</li>
					<li>
						<button type="button"
							onclick="javascript:view('PKUP_DLV');event.stopImmediatePropagation();">
							<span class="pkupCartCnt">매장수령(0)</span>
						</button>
					</li>
				</ul>
			</div>

			<div id="cartList" class="order-tbl type-cart">


				<div class="head">
					<div class="cell-check">
						<label class="check-skin only"> <input type="checkbox"
							class="allChk"> <span>전체 선택</span>
						</label>
					</div>
					<div class="cell-info">상품정보</div>
					<div class="cell-price">상품금액</div>
					<div class="cell-btn">선택</div>
					<div class="cell-dlv">배송정보</div>
				</div>
				<div class="body">
					<div class="nodata">
						<p class="txt-nodata">장바구니에 담긴 상품이 없습니다.</p>
					</div>
				</div>
			</div>

			<div class="tbl-btn">
				<button type="button" class="btn-type3-m" onclick="">
					<span>선택삭제</span>
				</button>
				<button type="button" class="btn-type3-m" onclick="">
					<span>품절삭제</span>
				</button>
			</div>

			<!-- 최종금액 -->
			<div class="cart-price" mbratrbcd="">
				<div class="inner">
					<span class="price"> <span class="txt">상품금액</span> <span
						id="totalGodAmt" class="num">0</span> 원
					</span> <span class="symbol-plus">+</span> <span class="price"> <span
						class="txt">배송비
							<button type="button" class="btn-tooltip"
								onmouseenter="tooltip('dlvCost-info', null, '/tooltip?type=costInfo');">
								<span>툴팁보기</span>
							</button>
					</span> <span id="totalDlvAmt" class="num">0</span> 원
					</span> <span class="symbol-minus">-</span> <span class="price sale">
						<span class="txt">총 할인금액</span> <span id="totalDcAmt" class="num">0</span>
						원
					</span> <span class="symbol-eq">=</span> <span class="price total">
						<span class="txt">결제금액</span> <span id="totalOrdAmt" class="num">0</span>
						원
					</span>
				</div>
			</div>

			<div class="btn-box">
				<a href="/" class="btn-type4-lg">쇼핑 계속하기</a> <a
					href="javascript:void(0);" class="btn-type2-lg">선택상품 주문하기</a>
			</div>

			<ul class="txt-list">
				<li>장바구니에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품은 자동 삭제됩니다.</li>
				<li>장바구니에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>
				<!-- 200703 text -->
				<li>장바구니에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
				<li>입점 판매 상품은 장바구니에서 [입점 판매 상품]으로 표시됩니다.
					<button type="button" class="point-link"
						onclick="layer.open('layerSaleInfo')">입점 판매 상품 안내 보기</button>
				</li>
			</ul>
		</div>
	</section>
</div>

<%@ include file="../layout/footer.jsp"%>