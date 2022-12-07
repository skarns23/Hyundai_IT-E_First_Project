<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/layout/header.jsp"%>
<div id="container">
	<section class="content-wrap">

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
							<li><a href="${contextPath}/Hfashion?command=mypage_searchOrder">주문 조회</a></li>
							

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

			<h3 class="page-title">회원 탈퇴</h3>
			<div class="page-info">
				<p class="txt-type2">그동안 한섬을 이용해 주셔서 대단히 감사합니다.</p>
				<p class="txt-type2 mt5">탈퇴유형을 선택하여 주십시오.</p>
			</div>

			<dl class="txt-group">
				<dt>H패션몰 회원 탈퇴</dt>
				<dd>
					<ul class="txt-list">
						<li>패션몰 제공하는 모든 서비스를 이용할 수 없습니다.</li>
						<li>한섬 구매채널
							<ul class="txt-list2">
								<li>한섬 오프라인 매장(백화점, 대리점, 더한섬하우스 등)</li>
								<li>더한섬닷컴</li>
								<li>H패션몰</li>
								<li>EQL</li>
							</ul>
						</li>
					</ul>
				</dd>
			</dl>



			<div class="btn-box">
				<button type="button" class="btn-type4-lg" id="btn_secession">
					<span>한섬 통합멤버십 탈퇴</span>
				</button>

			</div>


		</div>
		<!-- //snb-content-wrap -->
	</section>
</div>
	<!-- 남승현 작성  
			기능 : 회원 탈퇴 버튼 클릭 시 Ajax를 통한 회원탈퇴 성공여부 반환 및 페이지 이동
	 -->
<script>
	$(function() {
		$("#btn_secession").click(function() {
			var input = confirm("탈퇴하시겠습니까?");
			console.log(input);
			if (input) {
				$.ajax({
					url : '${contextPath}/Hfashion?command=mypage_sucession',
					success : function(result) {
						var obj = JSON.parse(result);
						console.log(result);
						if (obj == 1) {
							alert("회원탈퇴 성공");
							location.href = "Hfashion";
						} else {
							alert("회원탈퇴 실패");
						}
					},
					error : function(e) {
						console.log(e);
						alert('조회 실패');
					}
				})
			}

		})
	})
</script>
<%@include file="/layout/footer.jsp"%>