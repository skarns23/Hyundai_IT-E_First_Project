<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">


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
					
					<c:forEach var="orderItems" items="${orderInfo.orderList}">
						<div class="row">
							<!-- 패키지 명 -->
							<!-- //패키지 명 -->
							<div class="inner">
								<div class="cell-pd">
									<div class="item-img">
										<img src='<c:url value="${orderItems.proImage}"></c:url>' alt="">
									</div>
									<div class="item-info">
										<div class="item-brand"><c:out value="${orderItems.brandName}"></c:out> </div>
										<div class="item-name"><c:out value="${orderItems.proName}"></c:out></div>
										<div class="item-opt">
											<span><c:out value="${orderItems.proSize}"></c:out></span>
										</div>
									</div>
								</div>
								<div class="cell-qt"><c:out value="${orderItems.cartAmount}"></c:out></div>
								<div class="cell-price">
									<div class="price">
										<span><span class="num"><fmt:formatNumber value="${orderItems.proPrice*orderItems.cartAmount}" pattern="#,###" /></span> 원</span>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						
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
								<div class="bg-box orderer-info">
									<span class="tit">주문자 정보 </span> <span class="txt"><c:out value="${orderInfo.userName} / ${orderInfo.userEmail} / ${orderInfo.userPhone}"></c:out> </span>
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
														<input type="text" title="수신자명" placeholder="" class="inp-reset" id="newAddrseNm" name="addrseNm" value="${orderInfo.userName}" new-validate="required; xssquotation">
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
															id="newAddrseMobilNo" name="addrseMobilNo" value="${orderInfo.userPhone}" new-validate="required;digit;rangelength:10 11;digit;phone;" maxlength="11">
														<div class="etc">
															<button type="button" class="btn-clear">
																<span>지우기</span>
															</button>
														</div>
													</div>
												</td>
											</tr>
											
											
											
											
											<!--@@@여기서 부터 코딩  -->
											<tr>
												<th scope="row"><span>배송지 주소 <span class="required">(필수)</span></span></th>
												<td>
													<div class="form-group" style="width: 350px;">
														<div class="input-box">
															<input type="text" id="sample6_postcode" placeholder="우편번호">
														</div>
														<input type="button" id="addr_button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"  ><br>	
													</div>
													<div class="input-box">
														<input type="text" id="sample6_address" placeholder="주소"><br>
													</div>
													<div class="input-box">
														<input type="text" id="sample6_detailAddress" placeholder="상세주소">
														<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
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
								<li class="total"><span class="tit">최종결제금액</span> <span class="num"><span class="paySum"><fmt:formatNumber value="${orderInfo.totalPrice}" pattern="#,###"></fmt:formatNumber>   </span> 원</span></li>
								<li><span class="tit">상품금액</span> <span class="num"><span><fmt:formatNumber value="${orderInfo.totalPrice}" pattern="#,###"></fmt:formatNumber></span> 원</span></li>
								<li><span class="tit">배송비 
										<button type="button" class="btn-tooltip" onmouseenter="tooltip('dlvCost-info', null, '/tooltip?type=costInfo');">
											<span>툴팁보기</span>
										</button> 
								</span> <span class="num"><span id="deliverySum"><fmt:formatNumber value="${orderInfo.deliveryFee}" pattern="#,###"></fmt:formatNumber></span> 원</span></li>
							</ul>
							
							<!--여기도 코딩  -->
							<div class="btn-box">
								<a id="btnPayment" class="btn-type2-lg" onclick="order()" >결제하기</a>
							</div>
						</div>
					</div>

				</div>
			</section>
		</section>
	</form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
 
<script>
	/*함세강*/
	/*동적으로 form 태그를 생성해서 데이터를 넘기는 과정*/
    function order() {
    	var tag_postcode= $('#sample6_postcode').val();
    	var tag_address= $('#sample6_address').val();
    	var tag_detailAddress= $('#sample6_detailAddress').val();
    	var total_address = tag_address+" "+tag_detailAddress;
    	console.log(tag_postcode);
    	console.log(tag_address);
    	console.log(tag_detailAddress);
    	console.log(total_address);
    	
    	if(tag_postcode==''){
    		alert("우편번호를 입력하세요!")
    		return;
    	}
    	
    	if(tag_address==''){
    		alert("주소를 입력하세요!")
    		return;
    	}
    	
    	if(tag_detailAddress==''){
    		alert("상세주소를 입력하세요!")
    		return;
    	}
    	
    	
    	
    	
    	
        var data_form = $('<form></form>');
 
        data_form.attr("name", "test_form");
        data_form.attr("method", "POST");
        data_form.attr("action", "${contextPath}/Hfashion?command=order") ;
 
        data_form.append($('<input/>', {type: 'hidden', name: 'postCode', value: tag_postcode}));
        data_form.append($('<input/>', {type: 'hidden', name: 'address', value: total_address}));
        
        
        
 		
        data_form.appendTo('body');
 
        data_form.submit();
    }
</script>



<!--출처 : 다음 api  -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


<%@ include file="../layout/footer.jsp"%>