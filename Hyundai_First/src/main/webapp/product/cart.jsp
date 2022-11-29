<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	cartListAll();
});
	// 장바구니 목록을 가져오는 함수
	function cartListAll(){

		$.ajax({
			type : 'get',
			url : 'Hfashion?command=cartListAll',
			success : function(result){
				 var obj = JSON.parse(result);
				 var totalPrice = 0;
				 var tag = "";
				 if(obj.length == 0){
					 tag = `
					 	<div class="nodata">
						<p class="txt-nodata">장바구니에 담긴 상품이 없습니다.</p>
						</div>
						`
				 }else{
					 for(var i=0; i<obj.length; i++){
						 if(obj[i].selected == 1){
							 totalPrice += obj[i].pro_price * obj[i].cart_amount;
						 }
						 
						 let price = obj[i].pro_price * obj[i].cart_amount;
						 price = price.toLocaleString('ko-KR');
						 
						 tag += `
							 <div class="row"><div class="inner"><div class="cell-check"><label class="check-skin only"> `
						 tag += `<input type="checkbox" class="chk"`
						 if(obj[i].selected == 1) {
							 tag += `checked`
						 }
						 tag += ` onclick="optSelUpdate('\${obj[i].pro_no}', '\${obj[i].size_name}');"><span>선택</span></label></div><div class="cell-pd-wrap"><div class="inner-row"><div class="cell-pd"><div class="item-img" style="top: 15px;">
							 <a href="${contextPath}/Hfashion?command=detail&pno=\${obj[i].pro_no}"> <img src='${contextPath}/\${obj[i].img_loc}'></a>
							 </div><div class="item-info"><div class="item-label"></div><div class="item-brand">\${obj[i].brand_name}</div>
							 <div class="item-name"><a href="${contextPath}/Hfashion?command=detail&pno=\${obj[i].pro_no}">\${obj[i].pro_name}</a></div><div class="item-opt">
							 <span>\${obj[i].size_name}</span><div class="row"><span class="item-count">
							 <button type="button" class="btn-minus" onclick="quantityCalc('minus'); cntUpdate(\${i},'\${obj[i].pro_no}', '\${obj[i].size_name}');"><span>빼기</span></button> 
							 <input type="number" id="itmQty\${i}" class="input-num" value="\${obj[i].cart_amount}" onkeyup="changeQty(this);">
							 <button type="button" class="btn-plus" onclick="quantityCalc('plus'); cntUpdate(\${i}, '\${obj[i].pro_no}', '\${obj[i].size_name}');"><span>더하기</span></button></span></div></div></div></div>
							 <div class="cell-price"><div class="price"><span> <span class="num">\${price}</span> 원</span></div></div></div></div>
							 <div class="cell-btn">
							 <button type="button" class="btn-del" id="btn-del" onclick="goodsDel('\${obj[i].pro_no}', '\${obj[i].size_name}');"><span>삭제</span></button></div></div></div>
							 <input type="hidden" id="pro-price" value="\${obj[i].pro_price}">
							 `
					 }
					 tag += `
					 		<div class="cell-dlv">
							<div class="inner">
							<p>
							<span class="sort">[본사배송]</span> 
							<span id="godDlvAmt_0_0" class="txt">무료배송</span> 
							<span class="sub">30,000원 미만 결제시 <br> 2,500원</span>
							</p>
							</div>
							</div>
							`
				 }
	
				 $(".body").html(tag);
				 $("#totalGodAmt").text(totalPrice.toLocaleString('ko-KR'));
				 
				 if(totalPrice == 0){
					 $("#totalDlvAmt").text("0");
				 }else if(totalPrice < 30000){
					 totalPrice += 2500;
					 $("#totalDlvAmt").text("2,500");
				 }else{
					 $("#totalDlvAmt").text("0");
				 }
				 $("#totalOrdAmt").text(totalPrice.toLocaleString('ko-KR'));
				 
				 
				 
			},
			error : function(e){
				console.log(e);
			}
			
		})
	}	
	
	// 장바구니 1개 목록 삭제
	function goodsDel(pro_no, size_name) {
		console.log("삭제한다!!");
		$.ajax({
			url : 'Hfashion?command=delCart',
			type : 'post',
			data : {
				pno : pro_no,
				size : size_name
			},
			success : function(r) {
				cartListAll();
				console.log(r);
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	// 장바구니 전체 삭제
	function delAllCart() {
		if (confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				url : 'Hfashion?command=delAllCart',
				type : 'post',
				success : function(r){
					cartListAll();
					console.log("전체 삭제 성공~");
					
				},
				error : function(e){
					console.log(e);
				}
			});
		}
	}
	
	// 장바구니 1개 목록 선택
	function optSelUpdate(pro_no, size_name){		
		$.ajax({
			url : 'Hfashion?command=cartSelUpdate',
			type : 'post',
			data : {
				pno : pro_no,
				size : size_name
			},
			success : function(result){
				cartListAll();
			},
			error : function(e){
				console.log(e);
			}	
		})
	}
	
	// 장바구니 수량 변경하기
	function cntUpdate(i, pro_no, size_name){
		var cnt = document.getElementById("itmQty"+i).value;
		
		$.ajax({
			url : 'Hfashion?command=cartCntUpdate',
			type : 'post',
			data : {
				cnt : cnt,
				pno : pro_no,
				size : size_name
			},
			success : function(result){
				cartListAll();
			},
			error : function(e){
				console.log(e);
			}
		});
	}	
	
	
</script>
<div id="container">
	<section class="content-wrap">
		<h3 class="page-title">장바구니</h3>

		<div id="cartContentList">
			<div id="cartList" class="order-tbl type-cart">
				<div class="head">
					<div class="cell-check"></div>
					<div class="cell-info">상품정보</div>
					<div class="cell-price">상품금액</div>
					<div class="cell-btn"></div>
					<div class="cell-dlv">배송정보</div>
				</div>

				<!-- body -->
				<div class="body">
					<!-- row -->

					<!-- 배송정보 -->
				</div>
				<!-- //body -->
			</div>

			<div class="tbl-btn">
				<button type="button" class="btn-type3-m" id="delAll" onclick="delAllCart();">
					<span>전체삭제</span>
				</button>
			</div>

			<!-- 최종금액 -->
			<div class="cart-price">
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
				<a href="${contextPath}/Hfashion" class="btn-type4-lg" id="test">쇼핑 계속하기</a> <a href="${contextPath}/Hfashion?command=order" class="btn-type2-lg">선택상품 주문하기</a>
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
			<div id="layerSaleInfo" class="layer-pop" tabindex="0" style="display: none;">
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
								<li>[입점 판매 상품]은 쿠폰 이름에 <span class="pcolor">[입점 상품 전용 쿠폰]이 표기된 쿠폰</span>만 사용 가능합니다. 자사 상품과 함께 주문 시 자사 상품 전용 쿠폰 사용은 가능하나 [입점 판매 상품]은 자동으로 할인에서 제외됩니다. (일부 쿠폰 제외)
								</li>
								<li>할인적용 제외 자사 전용 쿠폰 예시
									<ul class="txt-list2">
										<li>기간한정, 신데렐라 쿠폰, 룰렛 당첨 쿠폰, 무료배송/교환/반품 쿠폰 등 H패션몰 자사브랜드 전용 쿠폰</li>
									</ul>
								</li>
							</ul>
							<p class="contact-cs">
								입점 판매 상품 관련 궁금하신 내용은 1:1문의 또는 고객센터(1800-5700)로 문의해<br> 주시기 바랍니다.
							</p>
							<!-- //2020.07.29 수정 -->
						</div>
					</div>
					<button type="button" class="btn-layer-close" onclick="layer.close('layerSaleInfo');">닫기</button>
				</div>
			</div>
		</div>
	</section>
</div>

<%@ include file="../layout/footer.jsp"%>