<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@include file="/layout/header.jsp" %>
<div id="container">
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
		<div class="snb-content-wrap">
			<h3 class="sec-title">
				최근 주문상품 <span class="sub2">(최근 1개월 기준)</span>
			</h3>

			<div class="order-list-wrap order-slide-section">
				<!-- 2020.09.15 주문내역이 없을 경우 -->
				<div class="nodata">
					<p class="txt-nodata">최근 주문 상품이 없습니다.</p>
				</div>
				<!-- //2020.09.15 주문내역이 없을 경우 -->

				<div class="order-links">
					<ul>
						<li><a href="/secured/mypage/listOrder">주문 조회</a></li>
						<li><a href="/secured/mypage/listClaimOrder">주문 취소 <span
								class="num">0</span>건
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
</div>