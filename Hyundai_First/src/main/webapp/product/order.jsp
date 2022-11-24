<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">
	<form action="approve" name="orderDTO" id="orderDTO" method="post">
		<section class="content-wrap">
			<h2 class="page-title">주문서</h2>
			<section>
				<div class="sec-title-box">
					<h3 class="sec-title">주문상품</h3>
				</div>
				<div class="order-tbl type-order">
					<div class="body">
						<div class="row">
							<!-- 패키지 명 -->
							<!-- //패키지 명 -->
							<div class="inner">
								<div class="cell-pd">
									<div class="item-img">
										<img src="https://cdn.hfashionmall.com/goods/HFBR/22/08/08/GM0122080877145_0_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" alt=""
											onerror="javascript:this.src='/hfm_pc/resources/images/temp/pd_86x129.jpg'">
									</div>
									<div class="item-info">
										<div class="item-brand">DECKE</div>
										<div class="item-name">튜브 바게트</div>
										<div class="item-opt">
											<span> BLACK, FR </span>
										</div>
									</div>
								</div>
								<div class="cell-qt">1</div>
								<div class="cell-price">
									<div class="price">
										<span><span class="num">227,500</span> 원</span>
									</div>
								</div>
							</div>
						</div>
						<!-- 배송정보 -->
						<div class="cell-dlv">
							<div class="inner">
								<p>
									<span class="sort"> [본사배송]</span> <span class="price" id="deliverySubgrp0-554">무료배송</span> <span class="sub"> 3만원 미만 결제시 <br> 2,500원
									</span>
								</p>
							</div>
						</div>
						<!-- //배송정보 -->
					</div>
				</div>
			</section>
			<section>
				<div class="order-cont">
					<!-- 결제 정보 입력 -->
					<div class="payment-input">
						<h3 class="sec-title">배송지 정보</h3>
						<div class="tab-wrap2 ui-tab initialized" id="dlvspTabs">
							<div class="tab-cont on">
								<div class="btn-box align-right">
									<button type="button" class="btn-type1-m mem_same" data-type="new">주문자와 동일</button>
								</div>
								<div class="bg-box orderer-info">
									<span class="tit">주문자 정보 </span> <span class="txt">신수진 / 01021389017 / wls3147@naver.com</span>
								</div>
								<div class="tbl-write no-line">
									<table>
										<caption>배송지 정보 입력</caption>
										<colgroup>
											<col style="width: 160px">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><span>수신자명 <span class="required">(필수)</span></span></th>
												<td>
													<div class="input-box">
														<input type="text" title="수신자명" placeholder="" class="inp-reset" id="newAddrseNm" name="addrseNm" value="" new-validate="required;xssquotation">
														<div class="etc">
															<button type="button" class="btn-clear">
																<span>지우기</span>
															</button>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span>휴대폰번호 <span class="required">(필수)</span></span></th>
												<td>
													<div class="input-box">
														<input type="hidden" class="inputbox-num" title="" id="newAddrseMobilNationNo" value="82"> <input type="text" title="휴대폰번호" placeholder="" class="inp-reset inputbox-num"
															id="newAddrseMobilNo" name="addrseMobilNo" value="" new-validate="required;digit;rangelength:10 11;digit;phone;" maxlength="11">
														<div class="etc">
															<button type="button" class="btn-clear">
																<span>지우기</span>
															</button>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span>전화번호</span></th>
												<td>
													<div class="input-box">
														<input type="hidden" class="inputbox-num" title="" id="newAddrseTelNationNo" value="82"> <input type="text" title="전화번호" placeholder="" class="inp-reset inputbox-num"
															id="newAddrseTelNo" name="addrseTelNo" value="" new-validate="digit;rangelength:9 11;tel;" maxlength="11">
														<div class="etc">
															<button type="button" class="btn-clear">
																<span>지우기</span>
															</button>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span>배송지 주소 <span class="required">(필수)</span></span></th>
												<td>
													<div class="form-group" style="width: 350px;">
														<div class="input-box">
															<input type="text" title="우편번호" placeholder="" class="inp-reset inputbox-num" id="newAddrsePostNo" value="" new-validate="required;postno" maxlength="7" readonly="">
														</div>
														<button type="button" class="btn-type1-m searchPostNo" data-type="new">
															<span>우편번호</span>
														</button>
													</div>
													<div class="input-box">
														<input type="text" title="주소" placeholder="" class="inp-reset" id="newAddrseBaseAddr" value="" new-validate="required;xssquotation" maxlength="100" readonly="">
													</div>
													<div class="input-box">
														<input type="text" title="상세주소" placeholder="" class="inp-reset" id="newAddrseDetailAddr" name="addrseDetailAddr" value="" new-validate="required;xssquotation" maxlength="100">
														<div class="etc">
															<button type="button" class="btn-clear">
																<span>지우기</span>
															</button>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span>배송 요청사항</span></th>
												<td>
													<div class="input-box">
														<div class="select">
															<button type="button" class="sel-btn" onclick="select.trigger();">배송기사에게 전달되는 메시지입니다. 선택해주세요.</button>
															<div class="sel-list">
																<ul>
																	<li><label><input type="radio" name="newDlvMemo" value="" onchange="toggleShow();" checked=""> <span>배송기사에게 전달되는 메시지입니다. 선택해주세요.</span></label></li>
																	<li><label><input type="radio" name="newDlvMemo" value="부재시, 전화주시거나 또는 문자 주세요." onchange="toggleShow();"> <span>부재시, 전화주시거나 또는 문자 주세요.</span></label></li>
																	<li><label><input type="radio" name="newDlvMemo" value="부재시, 경비실에 맡겨주세요." onchange="toggleShow();"> <span>부재시, 경비실에 맡겨주세요.</span></label></li>
																	<li><label><input type="radio" name="newDlvMemo" value="부재시, 문앞에 놓아주세요." onchange="toggleShow();"> <span>부재시, 문앞에 놓아주세요.</span></label></li>
																	<li><label><input type="radio" name="newDlvMemo" value="selfInput" onchange="toggleShow();"> <span>직접입력</span></label></li>
																</ul>
															</div>
														</div>
													</div>
													<div class="input-box selfInput" style="display: none;">
														<input type="text" title="요청사항 직접입력" placeholder="" class="inp-reset dlvMemoInput" id="newDlvMemoInput" maxlength="100">
														<div class="etc">
															<button type="button" class="btn-clear">
																<span>지우기</span>
															</button>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<dl class="txt-group mt36">
							<dt>한섬 멤버십 통합 안내</dt>
							<dd>
								<ul class="txt-list">
									<li>한섬 멤버십은 한섬 브랜드 온라인/오프라인 멤버십입니다.</li>
									<li>한섬 브랜드 구매 금액이 일정 수준 이상이면, 다음해 우수 고객 혜택을 드립니다.</li>
									<li>통합시, H패션몰 혜택은 그대로 유지되며, H패션몰에서 한섬마일리지를 사용하실 수 있습니다.</li>
								</ul>
							</dd>
						</dl>
					</div>
					<!-- //결제 정보 입력 -->

					<!-- 최종 결제 정보 -->
					<div class="total-payment">
						<div class="inner">
							<ul class="payment-info">
								<li class="total"><span class="tit">최종결제금액</span> <span class="num"><span class="paySum">163,800</span> 원</span></li>
								<li><span class="tit">상품금액</span> <span class="num"><span>227,500</span> 원</span></li>
								<li><span class="tit">배송비 <!-- 2020.08.14 -->
										<button type="button" class="btn-tooltip" onmouseenter="tooltip('dlvCost-info', null, '/tooltip?type=costInfo');">
											<span>툴팁보기</span>
										</button> <!-- 2020.08.14 -->
								</span> <span class="num"><span id="deliverySum">0</span> 원</span></li>
							</ul>
							<div class="payment-agree">
								<p>
									<label class="check-skin"> <input type="checkbox" id="btnAgreePurchase"> <span><span style="font-size: 14px">주문하실상품,가격,배송정보,할인정보등을 확인하였으며,구매에동의하십니까?<br>(전자상거래법제8조제2항)
										</span></span>
									</label>
								</p>
							</div>
							<div class="btn-box">
								<a href="${contextPath}/product/orderComplete.jsp" id="btnPayment" class="btn-type2-lg">결제하기</a>
							</div>
						</div>
					</div>

				</div>
			</section>
		</section>
	</form>
</div>
<%@ include file="../layout/footer.jsp"%>