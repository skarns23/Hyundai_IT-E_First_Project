<!-- 신수진 작성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
// 상품 옵션 선택 시 총합 가격 띄우기
function showTotal(){
	$(".total").show();
}

// 장바구니 담기
function addCart(pno){
   var selSize = document.getElementById("selSize");
   var size = selSize.innerHTML;
   var cnt = document.getElementById("pro_qty").value;
   
   // 옵션을 선택하지 않고 담는 경우, 경고메세지(alert) 띄우기
   if(size == ""){
      alert("옵션을 다시 선택해 주세요.");
      return false;
   }
   // 로그인하지 않은 경우, 로그인 페이지로 이동
	 var uid = '<%=request.getSession().getAttribute("loginUser")%>';
   if(uid == 'null'){
      window.location.replace("Hfashion?command=cart&ex_action=detail&pro_no="+pno);
      return false; 
   }
   
   // 장바구니 상품 담기
   $.ajax({
      url : 'Hfashion?command=cart',
      type : 'post',
      data : {
         pro_no : pno,
         size_name : size,
         size_amount : cnt,
         ex_action : 'detail'
      },
      success : function(result){
    	  // 장바구니 담기 성공한 경우
    	  // 모달창 띄우기
         $("#layerShoppingBag").css("display", "block");
      },
      error : function(e){
         console.log(e)
      }
   })
}
</script>

