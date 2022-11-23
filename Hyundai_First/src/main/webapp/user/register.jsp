<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">

	<!-- content-wrap -->
	<section class="content-wrap">
		<h2 class="page-title">회원가입</h2>
		<form id="addMbrForm" name="addMbrForm" action="/public/member/addMemberAction" method="post">
			<input type="hidden" name="calMemberAge" id="calMemberAge"> <input type="hidden" id="pwdCheck"> <input type="hidden" id="mobilNo" name="mbr.mobilNo"> <input type="hidden" name="mbrIdCntc.idCntcTpCd" id="idCntcTpCd" value=""> <input type="hidden" name="mbrIdCntc.toknId" id="idCntcToknId" value="">
			<input type="hidden" name="mbrIdCntc.loginId" value=""> <input type="hidden" id="wlfrAuthYn" value=""> <input type="hidden" id="wlfrMbrName" value=""> <input type="hidden" id="wlfrMbrMobileNo" value="">
			<!-- join-wrap -->
			<div class="join-wrap">
				

				<h3 class="sec-title mt0">필수 정보</h3>
				<div class="tbl-write">
					<table>
						<caption>회원가입 필수 정보</caption>
						<colgroup>
							<col style="width: 160px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td>
									<div class="input-box" id="divMbrNm">
										<!-- [D]정상일 경우 class(valid) 추가 -->
										<input type="text" title="이름" name="mbr.mbrNm" id="mbrNm" maxlength="30" onblur="mbrNameCheckResult();" placeholder="" class="inp-reset">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
											<i class="icon-valid">정상</i>
										</div>
									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrNm"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td>
									<div class="input-box" id="divMbrBrthdy">
										<!-- [D]오류일 경우 class(invalid) 추가 -->
										<input type="text" title="생년월일" name="mbr.mbrBrthdy" id="mbrBrthdy" maxlength="8" onblur="checkBirthDay();" placeholder="YYYYMMDD, 만 14세 이상 가입" class="inp-reset">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
											<i class="icon-valid">오류</i>
										</div>
									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrBrthdy"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<div class="input-box" id="divMbrEmail">
										<input type="text" title="이메일" name="mbr.mbrEmail" id="mbrEmail" maxlength="100" placeholder="" class="inp-reset" value="">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
											<i class="icon-valid">오류</i>
										</div>
									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrEmail"></p>
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td>
									<div class="form-group">
										<div class="input-box" id="divMobileNumber">
											<input type="text" title="휴대폰번호" id="mobileNumber" maxlength="11" onblur="mobileNumberCheckResult();" placeholder="" class="inp-reset">
											<div class="etc">
												<button type="button" class="btn-clear" id="mobilClear">
													<span>지우기</span>
												</button>
											</div>
										</div>
										<button type="button" class="btn-type1-m" id="sendSmsBtn" disabled="" onclick="sendSms();">
											<span>인증번호 전송</span>
										</button>
									</div>
									<p class="txt-invalid" style="display: block;" id="descMobileNumber"></p>

									<div class="form-group" id="certiDiv" style="display: none;">
										<div class="input-box" id="divcerti_str">
											<input type="text" title="인증번호 (숫자 6자리)" placeholder="인증번호 (숫자 6자리)" id="certi_str" name="certi_str" maxlength="6" class="inp-reset">
											<div class="etc">
												<button type="button" class="btn-clear" id="certiClear">
													<span>지우기</span>
												</button>
												<span class="txt-countdown" style="display: block;" id="remainingTime"></span>
											</div>
										</div>
										<button type="button" class="btn-type1-m" id="checkCertNoBtn" disabled="" onclick="chkCertNo(); return false;">
											<span>인증번호 확인</span>
										</button>
									</div>
									<p class="txt-invalid" style="display: block;" id="descCerti_str"></p>
								</td>
							</tr>
							<tr class="sns_hide">
								<th scope="row">아이디</th>
								<td>
									<div class="input-box" id="divMbrId">
										<input type="text" title="아이디" name="mbr.mbrId" id="mbrId" maxlength="20" placeholder="" onblur="idCheckResult();" class="inp-reset">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrId"></p>
									<p class="txt-form-cmt">6-20자의 영문, 숫자 또는 영문 + 숫자 조합으로 입력 가능</p>
								</td>
							</tr>
							<tr class="sns_hide">
								<th scope="row">비밀번호</th>
								<td>
									<div class="input-box" id="divMbrPw">
										<input type="password" title="비밀번호" name="mbr.mbrPw" id="mbrPw" maxlength="15" onblur="passwordResult();" placeholder="" class="inp-reset">
										<div class="etc">
											<!-- [D]비밀번호 안전도 : 안전-->
											<span class="txt-pw-level" id="pwdHigh">안전</span>
											<!-- [D]비밀번호 안전도 : 보통 -->
											<span class="txt-pw-level" id="pwdNormal">보통</span>

											<button type="button" class="btn-masking">
												<span>마스킹</span>
											</button>
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrPw"></p>
									<p class="txt-form-cmt">영문, 숫자, 특수문자 3가지 종류 8-15자 또는 2종류 이상
										조합 10-15자로 사용 가능</p>

									<div class="input-box" id="divMbrCheckPw">
										<input type="password" title="비밀번호 확인" id="mbrCheckPw" maxlength="15" onblur="passwordCheckResult();" placeholder="비밀번호 확인" class="inp-reset">
										<div class="etc">
											<!-- [D]비밀번호 안전도 : 안전-->
											<span class="txt-pw-level" id="checkPwdHigh">안전</span>
											<!-- [D]비밀번호 안전도 : 보통 -->
											<span class="txt-pw-level" id="checkPwdNormal">보통</span>

											<button type="button" class="btn-masking">
												<span>마스킹</span>
											</button>
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrCheckPw"></p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn-box">
					<button type="button" class="btn-type2-lg" onclick="doRegistMember(); return false;">
						<span>가입하기</span>
					</button>
				</div>
			</div>
		</form>
		<!-- //join-wrap -->
	</section>


</div>
<%@ include file="../layout/footer.jsp"%>