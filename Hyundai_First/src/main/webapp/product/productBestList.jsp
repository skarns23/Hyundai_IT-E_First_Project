<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<script>
$(document).ready(function(){
	$(".gender").click(function(){
		$(".tit-tab").removeClass('on');
		$(this).parents().addClass('on');
	})
});
</script>

<div id="container">

	<section class="content-response" id="bestPageGod">

		<h2 class="page-title type2 tit-tab-wrap eng" id="bestPageTitle">
			<!-- <span class="sub">판매 인기 상품 TOP30을 소개 합니다.</span> -->
			<span class="tit-tab on" id="brand"> <a class="gender" id="여성">WOMAN BEST</a>
			</span> <span class="tit-tab" id="category"> <a class="gender" id="남성">MAN BEST</a>
			</span>
		</h2>

		<!-- 탭 콘텐츠1 -->
		<div id="best-tab-cont1" class="best-cont on">

			<div class="wrap-product-list">
				<div class="list-head type02"></div>
				<ul class="product-list" id ="productBest">
					<c:forEach var="bestlist" items="${bestInfo}">
					<c:set var="i" value="${i+1}"/>
					<li godno="GM0122050247013">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GM0122050247013" data-ga-name="어반 커뮤터 카드 홀더" data-ga-brand="TOMMY HILFIGER MEN" data-ga-price="47200">
							<div class="item-img">
								<div class="img-box">
									<a href="${contextPath}/Hfashion?command=detail&pno=${bestlist.pro_no}" onclick="goGodDetail('GM0122050247013')">
										<div class="img">
											<img src='<c:url value='${bestlist.img_loc}'></c:url>'
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122050247013">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122050247013');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);" onclick="goGodDetail('GM0122050247013')"> <span class="item-rank rank-top"> ${i} </span>
									<div class="item-brand"> <c:out value="${bestlist.brand_name}"></c:out></div>
									<div class="item-name"><c:out value="${bestlist.pro_name}"></c:out></div>
									<div class="item-price">
										<span class="price"><fmt:formatNumber value="${bestlist.pro_price}" pattern="#,###" /> 원</span>


									</div>



								</a>
								<div class="item-review">
									<c:choose>
										<c:when test="${bestlist.reviewCnt>0}">
											<a href="javascript:void(0);" onclick="goGodDetail('GM0122050247013', '', '', 'Y')">리뷰 <c:out value="${bestlist.reviewCnt}"></c:out> </a>
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0);" onclick="goGodDetail('GM0122050247013', '', '', 'Y')"></a>
										</c:otherwise>
									</c:choose>
									
									
								</div>
							</figcaption>
						</figure>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</section>
</div>


<script>
$('.gender').click( function(){
	
	var genderVal = $(this).attr("id");
	var categoryNo = $('#categoryNo').val();
	
	$.ajax({
		url: 'Hfashion?command=bestSort',
		type: 'GET',
		data:{
			gender : genderVal
		},
		success: function(result){
			//alert("ajax 는 쉬운것이다!")
			
			var obj = JSON.parse(result);
			

			var tag="";
			for(var i=0; i<obj.length; i++){
				let price = obj[i].pro_price;
				price = price.toLocaleString('ko-KR');
				let reviewCnt = obj[i].reviewCnt;
				tag += `
					<li godno="GM0122050247013">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GM0122050247013" data-ga-name="어반 커뮤터 카드 홀더" data-ga-brand="TOMMY HILFIGER MEN" data-ga-price="47200">
							<div class="item-img">
								<div class="img-box">
									<a href="Hfashion?command=detail&pno=\${obj[i].pro_no}" onclick="goGodDetail('GM0122050247013')">
										<div class="img">
											<img src='${contextPath}/\${obj[i].img_loc}'>
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122050247013">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick" onclick="showProductQuickView('GM0122050247013');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);" onclick="goGodDetail('GM0122050247013')"> <span class="item-rank rank-top"> \${i+1}</span>
									<div class="item-brand">\${obj[i].brand_name}</div>
									<div class="item-name">\${obj[i].pro_name}</div>
									<div class="item-price">
										<span class="price">\${price} 원</span>
									</div>

								</a>
						`
				if(reviewCnt>0){
					tag+=`
								<div class="item-review">
									<a href="javascript:void(0);" onclick="goGodDetail('GM0122050247013', '', '', 'Y')">리뷰 \${reviewCnt}</a>
								</div>
							</figcaption>
						</figure>
					</li>`
				}else{
					tag+=`
								<div class="item-review">
									<a href="javascript:void(0);" onclick="goGodDetail('GM0122050247013', '', '', 'Y')"></a>
								</div>
							</figcaption>
						</figure>
					</li>`
				}
				
			}
			 $("#productBest").html(tag); 

		},
		error:function(){
			alert("ajax 에러다 요녀석아");
		}
	});
	
});


</script>




<%@ include file="../layout/footer.jsp"%>