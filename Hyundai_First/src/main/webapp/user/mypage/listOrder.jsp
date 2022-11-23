<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/layout/header.jsp" %>
<div id="container">
	<div class="breadcrumb-wrap"></div>
	<section class="content-wrap">
		<input type="hidden" name="hPointEnableYn" id="hPointEnableYn"
			value="">
		<!-- snb -->
		<div class="snb-wrap">
			<h2 class="lnb-title">
				<a href="${contextPath}/user/mypage/mypage.jsp">MYPAGE</a>
			</h2>
			<nav id="lnb" class="lnb">
				<ul>
					<li>
						<div class="menu-depth1">쇼핑정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/user/mypage/listOrder.jsp">주문</a></li>
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
		<!-- //snb -->
		<!-- snb-content-wrap -->
		<div class="snb-content-wrap">
			<script type="text/javascript" src="/resources/js/moment.js"></script>
			<script type="text/javascript"
				src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20221123154834"></script>
			<!-- 마우스 우클릭 방지 예외-->
			<h3 class="page-title">주문</h3>
			<div class="page-info">
				<p class="txt-type3">주문내역 및 배송상태를 조회하실 수 있으며, 취소/교환/반품 신청이
					가능합니다.</p>
			</div>
			<!-- period-search-group -->
			<div class="period-search-group">
				<dl class="period-btns-box">
					<dt>기간</dt>
					<dd>
						<div class="period-btns">
							<label> <input type="radio" name="period"
								onclick="setDay('-15');" checked=""> <span>15일</span>
							</label> <label> <input type="radio" name="period"
								onclick="setMonth('oMouth');"> <span>1개월</span>
							</label> <label> <input type="radio" name="period"
								onclick="setMonth('tMouth');"> <span>3개월</span>
							</label> <label> <input type="radio" name="period"
								onclick="setMonth('sMouth');"> <span>6개월</span>
							</label> <label> <input type="radio" name="period"
								onclick="setMonth('yMouth');"> <span>12개월</span>
							</label>
						</div>
					</dd>
				</dl>

				<div class="period-calendar">
					<div class="period-input">
						<input type="text" name="dateStart" id="dateStart"
							class="inp-datepicker datepicker hasDatepicker" title="시작일"
							value="2020-04-02" readonly="">
						<button type="button" class="ui-datepicker-trigger">
							<img src="${contextPath}/images/btn_calendar.png" alt="날짜 선택"
								title="날짜 선택">
						</button>
					</div>
					<div class="period-input">
						<input type="text" name="dateEnd" id="dateEnd"
							class="inp-datepicker datepicker hasDatepicker" title="종료일"
							value="2020-04-17" readonly="">
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
					buttonImage : '/resources/images/btn_calendar.png',
					buttonImageOnly : false,
					buttonText : '날짜 선택',
				});
			</script>
			<div id="includeOrderList" class="order-list-wrap">
				<!-- 다이나믹 컨피그 설정 HFM_EQL_CONN_YN ERP 연동 유무 -->
				<script type="text/javascript"
					src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20221123154834"></script>
				<input type="hidden" id="viewType" name="viewType" value="">
				<input type="hidden" id="page" name="page" value="1"> <input
					type="hidden" id="pageSize" name="pageSize" value="10"> <input
					type="hidden" id="total_page" name="total_page" value=""> <input
					type="hidden" id="totalCount" name="totalCount" value=""> <input
					type="hidden" id="statCd" name="statCd" value=""> <input
					type="hidden" id="srchFlag" name="srchFlag" value="ORD">
				<!-- includeOrderList -->

				<!-- 내역 없을 경우 -->
				<div class="nodata">
					<p class="txt-nodata">주문/배송 내역이 없습니다.</p>
				</div>

		</div>
		<!-- //snb-content-wrap -->
	</section>
</div>
<%@include file="/layout/footer.jsp" %>