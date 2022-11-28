<div class="row">
													<div class="inner">
														<div class="cell-pd-wrap">
															<!-- 상품1개씩 -->
															<div class="inner-row">
																<div class="info-row">
																	<div class="cell-pd">
																		<div class="item-img" godno="GM0122062466107">
																			<a href="Hfashion?command=detail&pno=${item.pro_no}"> <img src="${contextPath}/${item.img_url}">
																			</a>
																		</div>
																		<div class="item-info">
																			<div class="item-brand">
																				<a href="Hfashion?command=detail&pno=${item.pro_no}">${item.brand_name} </a>
																			</div>
																			<div class="item-name clear-ellipsis">
																				<a href="Hfashion?command=detail&pno=${item.pro_no}">${item.pro_name}</a>
																			</div>
																			<div class="item-opt">
																				<a href="Hfashion?command=detail&pno=${item.pro_no}"> <span>${item.product_option}</span> <span>수량 : ${item.order_amount} </a>
																			</div>
																			<div class="item-btn"></div>


																		</div>
																	</div>
																	<div class="cell-price">
																		<div class="cell-inner">
																			<div class="price">
																				<span><span class="num"><fmt:formatNumber value="${item.pro_price}" pattern="#,###" /></span> 원</span>
																			</div>
																		</div>
																	</div>
																	<div class="cell-status">
																		<div class="cell-inner">
																			<div class="status">
																				주문날짜<br> <span class="txt-cmt pcolor">${item.order_date}</span>
																			</div>
																		</div>
																	</div>
																	<div class="cell-btn">
																		<div class="cell-inner">
																			<div class="cell-inner">
																				<div class="btns">
																					<button type="button" class="btn-type3-sm" onclick="jsUnitCancel('OD202211267120945', 'Y', 'N');">
																						<span>주문취소</span>
																					</button>
																				</div>
																				<div>

																					<form action="${contextPath}/Hfashion?command=reviewwriteform" method="get">
																						<input type="hidden" id="proname" value="${item.pro_name}"> <input type="hidden" id="r_check" value="${item.review_check}"> <input type="submit"
																							class="btn-type3-sm" value="리뷰작성">
																					</form>
																					<button type="button" class="btn-type3-sm" onclick="jsUnitCancel('OD202211267120945', 'Y', 'N');">
																						<span>후기작성</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- //inner-row 상품1개씩-->

															<!--  orderList -->

														</div>
													</div>
												</div>