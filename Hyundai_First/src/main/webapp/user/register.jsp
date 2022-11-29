<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">

	<!-- content-wrap -->
	<section class="content-wrap">
		<h2 class="page-title">회원가입</h2>
		<form id="addMbrForm" name="addMbrForm" action="${contextPath}/Hfashion?command=join" method="post">
			<input type="hidden" name="calMemberAge" id="calMemberAge"> <input type="hidden" id="pwdCheck"> <input type="hidden" id="mobilNo" name="mbr.mobilNo"> <input type="hidden"
				name="mbrIdCntc.idCntcTpCd" id="idCntcTpCd" value=""> <input type="hidden" name="mbrIdCntc.toknId" id="idCntcToknId" value=""> <input type="hidden" name="mbrIdCntc.loginId"
				value=""> <input type="hidden" id="wlfrAuthYn" value=""> <input type="hidden" id="wlfrMbrName" value=""> <input type="hidden" id="wlfrMbrMobileNo" value="">
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
										<input type="text" title="이름" name="user_name" id="mbrNm" minlength="2" maxlength="20" onblur="mbrNameCheckResult();" placeholder="" class="inp-reset" required>
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
								<th scope="row">이메일</th>
								<td>
									<div class="input-box" id="divMbrEmail">
										<input type="text" title="이메일" name="user_email" id="mbrEmail" maxlength="100" placeholder="" class="inp-reset" value="" required>
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
											<input type="text" name="user_phone" title="휴대폰번호" id="mobileNumber" maxlength="11" onblur="mobileNumberCheckResult();" placeholder="" class="inp-reset" required>
											<div class="etc">
												<button type="button" class="btn-clear" id="mobilClear">
													<span>지우기</span>
												</button>
											</div>
										</div>

									</div>
									<p class="txt-invalid" style="display: block;" id="descMobileNumber"></p>


									<p class="txt-invalid" style="display: block;" id="descCerti_str"></p>
								</td>
							</tr>
							<tr class="sns_hide">
								<th scope="row">아이디</th>
								<td>
									<div class="input-box" id="divMbrId">
										<input type="text" title="아이디" name="user_id" id="mbrId" minlength = "6"maxlength="20" placeholder="" onblur="idCheckResult();" class="inp-reset" required>
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
							<script type="text/javascript">
						$(function(){
							$("#mbrId").focusout(function(){
								var reg = /^[a-zA-Z0-9_]{5,20}$/;
								let user_id= $("#mbrId").val();		
								$.ajax({
									url:'Hfashion?command=confirmID',
									data :{user_id : user_id	
									},
									success : function(result){
										var obj = JSON.parse(result);
										
										if(obj==1)
										$("#descMbrId").html('사용할 수 없는 아이디입니다.');
										else{
											
											$("#descMbrId").html('사용가능한 아이디입니다.');
										}									
										},
									error : function(e){
										alert('조회 실패');
									}
								})
							});
							
						})
						
					</script>
							<tr class="sns_hide">
								<th scope="row">비밀번호</th>
								<td>
									<div class="input-box" id="divMbrPw">
										<input type="password" title="비밀번호" name="user_pw" id="mbrPw" minlength="8" maxlength="15" onblur="passwordResult();" placeholder="" class="inp-reset" required> 
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
									<p class="txt-form-cmt">영문, 숫자, 특수문자 조합 8-15자로 사용 가능</p>

									<div class="input-box" id="divMbrCheckPw">
										<input type="password" title="비밀번호 확인" name="user_pw_ck" id="mbrCheckPw" maxlength="15" onblur="passwordCheckResult();" placeholder="비밀번호 확인" class="inp-reset">
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
					<button type="submit" class="btn-type2-lg">
						<span>가입하기</span>
					</button>
				</div>
			</div>
		</form>
		<!-- //join-wrap -->
	</section>
<script>
$(function(){
	
})
</script>

</div>
<%@ include file="../layout/footer.jsp"%>