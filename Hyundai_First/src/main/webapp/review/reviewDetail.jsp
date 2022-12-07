<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"%>
<!-- 윤태영 작성 -->
   <%
      /* detail에서 바로 주문해서 받아온 값  */
      String pro_name ="";
      pro_name = request.getParameter("proname");   
      String b_name ="";
      b_name = request.getParameter("b_name");  
      String img_loc="";
      img_loc=request.getParameter("img_loc"); 
      String r_img="";
      r_img=request.getParameter("r_img"); 
    

   %>
<link rel="stylesheet" type="text/css" href="../css/ui.min.css">
<div id="container">
	<div id="reviewDetail" class="layer-pop lg review-layer" tabindex="0"
		style="display: block;">
		<!-- 리뷰이미지 출력 -->
		<div class="layer-wrap" tabindex="0">
			<div class="layer-header">
				<h2 class="layer-title">REVIEW</h2>
			</div>
			<div class="layer-container review-detail">
				<section class="review-content">
					<div class="cont">
						<div id="reviewImg" class="img-wrap" data-slide-length="2">
							<div class="slide-container swiper-container-horizontal">
								<ul class="swiper-wrapper"
									style="transition-duration: 0ms; transform: translate3d(-800px, 0px, 0px);">
									<li
										class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
										data-swiper-slide-index="1" style="width: 400px; overflow: hidden"><img
										src='${contextPath}/\images/review/<%=r_img%>'    
										style="width:100%;height:100%"></li>
									<li
										class="swiper-slide swiper-slide-prev swiper-slide-duplicate-next"
										data-swiper-slide-index="0" style="width: 400px; overflow: hidden""><img
										src='${contextPath}/\images/review/<%=r_img%>' 
										style="width:100%;height:100%"></li>
									<li class="swiper-slide swiper-slide-active"
										data-swiper-slide-index="1" style="width: 400px;overflow: hidden""><img
										src='${contextPath}/\images/review/<%=r_img%>' 
										style="width:100%;height:100%"></li>
									<li
										class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev"
										data-swiper-slide-index="0" style="width: 400px; overflow: hidden""><img
										src='${contextPath}/\images/review/<%=r_img%>' 
										style="width:100%;height:100%"></li>
								</ul>
								<span class="swiper-notification" aria-live="assertive"
									aria-atomic="true"></span>
							</div>
							<div
								class="slide-pagination swiper-pagination-clickable swiper-pagination-bullets"></div>
						</div>
						<div class="cont-wrap">

							<h3 class="title">${Rvo.r_title}</h3>

							<div class="txt-wrap">
								<p class="txt">${Rvo.r_content}</p>
							</div>
							<div class="item-color" style="text-align: right; padding-right: 5px;">
											<button type="button" class="btn-like2" onclick="insert_like(96);">
												<span class="like-count">${Rvo.r_like}</span>
											</button>
										</div>
						</div>
						

					</div>
					<input type="hidden" name="img_loc" value="${img_loc}" >   

					<div class="column-wrap">
						<section class="review-item"
							onclick="goGodDetail('GM0122072975341');">
							<h3 class="sub-title">상품정보</h3>
							<figure>
								<div class="item-img">
									<img
										 src='${contextPath}<%=img_loc %>' 
										alt="스트레치 데님 셔츠"
										
										>
								</div>
								 
								<figcaption class="item-info">
									<div class="item-brand"><%=b_name%></div>
									<div class="item-name"><%=pro_name%></div>
									<div class="item-price">
										<span class="price">${Rvo.r_title}</span>

									</div>
								</figcaption>
							</figure>
						</section>
						<section>
							<h3 class="sub-title">고객 선택정보</h3>
							<table class="buy-info">
								<caption>구매 상품 사이즈, 구매옵션</caption>
								<tbody>
									<tr>
										<th scope="row">리뷰 고객님 키</th>
										<td><span>${Rvo.height}</span></td>
									</tr>
									<tr>
										<th scope="row">리뷰 고객님 몸무게</th>
										<td><span>${Rvo.weight}</span></td>
									</tr>
									<tr>
										<th scope="row">구매옵션</th>
										<td><span>${Rvo.size_name}</span> <span class="pdColor-"></span></td>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</section>

				<section class="product-detail-review">
					<div class="chart-wrap" id="chartSlide"></div>

					<script>
						pieChartSum();
						window.addEventListener('load', function() {
							slide.create('chartSlide');
						});
					</script>
				</section>

			</div>
		<button type="button" class="btn-layer-close" onclick="location.href='Hfashion?command=reviewlist'">닫기</button>
		</div>
	</div>
	<div id="reviewWrite" class="layer-pop lg review-layer" tabindex="0">
	  <button type="button" class="btn-type2-lg">
                        <input type="submit" value="등록" style= 'font-size:12pt'>
                        </button>
	</div>
</div>
