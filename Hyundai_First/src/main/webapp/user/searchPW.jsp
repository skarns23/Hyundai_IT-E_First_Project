<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">
<section class="content-wrap">
	<h2 class="page-title">비밀번호 찾기</h2>
	<!-- idpw-wrap -->
	<div class="idpw-wrap">
		<form method="post" id="findPwdForm" action="Hfashion?command=searchPW">
			<div id="pwTab" class="tab-wrap2 ui-tab initialized">
				<ul class="tabs tab-btn">
					<li class="on"><a href="javascript:;">등록된 이메일로 찾기</a></li>
				</ul>
				<!-- 탭1 -->
				<div class="tab-cont on">
					<div class="find-guide-box">
						<p class="txt">등록된 이메일을 활용하여 비밀번호를 찾아주시기 바랍니다.</p>
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
										<input type="text" title="이메일" name="mobileNumber" id="mbrEmail"  placeholder="이메일" class="inp-reset">
										<div class="etc">
											<button type="button" class="btn-clear" id="descMbrNm"><span>지우기</span></button>
										</div>
									</div>
								</div>
								<p class="txt-invalid" style="display: block;" id="descMobileNumber"></p>
							</li>
							<li id="certiLi" style="display:none;">
								<p class="txt-invalid" style="display: block;" id="descCerti_str"></p>
							</li>
						</ul>
					</div>

					<div class="btn-box">
						<button type="button"class="btn-type2-lg" onclick="searchPW()">확인</a>
					</div>
				</div>


			</div>
		</form>
	</div>
	<!-- //idpw-wrap -->
</section>
<script>
<!-- 남승현 작성  
기능 : 사용자 아이디,이름, 이메일이 동일한 User가 존재하지 여부와
       존재하는 경우 사용자의 비밀번호 alert으로 출력
		-->
function searchPW(){
	var user_id = $("#mbrId").val();
	var user_name = $("#mbrNm").val();
	var user_email = $("#mbrEmail").val();
	$.ajax({
		url : 'Hfashion?command=searchPW',
		data : {
				user_id : user_id,
				user_name : user_name,
				user_email : user_email
		},
		success : function(result){
			var obj = JSON.parse(result);
			if(obj=='null'||obj==''){
				alert('비밀번호 찾기 실패');
			}else {
				alert('사용자의 비밀번호는 '+obj+'입니다.');
				window.location.replace("Hfashion");
				return ;
			}
		},
		error : function(e){
			console.log(e);
		}
	})
}
</script>
</div>
<%@ include file="../layout/footer.jsp"%>