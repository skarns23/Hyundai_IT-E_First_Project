<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div id="container">
	<section class="content-response">
		<h2 class="dp-title tit-tab-wrap eng" id="bestTitle">
			<span class="tit-tab pl113 on" id="brand"> <a href="#">ALL</a>
			</span> <span class="tit-tab" id="category"> <a href="#">WOMAN</a>
			</span> <span class="tit-tab" id="category"> <a href="#">MAN</a>
			</span>
		</h2>
		<div class="wrap-product-list">
			<ul class="product-list" id="productsList">
				<c:forEach var="proList" items="${productList}">
				<li godno="GM0122111816388">
					<!-- 대형 이미지 클래스 product-sp-->
					<figure class="item-box" data-ga-id="GM0122111816388" data-ga-name="플라워 스마일 니트 베스트" data-ga-brand="SJYP" data-ga-price="179100">
						<div class="item-img">
							<div class="img-box">
								<a href="${contextPath}/Hfashion?command=detail">	
										<img src='<c:url value='${ proList.img_loc}'></c:url>'>
								</a>
							</div>
						</div>
						<figcaption class="item-info">
							<a href="javascript:void(0);" onclick="goGodDetail('GM0122111816388')">
								<div class="item-brand"><c:out value="${proList.brand_name}"></c:out></div>
								<div class="item-name"><c:out value="${proList.pro_name}"></c:out>  </div>
								<div class="item-price">
									<span class="price"> <c:out value="${proList.pro_price}"></c:out>  </span>
								</div>
								<div class="item-label">
									<span class="label3">신상</span> <span class="label2">할인</span> <span class="label3">쿠폰</span>
								</div>
							</a>
						</figcaption>
					</figure>
				</li>
				</c:forEach>
			</ul>
			</div>
	</section>
</div>


<%@ include file="../layout/footer.jsp"%>