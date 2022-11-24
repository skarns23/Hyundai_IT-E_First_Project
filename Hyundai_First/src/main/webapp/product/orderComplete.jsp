<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">
	<section class="content-wrap">
		<h2 class="page-title">주문완료</h2>

		<div class="order-header">
			<p class="txt">주문이 정상적으로 완료되었습니다. (주문번호 : OD202211236994026)</p>
		</div>

		<section>
			<h3 class="sec-title">주문상품</h3>

			<div class="order-tbl type-order-com">
				<!-- head -->
				<div class="head">
					<div class="cell-info">상품정보</div>
					<div class="cell-qt">수량</div>
					<div class="cell-price">상품금액</div>
				</div>
				<!-- //head -->
				<!-- body -->
				<div class="body">
					<!-- row -->
					<div class="row">
						<!-- 패키지 명 -->
						<!-- //패키지 명 -->
						<div class="inner">
							<div class="cell-pd">
								<div class="item-img">
									<img src="https://cdn.hfashionmall.com/goods/THBR/22/07/14/GM0122071471347_4_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" alt=""
										onerror="javascript:this.src='/hfm_pc/resources/images/temp/pd_86x129.jpg'">
								</div>
								<div class="item-info">
									<div class="item-brand">TOMMY HILFIGER WOMEN</div>
									<div class="item-name">리브드 쿼터 삭스</div>
									<div class="item-opt">
										<span> WHITE,&nbsp;F</span>
									</div>
								</div>
							</div>
							<div class="cell-qt">1</div>
							<div class="cell-price">
								<div class="price">
									<span><span class="num">10,000</span> 원</span>
								</div>
							</div>
						</div>
					</div>
					<!-- //row -->
				</div>
				<!-- //body -->

			</div>
		</section>
		<section>
			<h3 class="sec-title">배송지 정보</h3>
			<div class="delivery-info">
				<table>
					<caption>배송지 정보</caption>
					<colgroup>
						<col style="width: 190px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">수신자명</th>
							<td>신수진</td>
						</tr>
						<tr>
							<th scope="row">휴대폰번호</th>
							<td>01021389017</td>
						</tr>
						<tr>
							<th scope="row">배송지 주소</th>
							<td>주소 주소 주소</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

		<div class="btn-box">
			<a href="javascript:location.href='${contextPath}/main.jsp'" class="btn-type4-lg">쇼핑 계속하기</a> <a href="javascript:undefined;" id="btnOrderList" class="btn-type2-lg">주문내역조회</a>
		</div>
	</section>
</div>


<%@ include file="../layout/footer.jsp"%>