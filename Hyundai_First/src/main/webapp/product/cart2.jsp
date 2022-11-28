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
							<span class="gnrlCartCnt">택배(1)</span>
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

			<div id="0">
				<div id="cartList" class="order-tbl type-cart">


					<div class="head">
						<div class="cell-check">
							<label class="check-skin only"> <input type="checkbox"
								id="chk_0" name="cartAllCheckbox" class="allChk"
								onclick="javascript:check.all($(this),0);event.stopImmediatePropagation();"><span>전체
									선택</span>
							</label>
						</div>
						<div class="cell-info">상품정보</div>
						<div class="cell-price">상품금액</div>
						<div class="cell-btn">선택</div>
						<div class="cell-dlv">배송정보</div>
					</div>
					<!-- //head -->
					<!-- body -->
					<div class="body">
						<!-- row -->
						<div class="row " id="0" name="tr0_0" gdturn="3" gdidx="0">
							<div class="inner">
								<div class="cell-check">
									<label class="check-skin only"> <input type="checkbox"
										soldoutyn="N" id="0_0" name="check" value="0"
										onclick="javascript:check.one(0,0,$(this));event.stopImmediatePropagation();">
										<span>선택</span>
									</label>
								</div>

								<div class="cell-pd-wrap">
									<!-- 상품 별 정보/가격 -->
									<div class="inner-row">
										<div class="cell-pd">
											<div class="item-img">
												<a href="javascript:void(0);"
													onclick="javascript:goToEncodeUrl('/product/GM0122080877145/detail');">
													<img
													src="https://cdn.hfashionmall.com/goods/HFBR/22/08/08/GM0122080877145_0_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135"
													alt=""
													onerror="javascript:this.src='../../resources/images/temp/pd_86x129.jpg'">
												</a>
												<button type="button" class="btn-like-s "
													onclick="addBukmk(this,addBukmkCallback);"
													godno="GM0122080877145">
													<span>좋아요</span>
												</button>
											</div>
											<div class="item-info">
												<div class="item-label"></div>
												<div class="item-brand">
													<a href="javascript:void(0);"
														onclick="javascript:goToEncodeUrl('/product/GM0122080877145/detail');">DECKE
													</a>
												</div>
												<div class="item-name" catename="여성/가방/숄더">
													<a href="javascript:void(0);"
														onclick="javascript:goToEncodeUrl('/product/GM0122080877145/detail');">튜브
														바게트 </a>
												</div>
												<div class="item-opt">
													<span color="BLACK"> BLACK , FR </span> <span>수량 : 1
														개</span>
												</div>

												<input type="hidden" name="list[0].bskGodList[0].itmQty"
													value="1" initvalue="1" readonly="">
												<button type="button" class="btn-link"
													onclick="javascript:option.optChange('N',0,0);">
													<span>옵션변경</span>
												</button>
												<div class="item-etc"></div>


												<div class="item-link"></div>
											</div>
										</div>
										<div class="cell-price">
											<input type="hidden" id="benefit0_0" prctype="GNRL"
												amt="97500" crsgrp="" godamt="0" imdtldcamt="97500"
												cpnamt="0" cpnbamt="0"> <input type="hidden"
												id="price0_0" price="325000">
											<div class="price" emplmtddctyn="N">
												<span> <span class="num" id="orderPrice0_0"
													cvrprc="325000" saleprc="227500" calcorderprice="227500">227,500</span>
													원


												</span>
											</div>
										</div>
									</div>
									<!-- //상품 별 정보/가격 -->
								</div>
								<div class="cell-btn">
									<!-- 품절은 아니나 매장픽업수령일자가 초과된 경우는 비활성화 처리함. -->
									<button type="button" class="btn-type4-sm"
										onclick="javascript:selectGoodsOrder(0,0);">
										<span>바로구매</span>
									</button>
									<button type="button" class="btn-del" godno="GM0122080877145"
										itmqty="1" onclick="javascript:goodsDel(0,0);">
										<span>삭제</span>
									</button>
								</div>
							</div>
						</div>
						<!-- 배송정보 -->
						<div class="cell-dlv">
							<div class="inner">


								<span style="display: none" id="dlv554" dlvamt="0"
									dlvchecked="Y" startindex="0" endindex="0"></span>
								<p>
									<span class="sort">[본사배송]</span> <span id="godDlvAmt_0_0"
										class="txt" dmstcdlvcstplcsn="554"
										dlvcstlevysectcd="COND_FREE" dmstcdlvcstexmstdramt="30000"
										dmstcdlvcst="2500" grpindex="0" grpsoldoutyn="N">무료배송</span> <span
										class="sub">30,000원 미만 결제시 <br> 2,500원
									</span>
								</p>
							</div>
						</div>
						<!-- //배송정보 -->

					</div>
					<!-- //body -->
				</div>
				<div class="tbl-btn">
					<button type="button" class="btn-type3-m"
						onclick="javascript:selectedGoodsDel(0, false);">
						<span>선택삭제</span>
					</button>
					<button type="button" class="btn-type3-m"
						onclick="javascript:selectedGoodsDel(0, true);">
						<span>품절삭제</span>
					</button>
				</div>

				<!-- 최종금액 -->
				<div class="cart-price" mbratrbcd="GNRL_MBR">
					<div class="inner">
						<span class="price"> <span class="txt">상품금액</span> <span
							id="totalGodAmt" class="num">325,000</span> 원
						</span> <span class="symbol-plus">+</span> <span class="price"> <span
							class="txt">배송비
								<button type="button" class="btn-tooltip"
									onmouseenter="tooltip('dlvCost-info', null, '/tooltip?type=costInfo');">
									<span>툴팁보기</span>
								</button>
						</span> <span id="totalDlvAmt" class="num">0</span> 원
						</span> <span class="symbol-eq">=</span> <span class="price total">
							<span class="txt">결제금액</span> <span id="totalOrdAmt" class="num">227,500</span>
							원
						</span>
					</div>
				</div>

				<div class="btn-box">
					<a href="/" class="btn-type4-lg">쇼핑 계속하기</a> <a
						href="${contextPath}/product/order.jsp" class="btn-type2-lg"
						">선택상품 주문하기</a>
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
		</div>
		<!-- 입점 판매 상품 안내 -->
		<div id="layerSaleInfo" class="layer-pop" tabindex="0">
			<div class="layer-wrap" tabindex="0">
				<div class="layer-header">
					<h2 class="layer-title">입점 판매 상품 안내</h2>
				</div>
				<div class="layer-container">
					<div class="layer-content sale-info">
						<p class="txt-common">
							입점 판매 상품 구매 시, <br>아래 내용을 참고해 주시기 바랍니다.
						</p>
						<!-- 2021.03.16 수정 -->
						<ul class="txt-list">
							<li>H패션몰 입점 파트너 상품들은 장바구니에서 [입점 판매 상품]으로 표시됩니다.</li>
							<li>[입점 판매 상품]은 쿠폰 이름에 <span class="pcolor">[입점 상품 전용
									쿠폰]이 표기된 쿠폰</span>만 사용 가능합니다. 자사 상품과 함께 주문 시 자사 상품 전용 쿠폰 사용은 가능하나 [입점
								판매 상품]은 자동으로 할인에서 제외됩니다. (일부 쿠폰 제외)
							</li>
							<li>할인적용 제외 자사 전용 쿠폰 예시
								<ul class="txt-list2">
									<li>기간한정, 신데렐라 쿠폰, 룰렛 당첨 쿠폰, 무료배송/교환/반품 쿠폰 등 H패션몰 자사브랜드 전용
										쿠폰</li>
								</ul>
							</li>
						</ul>
						<p class="contact-cs">
							입점 판매 상품 관련 궁금하신 내용은 1:1문의 또는 고객센터(1800-5700)로 문의해<br> 주시기
							바랍니다.
						</p>
						<!-- //2020.07.29 수정 -->
					</div>
				</div>
				<button type="button" class="btn-layer-close"
					onclick="layer.close('layerSaleInfo');">닫기</button>
			</div>
		</div>
		<!-- //입점 판매 상품 안내 -->

		<div id="layerMemBenefit" class="layer-pop" tabindex="0">
			<div class="layer-wrap" tabindex="0">
				<div class="layer-header">
					<h2 class="layer-title">H패션몰 회원 혜택</h2>
				</div>
				<div class="layer-container">
					<div class="layer-content">
						<p class="txt-common">
							지금 H패션몰 회원가입하고,<br>더욱 다양한 혜택을 받아보세요 !!
						</p>

						<div class="join-benefit">
							<ul class="join-benefit-list">
								<li>
									<div class="benefit-img">
										<img src="/resources/images/order/img_mem_benefit_01.png"
											alt="">
									</div>
									<div class="benefit-txt">
										<p class="txt">
											신규 가입 시 10~15%<br> 할인쿠폰 즉시 지급
										</p>
									</div>
								</li>
								<li>
									<div class="benefit-img">
										<img src="/resources/images/order/img_mem_benefit_02.png"
											alt="">
									</div>
									<div class="benefit-txt">
										<p class="txt">생일 및 기념일 축하 전 브랜드 20% 할인쿠폰 지급</p>
									</div>
								</li>
								<li>
									<div class="benefit-img">
										<img src="/resources/images/order/img_mem_benefit_03.png"
											alt="">
									</div>
									<div class="benefit-txt">
										<p class="txt">
											APP 첫 로그인 시<br>20% 할인쿠폰 지급
										</p>
									</div>
								</li>
								<li>
									<div class="benefit-img">
										<img src="/resources/images/order/img_mem_benefit_04.png"
											alt="">
									</div>
									<div class="benefit-txt">
										<p class="txt">
											APP 첫 구매 시 H.Plus<br> 5000 포인트 지급
										</p>
									</div>
								</li>
								<li>
									<div class="benefit-img">
										<img src="/resources/images/order/img_mem_benefit_05.png"
											alt="">
									</div>
									<div class="benefit-txt">
										<p class="txt">
											App Push 수신 동의 시<br> 5,000원 할인쿠폰 지급
										</p>
									</div>
								</li>
							</ul>

							<div class="txt-join-box">
								<p class="txt-join">지금 회원으로 가입하시겠습니까?</p>
								<a href="javascript:void(0);" class="btn-text"
									onclick="orderNow('');">비회원 구매하기</a>
							</div>

						</div>

						<div class="layer-bot-box">
							<div class="btn-box">
								<a href="/public/member/addMemberStep1" class="btn-type4-xlg">회원
									가입하기</a> <a href="/public/member/login" class="btn-type2-xlg">로그인
									하기</a>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn-layer-close"
					onclick="layer.close('layerMemBenefit');">닫기</button>
			</div>
		</div>
		<script type="text/javascript"
			src="/hfm_pc/resources/js/cart.js?timestamp=20221116145741"></script>
	</section>
</div>
<%@ include file="../layout/footer.jsp"%>