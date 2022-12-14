<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/layout/header.jsp"%>
<style>
input[type=date]{
		border: none;
    font-size: 10px;
    font-family: 'Noto Sans KR';
    padding: 10px;
}
</style>
<div id="container">
	<section class="content-wrap">
		<input type="hidden" name="hPointEnableYn" id="hPointEnableYn" value="">
		<!-- snb -->
		<div class="snb-wrap">
			<h2 class="lnb-title">
				<a href="${contextPath}/Hfashion?command=mypage">MYPAGE</a>
			</h2>
			<nav id="lnb" class="lnb">
				<ul>
					<li>
						<div class="menu-depth1">쇼핑정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/Hfashion?command=mypage_searchOrder">주문조회</a></li>

						</ul>
					</li>
					<li>
						<div class="menu-depth1">회원정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/Hfashion?command=mypage_pwConfirmpage">회원정보 수정</a></li>
							<li><a href="${contextPath}/Hfashion?command=mypage_OutForm">회원 탈퇴</a></li>
						</ul>
					</li>

				</ul>
			</nav>
		</div>
		<!-- //snb -->
		<!-- snb-content-wrap -->
		<div class="snb-content-wrap">
			<script type="text/javascript" src="/resources/js/moment.js"></script>
			<script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20221123154834"></script>
			<!-- 마우스 우클릭 방지 예외-->
			<h3 class="page-title">주문</h3>
			<div class="page-info">
				<p class="txt-type3">주문내역 및 배송상태를 조회하실 수 있으며, 취소/교환/반품 신청이 가능합니다.</p>
			</div>
			<!-- period-search-group -->
			<div class="period-search-group">
				<dl class="period-btns-box">
				</dl>

				<div class="period-calendar">
					<div class="period-input">

						<input type="date" name="dateStart" id="dateStart" class="inp-datepicker datepicker hasDatepicker" title="시작일" value="2022-09-01">
					</div>
					<div class="period-input">
						<input type="date" name="dateEnd" id="dateEnd" class="inp-datepicker datepicker hasDatepicker" title="종료일" value="2022-11-28">

					</div>
					<button type="button" class="btn-type4-sm btn-period" id="search_period">
						<span>조회</span>
					</button>
				</div>
			</div>
			<div class="order-list-wrap order-slide-section">
			
				<div class="order-tbl order-history order-slide">
					
					<div class="slide-container noswipe">
					
						<!-- 전체한번만 노출 -->
						<div class="swiper-wrapper">
							<!--  슬라이드 단위 주문 3건씩 노출 -->
							<div class="swiper-slide">
								<!-- body -->
								<div class="body">
									<div class="nodata">
										<p class="txt-nodata">주문/배송 내역이 없습니다.</p>
									</div>
								</div>
							</div>
						</div>
						<!-- 전체한번만 노출 -->


					</div>
					<div class="order-links">
						<ul>
							<li><a href="${contextPath}/Hfashion?command=mypage_searchOrder">주문조회</a></li>
						</ul>
					</div>
					<div class="slide-util">
						<span class="slide-active"></span> <span class="bar">/</span> <span class="slide-total"></span> <span class="slide-nav type2">
							<button type="button" class="slide-nav-prev">이전</button>
							<button type="button" class="slide-nav-next">다음</button>
						</span>
					</div>
				</div>
			</div>
			<!-- //snb-content-wrap -->
	</section>
	<!-- 남승현 작성  
			기능 : 주문 내역 조회 시 시작날짜와 종료날짜를 받아 해당 기간에 포함된 주문내역을 띄워주는 Ajax
	 -->
	<script type="text/javascript">
                  $(function(){
                	 $('#dateEnd').val(new Date().toISOString().slice(0, 7));
                	 $('#dateStart').val(new Date().toISOString().slice(0, 7));
                	  function date_add(sDate, nDays) {
                		    var yy = parseInt(sDate.substr(0, 4), 10);
                		    var mm = parseInt(sDate.substr(5, 2), 10);
                		    var dd = parseInt(sDate.substr(8), 10);
                		    d = new Date(yy, mm - 1, dd + nDays);
                		    yy = d.getFullYear();
                		    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
                		    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
                		    return '' + yy + '-' +  mm  + '-' + dd;
                		}
                     $("#search_period").click(function(){
                        const start_date = $("#dateStart").val();
                        const end_date = date_add($("#dateEnd").val(),1);
                        var txt = '주문날짜';
                        if(start_date>=end_date){
                           alert("종료일이 시작일보다 앞일 수 없습니다.");
                           return ;
                        }
                        $.ajax({
                           url:'Hfashion?command=mypage_searchPeriod',
                           data :{user_id : "${sessionScope.loginUser.user_id}",
                              start_date : start_date,
                                     end_date : end_date   
                           },
                           success : function(result){
                              var obj = JSON.parse(result);
                              if(obj.length==0){
                                 var row = `<div class="nodata">
                                    <p class="txt-nodata">주문/배송 내역이 없습니다.</p>
                                 </div>`
                              }else {
                                 var row ="";
                              for (var i = 0; i < obj.length; i++) {
                                 let price = obj[i].pro_price.toLocaleString('ko-KR');
                                 var d_val = obj[i].cancle_date;
                                 var status = '주문취소';
                                 if(!obj[i].cancle_date){
                                	 d_val = obj[i].order_date;
                                	 status = '주문완료'
                                 }
                                 row += `<div class='row'><div class='inner'><div class='cell-pd-wrap'><div class='inner-row'><div class='info-row'><div class='cell-pd'><div class='item-img' godno='GM0122062466107'>
                                    <a href='Hfashion?command=detail&pno=${obj[i].pro_no}'> <img src='${contextPath}/\${obj[i].img_url}'></a></div><div class='item-info'><div class='item-brand'>
                                                    <a href='Hfashion?command=detail&pno=${obj[i].pro_no}'>\${obj[i].brand_name} </a></div><div class=item-name clear-ellipsis>
                                                    <a href='Hfashion?command=detail&pno=${obj[i].pro_no}'>\${obj[i].pro_name}</a></div><div class='item-opt'>
                                                    <a href='Hfashion?command=detail&pno=${obj[i].pro_no}'><span>\${obj[i].product_option}</span> <span>수량 : \${obj[i].order_amount} </a></div><div class="item-btn"></div>
                                                </div></div><div class='cell-price'><div class='cell-inner'><div class='price'><span><span class='num'>\${price}</span> 원</span>
                                                  </div></div></div><div class='cell-status'><div class='cell-inner'><div class='status'>\${txt}<br> <span class='txt-cmt pcolor'>\${obj[i].order_date}</br>\${status}</span></div></div></div></div></div></div></div></div></div></div>`;
                              }
                              }
                              $(".body").html(row);
                           },
                           error : function(e){
                              alert('조회 실패');
                           }
                        })
                     });
                  })
               </script>
</div>
<%@include file="/layout/footer.jsp"%>