<script type="text/javascript" src="${contextPath}/js/product/productDetail.js"></script>
<div id="container">
	<div class="content-response">
		<div class="product-view-top">
			<div class="product-view-img">
				<div id="pdViewSlide" class="product-view-slide" data-slide-length="${imgSize}">
					<div class="swiper-container">
						<div id="productImgSlide" class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
							<c:forEach var="imgVO" items="${imgList}">
								<c:set var="i" value="${i+1}" />
								<div class="swiper-slide swiper-slide-duplicate" style="text-align: center;" data-swiper-slide-index="${i}">
									<img src="${contextPath}/${imgVO.img_loc}" style="width: 535.5px;">
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="swiper-pagination">
						<button type="button" class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 1">1</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2">2</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3">3</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4">4</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 5">5</button>
						<button type="button" class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 6">6</button>
					</div>
					<div class="slide-nav type6">
						<button type="button" class="slide-nav-prev" tabindex="0" role="button" aria-label="Previous slide">이전</button>
						<button type="button" class="slide-nav-next" tabindex="0" role="button" aria-label="Next slide">다음</button>
					</div>
				</div>
			</div>
			
			<!-- swiper 슬라이드 script -->
			<script>
        var mySwiper = new Swiper('.swiper-container', {
            // 슬라이드를 버튼으로 움직일 수 있습니다.
            navigation: {
                nextEl: '.slide-nav-next',
                prevEl: '.slide-nav-prev',
            },

            // 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
            },

            // 현재 페이지를 나타내는 스크롤이 생깁니다. 클릭하면 이동합니다.
            scrollbar: {
                el: '.swiper-scrollbar',
                draggable: true,
            },

            // 3초마다 자동으로 슬라이드가 넘어갑니다. 1초 = 1000
            autoplay: {
                delay: 3000,
            },
        });
        var mySwiper = new Swiper('.swiper-container', {
        });
    </script>

			<div class="product-view-info">
				<div class="etc-btn">
					<button type="button" class="btn-like " onclick="addBukmk(this,addBukmkCallback);" godno="GM0122103109697">
						<strong class="godBukmkCnt" cnt="6" godno="GM0122103109697"></strong> 
						<span>좋아요</span>
					</button>
					<span class="bar">|</span>
					<button type="button" class="btn-share" onclick="layerBox.open('layerShare');">
						<span>공유</span>
					</button>
				</div>
				<p class="item-brand">
					<a href="#"> ${pVO.pro_gender}</a>
				</p>
				<p class="item-tag">
					<span class="code">${pVO.brand_name}</span>
				</p>
				<p class="item-name">${pVO.pro_name}</p>
				<div class="item-price">
					<input type="hidden" id="pro-price" value="${pVO.pro_price}">
					<p class="price">
						<span> <fmt:formatNumber value="${pVO.pro_price}" pattern="#,###" /></span>
					</p>
				</div>

				<!-- 상품 선택 정보 -->
				<div class="product-view-option">
					<div class="row size gnrlOpt">
						<div class="select" name="optSelect0_top">
							<button type="button" class="sel-btn" onclick="select.trigger('option');">
								사이즈를 선택하세요. <span class="val" id="selSize"></span>
							</button>
							<div class="sel-list">
								<ul optcd="SIZE_OPT">
									<c:forEach var="sVO" items="${sList}">
										<li>
											<label> 
												<input type="radio" onchange="selectActive('pdStickySelSize_0',0,'option');" onclick="showTotal();"> <span>${sVO.size_name}</span>
											</label>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>

					<div class="option-bot">
						<div name="qtyDiv" class="row quantity aditQtyDiv" style="" godno="" selectoptionyn="Y">
							</strong> <span class="item-count">
								<button type="button" class="btn-minus" onclick="quantityCalc('minus');">
									<span>빼기</span>
								</button> <input type="number" name="qtySpinner" class="input-num aditGodQty" id="pro_qty" value="1" onkeyup="changeQty(this);">
								<button type="button" class="btn-plus" onclick="quantityCalc('plus');">
									<span>더하기</span>
								</button>
							</span>
						</div>
						<div class="total" style="display: none;">
							<strong class="tit">합계</strong> 
							<span class="num"> 
								<fmt:formatNumber value="${pVO.pro_price}" pattern="#,###" />
							</span>
						</div>
						<div class="btn-box">
							<button name="btnShoppingBag" type="button" class="btn-type4-xlg btnShoppingBag" onclick="addCart('${pVO.pro_no}');">
								<span>장바구니</span>
							</button>
						</div>
					</div>
				</div>

				<input type="hidden" id="size_name" name="size_name" value=""> 
				<input type="hidden" id="size_amount" name="size_amount" value=""> 
				<input type="hidden" name="ex_action" value="detail">

				<div class="info-bot">
					<ul class="list">
						<li class="row">
							<span class="tit">배송비</span> 
							<span> 
								<input type="hidden" id="otskrDlvAditCost" value="Y"> 30,000이상 구매시 무료(도서산간추가 3000원)
								<button type="button" class="btn-tooltip" onclick="tooltip('dlv-hardarea'); $('.list-common.address').niceScroll(dScroll.opt);">툴팁보기</button>
							</span>
							<div class="dlv-hardarea" style="display: none;">
								<ul class="txt-list">
									<li>구매하신 상품에 따라 배송비가 부과됩니다.</li>
									<li>도서산간 지역은 배송비가 추가 될 수 있습니다.<br> 해당 지역은 FAQ를 통해 확인하실 수 있습니다.</li>
									<li>H.Point, 한섬마일리지, H.Plus 등의 할인수단으로<br> 배송비 결제가 불가합니다.</li>
								</ul>
							</div>
						</li>
						<li>
							<span class="tit">한섬마일리지</span> 
							<span>최대 6% 적립</span>
							<button type="button" class="btn-tooltip" onclick="tooltip('mileage-info2');">
								<span>툴팁보기</span>
							</button>
						<li>
							<span class="tit">H포인트</span> 
							<span>0.1% 적립
								<button type="button" class="btn-tooltip" onclick="tooltip('hpoint-info2', null, null,null,null);">
									<span>툴팁보기</span>
								</button>
							</span>
						</li>
					</ul>
				</div>
			</div>

		</div>
		<div class="product-view-detail">
			<div class="product-detail-tab tab-wrap2 anchor-wrap">
				<!-- 상품 상세 정보 -->
				<section id="tabContentReview" class="anchor-section product-detail-review">
					<h3 class="sec-title">리뷰</h3>
					<div class="product-detail-review-list">
						<div class="head">
							<div id="prdReviewFilter" class="opt">
								<div class="select">
									<input type="number" id="search_height" placeholder="키" default='' style="width: 80px;" />cm
								</div>
								<div class="select">
									<input type="number" id="search_weight" placeholder="몸무게" value='' style="width: 80px;" />kg
								</div>
								<div class="select">
									<span style="font-size: 13px; color: gray;">사이즈</span>
									<button type="button" id="btn_size" class="sel-btn" onclick="select.trigger();"></button>
									<div class="sel-list">
										<ul>
											<c:forEach var="sVO" items="${sList}">
												<li>
													<label> 
														<input type="radio" name="optValCd1" value="${sVO.size_name}">
														<span>${sVO.size_name}</span>
													</label>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>

								<button type="button" class="btn-type1-sm" id="btn_search">
									<span>필터적용</span>
								</button>
							</div>
							<div class="opt"></div>
						</div>
						<div id="reviewNodata" class="nodata" style="display: none;">
							지금 첫 리뷰를 작성해주세요.<br> 포토리뷰 1,000포인트, 텍스트 리뷰 300포인트를 증정합니다. (상품구매시)
						</div>
						<div id="allReviewList" class="board-list board-review ui-fold" style="">
							<ul class="list-content">
							</ul>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

