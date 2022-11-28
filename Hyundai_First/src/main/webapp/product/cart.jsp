<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script type="text/javascript" src="${contextPath}/js/product/cart.js"></script>

<div id="container">
	<section class="content-wrap">
		<h3 class="page-title">장바구니</h3>

		<div id="cartContentList">
			<div class="tab-wrap">
				<ul class="tabs tab-btn">
					<li class="on">
						<button type="button" onclick="javascript:view('GNRL_DLV');event.stopImmediatePropagation();">
							<span class="gnrlCartCnt">택배(0)</span>
						</button>
					</li>
				</ul>
			</div>

			<div id="cartList" class="order-tbl type-cart">


				<div class="head">
					<div class="cell-check">
						<label class="check-skin only"> <input type="checkbox" class="allChk"> <span>전체 선택</span>
						</label>
					</div>
					<div class="cell-info">상품정보</div>
					<div class="cell-price">상품금액</div>
					<div class="cell-btn">선택</div>
					<div class="cell-dlv">배송정보</div>
				</div>

				<!-- 				
				<div class="body">
					<div class="nodata">
						<p class="txt-nodata">장바구니에 담긴 상품이 없습니다.</p>
					</div>
				</div>
 -->
				<!-- body -->

				<div class="body">

					<!-- row -->
					<c:forEach var="cVO" items="${cList}">
						<div class="row " id="0" name="tr0_0" gdturn="3" gdidx="0">
							<div class="inner">
								<div class="cell-check">
									<label class="check-skin only"> <input type="checkbox" soldoutyn="N" id="0_0" name="check" value="0" onclick="javascript:check.one(0,0,$(this));event.stopImmediatePropagation();">
										<span>선택</span>
									</label>
								</div>

								<div class="cell-pd-wrap">
									<!-- 상품 별 정보/가격 -->
									<div class="inner-row">
										<div class="cell-pd">
											<div class="item-img">
												<a href="${contextPath}/Hfashion/command=detail?pno=${cVO.pro_no}"> <img src='<c:url value='${cVO.img_loc}'></c:url>'>
												</a>
											</div>
											<div class="item-info">
												<div class="item-label"></div>
												<div class="item-brand">${cVO.brand_name}</div>
												<div class="item-name">
													<a href="${contextPath}/Hfashion/command=detail?pno=${cVO.pro_no}">${cVO.pro_name}</a>
												</div>
												<div class="item-opt">
													<span color="BLACK">${cVO.size_name}</span>
													<div class="row">
														<span class="item-count">
															<button type="button" class="btn-minus" onclick="quantityCalc('minus');">
																<span>빼기</span>
															</button> <input type="number" name="itmQty" maxordqty="9999" class="input-num" value="${cVO.cart_amount }">
															<button type="button" class="btn-plus" onclick="quantityCalc('plus');">
																<span>더하기</span>
															</button>
														</span>
													</div>
												</div>


											</div>
										</div>
										<div class="cell-price">
											<input type="hidden" id="benefit0_0" prctype="GNRL" amt="97500" crsgrp="" godamt="0" imdtldcamt="97500" cpnamt="0" cpnbamt="0"> <input type="hidden" id="price0_0" price="325000">
											<div class="price" emplmtddctyn="N">
												<span> <span class="num" id="orderPrice0_0" cvrprc="325000" saleprc="227500" calcorderprice="227500"><fmt:formatNumber value="${cVO.pro_price}" pattern="#,###" /></span> 원
												</span>
											</div>
										</div>
									</div>
									<!-- //상품 별 정보/가격 -->
								</div>
								<div class="cell-btn">
									<!-- 품절은 아니나 매장픽업수령일자가 초과된 경우는 비활성화 처리함. -->
									<button type="button" class="btn-type4-sm" onclick="javascript:selectGoodsOrder(0,0);">
										<span>바로구매</span>
									</button>
									<button type="button" class="btn-del" id="btn-del" onclick="goodsDel('${cVO.pro_no}', '${cVO.size_name}');">
										<span>삭제</span>
									</button>
								</div>
							</div>
						</div>
					</c:forEach>

					<!-- 배송정보 -->
					<div class="cell-dlv">
						<div class="inner">


							<span style="display: none" id="dlv554" dlvamt="0" dlvchecked="Y" startindex="0" endindex="0"></span>
							<p>
								<span class="sort">[본사배송]</span> <span id="godDlvAmt_0_0" class="txt" dmstcdlvcstplcsn="554" dlvcstlevysectcd="COND_FREE" dmstcdlvcstexmstdramt="30000" dmstcdlvcst="2500" grpindex="0"
									grpsoldoutyn="N">무료배송</span> <span class="sub">30,000원 미만 결제시 <br> 2,500원
								</span>
							</p>
						</div>
					</div>
					<!-- //배송정보 -->

				</div>

				<!-- //body -->
			</div>

			<div class="tbl-btn">
				<button type="button" class="btn-type3-m" onclick="">
					<span>선택삭제</span>
				</button>
				<button type="button" class="btn-type3-m" onclick="">
					<span>전체삭제</span>
				</button>
			</div>

			<!-- 최종금액 -->
			<div class="cart-price" mbratrbcd="">
				<div class="inner">
					<span class="price"> <span class="txt">상품금액</span> <span id="totalGodAmt" class="num">0</span> 원
					</span> <span class="symbol-plus">+</span> <span class="price"> <span class="txt">배송비
							<button type="button" class="btn-tooltip" onmouseenter="tooltip('dlvCost-info', null, '/tooltip?type=costInfo');">
								<span>툴팁보기</span>
							</button>
					</span> <span id="totalDlvAmt" class="num">0</span> 원
					</span> <span class="symbol-eq">=</span> <span class="price total"> <span class="txt">결제금액</span> <span id="totalOrdAmt" class="num">0</span> 원
					</span>
				</div>
			</div>

			<div class="btn-box">
				<a href="/" class="btn-type4-lg">쇼핑 계속하기</a> <a
					href="${contextPath}/Hfashion?command=order" class="btn-type2-lg">선택상품 주문하기</a>

			</div>
			
			<ul class="txt-list">
				<li>장바구니에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품은 자동 삭제됩니다.</li>
				<li>장바구니에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>
				<!-- 200703 text -->
				<li>장바구니에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
				<li>입점 판매 상품은 장바구니에서 [입점 판매 상품]으로 표시됩니다.
					<button type="button" class="point-link" onclick="layer.open('layerSaleInfo')">입점 판매 상품 안내 보기</button>
				</li>
			</ul>
		</div>
	</section>
</div>

<%@ include file="../layout/footer.jsp"%>