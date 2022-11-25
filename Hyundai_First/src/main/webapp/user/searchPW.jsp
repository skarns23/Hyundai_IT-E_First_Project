<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">
<section class="content-wrap">
	<h2 class="page-title">비밀번호 재설정</h2>
	<!-- idpw-wrap -->
	<div class="idpw-wrap">
		<form method="post" id="findPwdForm" action="/public/member/viewMbrPwd">
			<div id="pwTab" class="tab-wrap2 ui-tab initialized">
				<ul class="tabs tab-btn">
					<li class="on"><a href="javascript:;">등록된 휴대폰 번호로 찾기</a></li>
				</ul>
				<!-- 탭1 -->
				<div class="tab-cont on">
					<div class="find-guide-box">
						<p class="txt">개인정보 보호를 위해 본인인증 후 비밀번호 재설정 해주시기 바랍니다.</p>
					</div>
					<div class="input-info-wrap">
						<ul class="input-info-group">
							<li>
								<div class="input-box">
									<input type="text" title="아이디" name="mbr.mbrId" id="mbrId" maxlength="20" placeholder="아이디" class="inp-reset">
									<div class="etc">
										<button type="button" class="btn-clear"><span>지우기</span></button>
									</div>
								</div>
								<p class="txt-invalid" style="display: block;" id="descMbrId"></p>
							</li>
							<li>
								<div class="input-box">
									<input type="text" title="이름" name="mbr.mbrNm" id="mbrNm" maxlength="30" placeholder="이름" class="inp-reset">
									<div class="etc">
										<button type="button" class="btn-clear"><span>지우기</span></button>
									</div>
								</div>
								<p class="txt-invalid" style="display: block;" id="descMbrNm"></p>
							</li>
							<li>
								<div class="form-group">
									<div class="input-box">
										<input type="text" title="휴대폰번호" name="mobileNumber" id="mobileNumber" maxlength="11" placeholder="휴대폰번호" class="inp-reset">
										<div class="etc">
											<button type="button" class="btn-clear" id="mobilClear"><span>지우기</span></button>
										</div>
									</div>
									<button type="button" class="btn-type1-m" id="sendSmsBtn" disabled="" onclick="sendSms();"><span>인증번호 전송</span></button>
								</div>
								<p class="txt-invalid" style="display: block;" id="descMobileNumber"></p>
							</li>
							<li id="certiLi" style="display:none;">
								<div class="input-box">
									<input type="text" title="인증번호 (숫자 6자리)" placeholder="인증번호 (숫자 6자리)" id="certi_str" name="certi_str" maxlength="6" class="inp-reset">
									<div class="etc">
										<button type="button" class="btn-clear"><span>지우기</span></button>
										<span class="txt-countdown" style="display: block;" id="remainingTime"></span>
									</div>
								</div>
								<p class="txt-invalid" style="display: block;" id="descCerti_str"></p>
							</li>
						</ul>
					</div>

					<div class="btn-box">
						<a href="javascript:;" class="btn-type2-lg" onclick="chkCertNo(); return false;">확인</a>
					</div>
				</div>

				<!-- 탭2 -->
				<div class="tab-cont">
					<div class="find-input">
						<div class="form-group">
							<div class="input-box">
								<input type="text" title="아이디" placeholder="아이디" id="tab2_mbrId" maxlength="20" class="inp-reset">
								<div class="etc">
									<button type="button" class="btn-clear"><span>지우기</span></button>
								</div>
							</div>
							<button type="button" class="btn-type1-m" onclick="isCheckId();return false;"><span>확인</span></button>
						</div>
						<p class="txt-invalid" style="display: block;" id="descTab2MbrId"></p>
					</div>

					<div class="find-guide-box" id="guideBox" style="display:none">
						<p class="txt">개인정보 보호를 위해 본인인증 후 비밀번호 재설정 해주시기 바랍니다.</p>
					</div>

					<ul class="auth-btns" id="auth" style="display:none">
						<li>
							<a href="javascript:;" onclick="openPCCWindow();" class="btn-auth phone">휴대폰 인증</a>
						</li>
						<li>
							<a href="javascript:;" onclick="openIpinWindow();" class="btn-auth ipin">아이핀 인증</a>
						</li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<!-- //idpw-wrap -->
</section>

</div>
<%@ include file="../layout/footer.jsp"%>