</div>

<!-- 장바구니 담기 모달 -->
<div id="layerShoppingBag" class="layer-pop" tabindex="0" style="display: none;">

	<div class="layer-wrap" tabindex="0">
		<div class="layer-header">
			<h2 class="layer-title">장바구니 담기 완료</h2>
		</div>
		<div class="layer-container">
			<div class="layer-content layer-shopping-bag">
				<p class="txt">
					해당 상품이 장바구니에 담겼습니다.<br>장바구니로 이동하시겠습니까?
				</p>
				<div class="btn-box">
					<button type="button" onclick="layer.close('layerShoppingBag');" class="btn-type4-lg">
						<span>계속 쇼핑하기</span>
					</button>
					<button type="button" onclick="location.href='${contextPath}/Hfashion?command=cart'" class="btn-type2-lg">
						<span>장바구니 보기</span>
					</button>
				</div>
			</div>
		</div>
		<button type="button" class="btn-layer-close" onclick="layer.close('layerShoppingBag');">닫기</button>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function(){
   get_review();
   $("#btn_search").click(get_review);
});

function get_review() {
	   var pro_no = ${pVO.pro_no};
	   var height = $("#search_height").val();
	   var weight = $("#search_weight").val();
	   var val_size = $("#btn_size").text();
	   $.ajax({
	      url : "Hfashion?command=reviewSearch",
	      data : {
	         pro_no : pro_no,
	         height : height,
	         weight : weight,
	         pro_size : val_size
	      },
	      success : function(result) {
	          var obj = JSON.parse(result);
	          console.log(obj);
	          if(obj.length == 0){
	                   $("#reviewNodata").css("display", "block");
	                }

	          var row ="";
	          for(var i = 0; i<obj.length;i++){
	             row +=`<li class='on'><div class='list-row fold-header'><div class='cell-title'><ul class='etc-info'>
	                    <li><button type='button' class='btn-like2' onclick='insert_like(\${obj[i].review_no});' godevlturn='1' reviewgodno='GM0122092795931'><span class='like-count' likecnt='1'>\${obj[i].review_like}</span>
	                   </button></li><li><span class='date'>\${obj[i].review_date}</span></li></ul><p class='title-review'>\${obj[i].review_title}<i class='icon-attach'>이미지 첨부</i></p><button type='button' class='btn-fold'>열기</button>
	             </div></div><div class='fold-cont open'><div class='review-group'><ul class='review-prd-info'><li><div class='prd-name'>\${obj[i].user_id}</div></li>
	                 <li><div class='prd-option'>\${obj[i].height}cm, \${obj[i].weight}kg <em class='prd-option-color'> <span class='pdColor-/colorchips/GM0122092795931_COLORCHIP.jpg'>&nbsp; / 구매옵션 : \${obj[i].product_option}</span></em>
	                   </div></li></ul><ul class='files'><li class='img-file'><button type='button' onclick='layerViewImg();' style='background-image: url(${contextPath}/\images/review/\${obj[i].review_img}); transform: rotate(0deg);'>
	                     <img src= ${contextPath}/images/review/${obj[i].review_img}  alt='7AE074DE-6EE9-4107-BFFF-4E1874F1AB83' style='transform: rotate(0deg);'/></button>

	                 </li></ul><div class='txt-box'>\${obj[i].review_content}</div><div class='review-report'>
	                 <button type='button' class='btn-report' onclick='alert('로그인 후 참여 가능합니다.');location.href='/public/member/login''></button></div></div></div></li>`;
	          }
	          $(".list-content").html(row);
	      },
	      error : function(e) {
	         alert('조회 실패');
	      }
	   })
	}

// 좋아요 기능
function insert_like(review_no){   

   var r_no=review_no; //리뷰 넘버 변수 받아옴
   
   $.ajax({
       url : 'Hfashion?command=goodinsert', // 연결 url
         type: 'post',                     // post 방식으로 데이터 전달
        data : {
          r_no : r_no,
        },      
        success : function(obj){                     //ajax통신 성공시 넘어오는 데이터를 json으로 파싱, 이때 result 배열에서 1의 인덱스는 아이디당 좋아요 유무
           var result = JSON.parse(obj);
             
             if(result[1]==0){
                alert("이 상품은 이미 '좋아요'를 눌렀습니다");
             }
             get_review();
            
           $(this).addClass("on");
        },
       error: 
          function (e){
             console.log(e);
            alert("로그인 이후에 이용해주세요");                  
          }
   });
 };
</script>

<%@ include file="../layout/footer.jsp"%>