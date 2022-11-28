<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/layout/header.jsp" %>
<div id="container">
	<section class="content-wrap">

		<div class="snb-wrap">
			<h2 class="lnb-title">
				<a href="${contextPath}/Hfashion?command=mypage">MYPAGE</a>
			</h2>
			<nav id="lnb" class="lnb">
				<ul>
					<li>
						<div class="menu-depth1">쇼핑정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/Hfashion?command=mypage_searchOrder">주문</a></li>
							<li><a href="${contextPath}/user/mypage/listClaimOrder.jsp">주문취소</a></li>

						</ul>
					</li>
					<li>
						<div class="menu-depth1">회원정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/user/mypage/pwdConfirm.jsp">회원정보 수정</a></li>
							<li><a href="${contextPath}/user/mypage/memberSecession.jsp">회원 탈퇴</a></li>
						</ul>
					</li>

				</ul>
			</nav>
		</div>
		<div class="snb-content-wrap">
			<h3 class="page-title">주문 취소</h3>
			<div class="page-info">
				<p class="txt-type3">취소 신청내역 및 진행상태를 확인하실 수 있습니다.</p>
			</div>
			<div id="claimTab" class="tab-wrap2 ui-tab initialized">
				<div class="tab-cont on">
					<!-- period-search-group -->
					<div class="period-search-group">
						<dl class="period-btns-box">
							<dt>기간</dt>
							<dd>
								<div class="period-btns">
									<label> <input type="radio" name="period" checked=""
										onclick="setDay('-15', 'D');"> <span>15일</span>
									</label> <label> <input type="radio" name="period"
										onclick="setMonth('oMouth', 'D');"> <span>1개월</span>
									</label> <label> <input type="radio" name="period"
										onclick="setMonth('tMouth', 'D');"> <span>3개월</span>
									</label> <label> <input type="radio" name="period"
										onclick="setMonth('sMouth', 'D');"> <span>6개월</span>
									</label> <label> <input type="radio" name="period"
										onclick="setMonth('yMouth', 'D');"> <span>12개월</span>
									</label>
								</div>
							</dd>
						</dl>
						<div class="period-calendar">
							<div class="period-input">
								<input type="text" name="dateStartD" id="dateStartD"
									class="inp-datepicker datepicker hasDatepicker" title="시작일"
									value="" readonly="">
								<button type="button" class="ui-datepicker-trigger">
									<img src="${contextPath}/images/btn_calendar.png" alt="날짜 선택"
										title="날짜 선택">
								</button>
							</div>
							<div class="period-input">
								<input type="text" name="dateEndD" id="dateEndD"
									class="inp-datepicker datepicker hasDatepicker" title="종료일"
									value="" readonly="">
								<button type="button" class="ui-datepicker-trigger">
									<img src="${contextPath}/images/btn_calendar.png" alt="날짜 선택"
										title="날짜 선택">
								</button>
							</div>
							<button type="button" class="btn-type4-sm btn-period"
								onclick="goSearch('', '');">
								<span>조회</span>
							</button>
						</div>
					</div>
					<script>
						$('.datepicker').datepicker({
							showOn : 'button',
							buttonImage : '${contextPath}/images/btn_calendar.png',
							buttonImageOnly : false,
							buttonText : '날짜 선택',
						});
					</script>
					<!-- //period-search-group -->
					<div class="order-list-wrap" id="includeCancelOrderList">
						<input type="hidden" id="viewType" name="viewType" value="">
						<input type="hidden" id="page" name="page" value="1"> <input
							type="hidden" id="pageSize" name="pageSize" value="10"> <input
							type="hidden" id="total_page" name="total_page" value="">
						<input type="hidden" id="totalCount" name="totalCount" value="">
						<input type="hidden" id="srchType" name="srchType" value="D">

						<!-- order-tbl -->

						<div class="order-tbl claim-history">
							<!-- head -->
							<div class="head">
								<div class="cell-order-num">신청일/주문번호</div>
								<div class="cell-info">상품정보</div>
								<div class="cell-price">결제금액</div>
								<div class="cell-status">진행상태</div>
							</div>
							<!-- //head -->
							<!-- body -->
							<div class="body">

								<!-- 취소 -->
								<div class="nodata">
									<p class="txt-nodata">취소 내역이 없습니다.</p>
								</div>
								<!--  취소끝 -->

								<!--  교환시작 -->
								<!-- 교환끝 -->


								<!-- 반품 -->
								<!--  반품끝 -->

							</div>
							<!-- body -->
						</div>
						<!-- order-tbl -->
						<div id="getGoodsReviewPopup"></div>
						<div id="layerTracking" class="layer-pop" tabindex="0"></div>
						<form name="claimForm" id="claimForm" method="post"></form>
					</div>
					<dl class="txt-group">
						<dt>취소 안내</dt>
						<dd>
							<ul class="txt-list">
								<li>주문 시 무료배송으로 받았다 할지라도 주문취소 또는 반품 시 최초 배송비가 부과될 수 있습니다.</li>
								<li>환불 시 최초 배송비를 제외한 상품에 대한 금액만 환불이 되므로 실제 환불 금액과 일부 상이할 수
									있습니다.<br> 또한 쿠폰이나 포인트 사용으로 인해 금액의 차이가 발생 할 수 있으니 확인 바랍니다.
								</li>
								<li>결제수단별 환불방법과 환불소요기간에 차이가 있습니다.</li>
								<li>부분취소 또는 부분반품 시 포인트는 결제금액 비율로 일부가 복원되거나 유효기간에 따라 소멸될 수
									있습니다.</li>
							</ul>
						</dd>
					</dl>

				</div>
			</div>
			<div id="__dialogReview__"></div>
		</div>
		<!-- //snb-content-wrap -->
	</section>
</div>
<%@include file="/layout/footer.jsp" %>