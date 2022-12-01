<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/ui.min.css">
<style>
.item-size {
	margin-top: 10px;
	font-size: 12px;
	font-weight: 300;
}
</style>
<script>
function frmSubmit(i){
	$("#frm"+i).submit();
}
</script>
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
						<div class="review-plus-cont" onclick="frmSubmit('${rvbestlist.r_no}');">
							<a href="javascript:undefined;" onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');">
								<figure class="item" data-ga-name="아이코닉 토트백">
									<div class="img">
										<span> <img src='${contextPath}/\images/review/${rvbestlist.r_img}' alt="" style="transform: rotate(0deg)">
									</div>
								</figure>
							</a>
							<div class="product-list-sub">
								<a href="javascript:undefined;" onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');"> </a>
								<figure class="item-box">
									<span class="item-rank rank-top">BEST <span class="state">REVIEW</span></span>
									<span class="item-img"> <img src='<c:url value='${rvbestlist.img_loc}'></c:url>'>
									</span>
									</a>
									<figcaption class="item-info">
										<a href="javascript:undefined;" onclick="javascript:getLayerPopupGoodsReview(null,null,'GM0122093098215','1');"> </a><a href="javascript:void(0)" onclick="goGodDetail('GM0122093098215')">
											<form action="${contextPath}/Hfashion?command=reviewdetail&R_no=${rvbestlist.r_no}" method="post" id="frm${rvbestlist.r_no}">
												<!-- 리뷰 디테일 jsp로 변수 전달 -->
												<input type="hidden" name="proname" value="${rvbestlist.pro_name}"> <input type="hidden" name="b_name" value="${rvbestlist.brand_name}"> <input type="hidden" name="img_loc"
													value="${rvbestlist.img_loc}" style="transform: rotate(90deg);"> <input type="hidden" name="r_img" value="${rvbestlist.r_img}" style="transform: rotate(90deg);">

											</form>
											<div class="item-brand">${rvbestlist.brand_name}</div>
											<div class="item-name">${rvbestlist.pro_name}</div>
											<div class="item-price">
												<span class="price"><fmt:formatNumber value="${rvbestlist.pro_price}" pattern="#,###" /></span>
											</div>
											<div class="item-size">
												<span>${rvbestlist.size_name}</span>
											</div>
										</a>
									</figcaption>
								</figure>
							</div>
							<figure class="item">
								<figcaption class="info">
									<div class="item-comment">
										<span class="comment-txt"> ${rvbestlist.r_content}</span>
									</div>
									<div class="point-wrap">
										<div class="item-color">
											<button type="button" class="btn-like2" onclick="insert_like(96);">
												<span class="like-count">1${rvbestlist.r_like}</span>
											</button>
										</div>
									</div>
								</figcaption>

							</figure>

						</div>
					</c:forEach>

					<!--      여기까지 -->
				</div>
			</div>
			<div class="dp-tab">
				<a href="javascript:void(0);" onclick="moveTabPage('','ALL');" id="tabKind_ALL" value="ALL" class="on"><span>ALL</span></a>
			</div>


			<div class="rp-recency">
				<div class="review-list-head wrap-product-list event">
					<input type="hidden" id="brndIds" name="brndIds" value="">

				</div>

				<div id="review-list01" class="review-plus-list grid-list5">
					<input type="hidden" id="pageNo" name="pageNo" value="1"> <input type="hidden" name="reply_more_yn" id="reply_more_yn" value="">



					<!--일반리뷰 반복 시작 -->
					<c:forEach var="rvList" items="${ReviewList}">

						<div class="review-plus-cont grid-item" style="float: left" onclick="frmSubmit('${rvList.r_no}');">
							<div class="product-list-sub">

								<figure class="item-box">
									<span class="item-img"> <img src='<c:url value='${rvList.img_loc}'></c:url>' alt="">


									</span>
									<figcaption class="item-info">
										<div class="item-brand">${rvList.brand_name}</div>
										<div class="item-name">${rvList.pro_name}</div>
										<div class="item-price">
											<span class="price"><fmt:formatNumber value="${rvList.pro_price}" pattern="#,###" /></span>
										</div>
									</figcaption>
								</figure>
							</div>

							<figure class="item">

								<div class="img">

									<span> <!-- 상품이미지 --> <img src='${contextPath}/\images/review/${rvList.r_img}' style="width: 100%; height: 100%">
										<form action="${contextPath}/Hfashion?command=reviewdetail&R_no=${rvList.r_no}" method="post" id="frm${rvList.r_no}">
											<!-- 리뷰 디테일 jsp로 변수 전달 -->
											<input type="hidden" name="proname" value="${rvList.pro_name}"> <input type="hidden" name="b_name" value="${rvList.brand_name}"> <input type="hidden" name="img_loc"
												value="${rvList.img_loc}"> <input type="hidden" name="r_img" value="${rvList.r_img}" style="transform: rotate(90deg);">

										</form>
									</span>
								</div>
							</figure>

						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="/hfm_pc/resources/js/display/display.js?timestamp=20221123154834"></script>
	<script type="text/javascript" src="/hfm_pc/resources/js/review.js?timestamp=20221123154834"></script>
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

