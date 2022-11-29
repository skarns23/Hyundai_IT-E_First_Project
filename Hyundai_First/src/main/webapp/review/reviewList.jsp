<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"%>

<link rel="stylesheet" type="text/css" href="../css/ui.min.css">

<div id="container">
	<div class="breadcrumb-wrap"></div>
	<!-- <script type="text/javascript" src="/js/sns.js"></script> -->

	<!-- <div class="breadcrumb-wrap">
      <ol class="breadcrumb">
         <li class="bc-home"><a href="javascript:;"><span>Home</span></a></li>
         <li class="active">리뷰플러스</li>
      </ol>
   </div> -->
	<section class="content-response ly_full">
		<h2 class="page-title type5">BEST REVIEW</h2>

		<div class="rp-list-wrap review-plus">
			<div class="rp-count-box">
				<div class="review-plus-list">
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					<c:forEach var="rvbestlist" items="${BestReviewList}">
						<!-- rvbestlist 변수 선언 -->
						<div class="review-plus-cont">
							<a href="javascript:undefined;"
								onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');">
								<figure class="item" data-ga-name="아이코닉 토트백">
									<div class="img">
										<span> <img
											src="https://cdn.hfashionmall.com/contents/review/3335083497366996.jpeg?RS=300"
											alt="" style="transform: rotate(0deg)">
									</div>
								</figure>
							</a>
							<div class="product-list-sub">
								<a href="javascript:undefined;"
									onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');">
								</a>
								<figure class="item-box">
										<span class="item-rank rank-top">BEST <span
											class="state">REVIEW</span></span>
											 <span class="item-img"> 
											<img src='<c:url value='${ rvbestlist.img_loc}'></c:url>'>									
									</span>								
									</a>
									<figcaption class="item-info">
										<a href="javascript:undefined;"
											onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');">
										</a><a href="javascript:void(0)"
											onclick="goGodDetail('GM0122093098215')">
											<form
												action="${contextPath}/Hfashion?command=reviewdetail&R_no=${rvbestlist.r_no}"
												method="post">
												<!-- 리뷰 디테일 jsp로 변수 전달 -->
												<input type="hidden" name="proname"
													value="${rvbestlist.pro_name}"> <input type="hidden"
													name="b_name" value="${rvbestlist.brand_name}"> <input
													type="hidden" name="img_loc" value="${rvbestlist.img_loc}">
												<input type="submit" value="리뷰 상세보기">
											</form>
											<div class="item-brand">${rvbestlist.brand_name}</div>
											<div class="item-name">${rvbestlist.pro_name}</div>
											<div class="item-price">
												<span class="price">${rvbestlist.pro_price}</span>
											</div>
										</a>
									</figcaption>
								</figure>
							</div>
							<figure class="item">
								<figcaption class="info">
									<div class="point-wrap">
										<div class="point">
											<span class="ico" style="width: 100%">별점</span>
										</div>
										<div class="item-color">
											<span class="color" style="font-size: 13px;">${rvbestlist.size_name}
											</span>
										</div>
									</div>
									<div class="item-comment">
										<span class="comment-txt"> ${rvbestlist.r_content}</span>
									</div>
								</figcaption>
							</figure>

						</div>
					</c:forEach>
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					
					<!-- 전시 > 메인 > 코너 > KEYWORD RANKING 상품 -->
					
					
					
				<!--      여기까지 -->
				</div>
			</div>
			<div class="dp-tab">
				<a href="javascript:void(0);" onclick="moveTabPage('','ALL');"
					id="tabKind_ALL" value="ALL" class="on"><span>ALL</span></a> <a
					href="javascript:void(0);" onclick="moveTabPage('TAB_MEN','MEN');"
					id="tabKind_MEN" value="MEN"><span>MEN</span></a> <a
					href="javascript:void(0);"
					onclick="moveTabPage('TAB_WOMEN','WOMEN');" id="tabKind_WOMEN"
					value="WOMEN"><span>WOMEN</span></a>

			</div>


			<div class="rp-recency">
				<div class="review-list-head wrap-product-list event">
					<input type="hidden" id="brndIds" name="brndIds" value="">

				</div>

				<div id="review-list01" class="review-plus-list grid-list5">
					<input type="hidden" id="pageNo" name="pageNo" value="1"> <input
						type="hidden" name="reply_more_yn" id="reply_more_yn" value="">



					<!--일반리뷰 반복 시작 -->
					<c:forEach var="rvList" items="${ReviewList}">
						<%-- 			<div class="review-plus-cont grid-item ${rvList.pro_gender}" style="float:left"> --%>
						<div class="review-plus-cont grid-item" style="float: left">
							<div class="product-list-sub">

								<figure class="item-box">
									<span class="item-img"> <img
										src='<c:url value='${ rvList.img_loc}'></c:url>'>
									</span>
									<figcaption class="item-info">
										<div class="item-brand">${rvList.brand_name}</div>
										<div class="item-name">${rvList.pro_name}</div>
										<div class="item-price">
											<span class="price">${rvList.pro_price}</span>

										</div>
									</figcaption>
								</figure>
							</div>

							<figure class="item">

								<div class="img">

									<span> 
									<img
										src="https://cdn.hfashionmall.com/contents/review/3484288227933705.jpg?RS=200&amp;AO=1"
										alt="" style="transform: rotate(90deg)">
										<form action="${contextPath}/Hfashion?command=reviewdetail&R_no=${rvList.r_no}" method="post">
		                                  <!-- 리뷰 디테일 jsp로 변수 전달 -->
										 <input type="hidden" name="proname" value="${rvList.pro_name}">
										 <input type="hidden" name="b_name" value="${rvList.brand_name}"> 
										  <input type="hidden" name="img_loc" value="${rvList.img_loc}"> 
										 <input type="submit" value="리뷰 상세보기">
										</form>
									</span>
								</div>
							</figure>
							<figure class="item">
								<figcaption class="info">
									<div class="point-wrap">
										<div class="point">
											<span class="ico" style="width: 100%">${rvList.star_rating}
											</span>
										</div>
										<div class="item-color">
											<span class="color">${rvList.size_name}</span>
										</div>
									</div>
								</figcaption>
							</figure>
						</div>
					</c:forEach>


					<!--일반리뷰 반복 끝 -->


					<!-- 페이징 부분 -->
					<div class="paging" id="pagingArea">
						<span> <strong title="현재 페이지">1</strong> <a
							href="javascript:void(0)" id="page_2" onclick="movePage('2')">2</a>
							<a href="javascript:void(0)" id="page_3" onclick="movePage('3')">3</a>
							<a href="javascript:void(0)" id="page_4" onclick="movePage('4')">4</a>
							<a href="javascript:void(0)" id="page_5" onclick="movePage('5')">5</a>
							<a href="javascript:void(0)" id="page_6" onclick="movePage('6')">6</a>
							<a href="javascript:void(0)" id="page_7" onclick="movePage('7')">7</a>
							<a href="javascript:void(0)" id="page_8" onclick="movePage('8')">8</a>
							<a href="javascript:void(0)" id="page_9" onclick="movePage('9')">9</a>
							<a href="javascript:void(0)" id="page_10"
							onclick="movePage('10')">10</a>
						</span> <a class="next" href="javascript:void(0)" title="다음 페이지"
							onclick="movePage('11')">다음 페이지</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="/hfm_pc/resources/js/display/display.js?timestamp=20221123154834"></script>
	<script type="text/javascript"
		src="/hfm_pc/resources/js/review.js?timestamp=20221123154834"></script>
	<script>

$(function(){
	$("button").click(function()){
		$(".layer-pop lg review-layer").fadeIn();
	}
	$(".layer-wrap").click(function(){
		$(".layer-pop lg review-layer").fadeOut();
	});
	
});	

</script>

</div>









<%@ include file="/layout/footer.jsp"%>

