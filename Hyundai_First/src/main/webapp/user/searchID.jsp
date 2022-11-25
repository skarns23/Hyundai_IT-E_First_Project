<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">
	<form action="${contextPath}/Hfashion?command=searchID" method="post" id="findIdForm">
		<input type="hidden" id="drmncyYn" name="drmncyYn">
		<!-- content-wrap -->
		<section class="content-wrap">
			<h2 class="page-title">아이디찾기</h2>
			<!-- idpw-wrap -->
			<div class="idpw-wrap">
				<div id="idpwTab" class="tab-wrap2 ui-tab initialized">
					<ul class="tabs tab-btn">
						<li class="on"><a href="javascript:;">등록된 정보로 찾기</a></li>
						
					</ul>
					<!-- 탭1 -->
			
					<div class="tab-cont on">
						<div class="input-info-wrap">
							<ul class="input-info-group">
								<li>
									<div class="input-box">
										<input type="text" title="이름" placeholder="이름"
											class="inp-reset" name="find_name" id="mbrNm" maxlength="30">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" id="descMbrNm"></p>
								</li>
								<li>
									<div class="input-box">
										<input type="text" title="이메일" placeholder="이메일"
											class="inp-reset" name="find_email" id="mbrEmail"
											maxlength="30">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" id="descMbrBrthdy"></p>
								</li>
								<li>
									<div class="input-box">
										<input type="text" title="휴대폰번호" placeholder="휴대폰번호"
											class="inp-reset" maxlength="11" id="mbfPhone"
											name="find_phone">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" id="descMobileNumber"></p>
								</li>
							</ul>
						</div>

						<div class="btn-box">
							<button type="submit" class="btn-type2-lg"">아이디
								찾기</a>
						</div>
						<div class="find-guide-box" style="margin-top: 40px;"></div>
					</div>
				


				</div>
			</div>
			<!-- //idpw-wrap -->
		</section>
		<!-- //content-wrap -->
	</form>

</div>
<%@ include file="../layout/footer.jsp"%>