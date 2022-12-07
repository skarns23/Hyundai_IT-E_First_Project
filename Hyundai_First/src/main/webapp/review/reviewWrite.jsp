<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!-- 윤태영작성 -->
<script type="text/javascript">
	$(function(){
		// 이미지 미리보기
		$(document).on("change", "#fileUpload", function(){
			setImageFromFile(this, $("#img-upload"));
			$("#img-upload").css("display", "block");
		})
		
		function setImageFromFile(input, expression) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$(expression).attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		// 클릭하면 file 버튼 클릭
		$(document).on("click", ".btn-upload", function() {
			$("#fileUpload").trigger("click");
		});
		
		$(document).on("click", "#submit-btn", function(){
			$("#review-frm").submit();
		})
	})
</script>
<!-- 마이페이지 부분에서 받아온다 체크된거만  -->

<!--  mypage 받아온 변수 -->

<div id="reviewEdit" class="layer-pop lg review-layer" tabindex="0" style="display: block;">
	<form id="review-frm" name="formm" method="post" encType="multipart/form-data"
		action="${contextPath}/Hfashion?command=mypage_reviewwrite&proname=${proname}&r_check=${r_check}&order_no=${order_no}&pro_no=${pro_no}&size_name=${size_name}">

		<input type="hidden" name="proname" value="${proname}"> <input type="hidden" name="r_check" value="${r_check}"> <input type="hidden" name="order_no" value="${orderno}"> <input
			type="hidden" name="pro_no" value="${prono}"> <input type="hidden" name="size_name" value="${sizename}">
		<!-- post 방식 -->
		<div class="layer-wrap" tabindex="0">
			<div class="layer-header">
				<h2 class="layer-title">리뷰 작성</h2>
			</div>
			<div class="layer-container">
				<div class="layer-content review-write">
					<div class="write-inner">
						<section class="write-section">
							<!--1. 상품 -->
							<h3 class="sub-title">1. 상품</h3>
							<p class="review-product-name">${proname}</p>
							<!-- 변수로 바꿔줘야함 -->
						</section>
						<!--2. 리뷰제목 입력 -->
						<section class="write-section">
							<h3 class="sub-title">
								2. 리뷰 제목을 작성해 주세요. <span class="required">(필수)</span>
							</h3>
							<div class="input-box">
								<input type="text" name="r_title" maxlength="50" title="리뷰 제목 작성" placeholder="제목을 입력해 주세요." class="inp-reset">
								<div class="etc">
									<button type="button" class="btn-clear">
										<span>지우기</span>
									</button>
								</div>
							</div>
							<!-- <span class="str-length"><span id="reviewSjLength">0</span>/50</span> -->
						</section>

						<!--3. 착용자 정보 입력 -->
						<section class="write-section">
							<h3 class="sub-title">3. 실 착용자의 정보를 입력해 주세요.</h3>
							<div class="write-user-info type2">
								<div class="cell">
									<div class="height">
										<label for="userInfo1" class="tit">키</label> <input type="text" name="height" title="키 입력" placeholder="키" value="" numberonly="" maxlength="3"> cm

									</div>
								</div>
								<div class="cell">
									<div class="height">
										<label for="userInfo1" class="tit">몸무게</label> <input type="text" name="weight" title="몸무게 입력" placeholder="몸무게" value="" numberonly="" maxlength="3"> kg

									</div>
								</div>
							</div>
							<div class="write-user-info mt10"></div>
						</section>
						<section class="write-section">
							<h3 class="sub-title">
								4 . 어떤 점이 좋았나요? <span class="required">(필수)</span>
							</h3>
							<textarea cols="30" rows="10" name="r_content" title="좋은 점 작성" maxlength="1000" placeholder="상품 문의는 상품 정보 우측 하단의 [상품문의] 버튼을 누르시거나, 또는 [MY PAGE > 리뷰 및 문의 > 1:1문의] 메뉴를 이용해 주시기 바랍니다."></textarea>
							<!-- <span class="str-length"><span id="reviewContLength">0</span>/1,000</span> -->
						</section>
					</div>
					<div class="write-inner">

						
						<section class="write-section">
							<!--사진첨부-->
							<h3 class="sub-title">6. 사진을 첨부해 주세요.</h3>
							<div class="upload-item">
								<div class="upload-item-list">
									<span class="item-box"> 
										<span class="btn-upload" style="cursor: pointer;">
											<img src="" id="img-upload" style="width: 100%; height: 100%; display: none;">
										</span>
									</span>
								</div>
								<input type="file" name="filename" title="파일 등록" style="display: none;" id="fileUpload">
								<p class="txt">* 이미지 첨부 시 10M 이하의 jpg, png, gif 파일을 최대 5장까지 등록하실 수 있습니다.</p>
							</div>
						</section>
					</div>

					<section class="alert-section">
						<h3 class="sub-title">상품리뷰 작성시 주의사항</h3>
						<ul class="txt-list">
							<li>작성하신 리뷰는 마이페이지에서 확인 가능합니다.</li>
							<li>작성하신 리뷰는 상품상세 외 H패션몰 내 다른 화면에서 판매 목적으로 전시될 수 있습니다. ( ex. 메인, 프로모션 리뷰 PLUS, STYLE 콘텐츠 등)</li>
							<li>리뷰 작성 시 이메일, 휴대폰번호 등 개인정보 입력은 금지되어있습니다.<br>개인 정보 입력 시 발생하는 모든 피해 및 저작권 침해에 대한 책임은 작성자에게 있습니다.
							</li>
							<li>다음과 같은 경우 작성하신 리뷰가 통보없이 미노출 처리될 수 있으며, 리뷰 포인트가 미지급될 수 있습니다.
								<ul class="txt-list2">
									<li>상품상세 이미지를 캡쳐해서 사용</li>
									<li>타 회원의 리뷰 이미지를 도용</li>
									<li>리뷰내용이 부적합하거나 비속어 사용</li>
								</ul>
							</li>
						</ul>
					</section>
					<div class="btn-box">
              <button type="button" class="btn-type2-lg" id="submit-btn" >
              	<span>등록</span>
              </button>
          </div>

				</div>
			</div>
			<!--나중에는 마이페이지로 이동 구현 -->
			<button type="button" class="btn-layer-close" onclick="location.href='Hfashion?command=mypage'">닫기</button>
		</div>
	</form>
</div>
