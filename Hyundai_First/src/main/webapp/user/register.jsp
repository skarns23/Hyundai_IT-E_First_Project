<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">
	<!-- 남승현 작성 	 -->
	<!-- content-wrap -->
	<section class="content-wrap">
		<h2 class="page-title">회원가입</h2>
		<form id="addMbrForm" name="addMbrForm" action="${contextPath}/Hfashion?command=join" method="post">
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
										<input type="text" title="아이디" name="user_id" id="mbrId" minlength="6" maxlength="20" placeholder="" onblur="idCheckResult();" class="inp-reset" required>
									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrId"></p>
									<p class="txt-form-cmt">6-20자의 영문, 숫자 또는 영문 + 숫자 조합으로 입력 가능</p>
								</td>
							</tr>
							<script type="text/javascript">
							/* 남승현 작성  
							기능 : 사용자가 입력한 이메일의 유효성 및 중복성 검사 
					 		*/
						$(function(){
							$("#mbrEmail").focusout(function(){
								$.ajax({
									url : 'Hfashion?command=confirmEmail',
									data : {
											email : $("#mbrEmail").val()
									},
									success : function(result){
										var obj = JSON.parse(result);
										if(obj==0)
											$("#descMbrEmail").html('사용가능한 이메일입니다.');
										else
											$("#descMbrEmail").html('사용할 수 없는 이메일입니다.');
									}
								})
							})
								/*남승현 작성  
								기능 : 사용자의 아이디에 대한 유효성 및 중복성 검사
	 								*/
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

									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrPw"></p>
									<p class="txt-form-cmt">영문, 숫자, 특수문자 조합 8-15자로 사용 가능</p>

									<div class="input-box" id="divMbrCheckPw">
										<input type="password" title="비밀번호 확인" name="user_pw_ck" id="mbrCheckPw" maxlength="15" onblur="passwordCheckResult();" placeholder="비밀번호 확인" class="inp-reset">
									</div>
									<p class="txt-invalid" style="display: block;" id="descMbrCheckPw"></p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn-box">
					<button type="submit" id="btn_join" class="btn-type2-lg">
						<span>가입하기</span>
					</button>
				</div>
			</div>
		</form>
		<!-- //join-wrap -->
	</section>
	<script>
	/* 남승현 작성  
	기능 : 비밀번호와 확인 비밀번호가 동일한지 여부 판단 
		*/
$(function(){
	let btn_update = $("#btn_join");
	$("#mbrCheckPw").focusout(function(){
		var update_pw = $("#mbrPw").val();
		let check_pw = $("#mbrCheckPw").val();
		btn_update.attr('disabled',true);
		if(update_pw.length<8){
			$("#descMbrCheckPw").html("비밀번호 사용불가");
		}else if(update_pw===check_pw){
				$("#descMbrCheckPw").html("비밀번호 일치");
				btn_update.attr('disabled',false);
		}else {
			$("#descMbrCheckPw").html("비밀번호가 일치하지 않습니다.");
		}
		
	});
})
</script>

</div>
<%@ include file="../layout/footer.jsp"%>